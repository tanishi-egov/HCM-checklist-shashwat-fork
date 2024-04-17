// Import the required Dart I/O package
import 'dart:io';

// Define the main function
void main() {
  // Get the current directory path
  var appDir = Directory.current.path;

  // Define the paths for the application root and the files to be modified
  var appRoot = '$appDir/apps/health_campaign_field_worker_app/lib';
  var localizationDelegatesFilePath =
      '$appRoot/utils/localization_delegates.dart';
  var blocDirectoryPath = '$appRoot/blocs/attendance';
  var blocFilePath = '$blocDirectoryPath/hcm_attendance_bloc.dart';
  var networkManagerProviderWrapperFilePath =
      '$appRoot/widgets/network_manager_provider_wrapper.dart';

  // Define the import statement and delegate for localization
  var importStatement =
      "import 'package:attendance_management/blocs/app_localization.dart'\n    as attendance_localization;";
  var delegate =
      "attendance_localization.AttendanceLocalization.getDelegate(\n      getLocalizationString(\n        isar,\n        selectedLocale,\n      ),\n      appConfig.languages!,\n    ),";

  // Read the localization delegates file
  var localizationDelegatesFile = File(localizationDelegatesFilePath);
  var localizationDelegatesFileContent =
      localizationDelegatesFile.readAsStringSync();

  // Check if the import statement and delegate already exist in the file
  // If not, add them to the file
  if (!localizationDelegatesFileContent.contains(importStatement)) {
    localizationDelegatesFileContent =
        '$importStatement\n$localizationDelegatesFileContent';
    print('The import statement was added.');
  }

  if (!localizationDelegatesFileContent.contains(delegate)) {
    localizationDelegatesFileContent =
        localizationDelegatesFileContent.replaceFirst('];', '  $delegate\n];');
    print('The delegate was added.');
  }

  // Write the updated content back to the file
  localizationDelegatesFile.writeAsStringSync(localizationDelegatesFileContent);

  // Check if the Bloc file already exists
  // If not, create the directory and write the skeleton Bloc class to the file
  var blocFile = File(blocFilePath);
  if (!blocFile.existsSync()) {
    Directory(blocDirectoryPath).createSync(recursive: true);

    blocFile.writeAsStringSync('''
import 'package:attendance_management/blocs/attendance_listeners.dart';
import 'package:attendance_management/models/attendance_log.dart';
import 'package:attendance_management/models/attendance_register.dart';

class HcmAttendanceBloc extends AttendanceListeners {
  @override
  void callSyncMethod() {
    // TODO: implement callSyncMethod
  }

  @override
  Future<List<AttendanceRegisterModel>> getAttendanceRegisters() {
    // TODO: implement getAttendanceRegisters
    throw UnimplementedError();
  }

  @override
  Future<List<AttendanceLogModel>> searchAttendanceLog({required String registerId, required String tenantId, required int entryTime, required int exitTime, required int currentDate}) {
    // TODO: implement searchAttendanceLog
    throw UnimplementedError();
  }

  @override
  void submitAttendanceDetails(SubmitAttendanceDetails attendanceLogs) {
    // TODO: implement submitAttendanceDetails
  }
}
''');
    print('File $blocFilePath created.');
  } else {
    print('File $blocFilePath already exists. Not modifying the content.');
  }

  // Define the import statements and repository providers
  var importStatements = [
    "import '../data/repositories/local/attendance_logs.dart';",
    "import '../data/repositories/local/hcm_attendance.dart';",
    "import '../data/repositories/remote/attendance_logs.dart';",
    "import '../data/repositories/remote/hcm_attendance.dart';"
  ];
  var localRepositories = [
    "RepositoryProvider<\n          LocalRepository<HCMAttendanceRegisterModel,\n              HCMAttendanceSearchModel>>(\n        create: (_) => AttendanceLocalRepository(\n          sql,\n          AttendanceOpLogManager(isar),\n        ),\n      ),",
    "RepositoryProvider<\n          LocalRepository<HCMAttendanceLogModel, HCMAttendanceLogSearchModel>>(\n        create: (_) => AttendanceLogsLocalRepository(\n          sql,\n          AttendanceLogOpLogManager(isar),\n        ),\n      ),",
  ];

// Define the remote repositories of attendance
  var remoteRepositoriesOfAttendance = [
    "if (value == DataModelType.attendanceRegister)\n"
        "  RepositoryProvider<\n"
        "      RemoteRepository<HCMAttendanceRegisterModel,\n"
        "          HCMAttendanceSearchModel>>(\n"
        "    create: (_) =>\n"
        "        AttendanceRemoteRepository(dio, actionMap: actions),\n"
        "  )",
    "if (value == DataModelType.attendance)\n"
        "  RepositoryProvider<\n"
        "      RemoteRepository<HCMAttendanceLogModel,\n"
        "          HCMAttendanceLogSearchModel>>(\n"
        "    create: (_) =>\n"
        "        AttendanceLogRemoteRepository(dio, actionMap: actions),\n"
        "  )"
  ];

// Read the network_manager_provider_wrapper.dart file
  var networkManagerProviderWrapperFile =
      File(networkManagerProviderWrapperFilePath);
  var networkManagerProviderWrapperFileContent =
      networkManagerProviderWrapperFile.readAsStringSync();

// Find the last import statement in the file
  var lastImportIndex = networkManagerProviderWrapperFileContent
      .lastIndexOf(RegExp(r'import .+;'));

  if (lastImportIndex != -1) {
    var endOfLastImport = lastImportIndex +
        networkManagerProviderWrapperFileContent
            .substring(lastImportIndex)
            .indexOf(';') +
        1;

    // Check if the import statements already exist in the file
    for (var importStatement in importStatements) {
      if (!networkManagerProviderWrapperFileContent.contains(importStatement)) {
        // Add the import statement after the last import
        networkManagerProviderWrapperFileContent =
            networkManagerProviderWrapperFileContent.substring(
                    0, endOfLastImport) +
                '\n' +
                importStatement +
                networkManagerProviderWrapperFileContent
                    .substring(endOfLastImport);
        endOfLastImport += importStatement.length + 1;
        print('The import statement was added: $importStatement');
      }
    }
  }

// Check if the local repository providers already exist in the file
  for (var repositoryProvider in localRepositories) {
    if (!networkManagerProviderWrapperFileContent
        .contains(repositoryProvider)) {
      // Add the local repository provider to the file
      networkManagerProviderWrapperFileContent =
          networkManagerProviderWrapperFileContent.replaceFirst(
              '];', '  $repositoryProvider\n];');
      print('The local repository provider was added: $repositoryProvider');
    }
  }

// Normalize the whitespace in the file content and the remote repository of attendance
  var normalizedFileContent =
      networkManagerProviderWrapperFileContent.replaceAll(RegExp(r'\s'), '');

// Check if the remote repository of attendance already exists in the file
  for (var remoteRepositoryOfAttendance in remoteRepositoriesOfAttendance) {
    var normalizedRemoteRepositoryOfAttendance =
        remoteRepositoryOfAttendance.replaceAll(RegExp(r'\s'), '');

    if (!normalizedFileContent
        .contains(normalizedRemoteRepositoryOfAttendance)) {
      // Add the remote repository of attendance to the _getRemoteRepositories method
      var replacementString =
          networkManagerProviderWrapperFileContent.contains(']);')
              ? '  $remoteRepositoryOfAttendance,\n]);'
              : '  $remoteRepositoryOfAttendance\n]);';
      networkManagerProviderWrapperFileContent =
          networkManagerProviderWrapperFileContent.replaceFirst(
              ']);', replacementString);
      print(
          'The remote repository of attendance was added: $remoteRepositoryOfAttendance');
    } else {
      print('The remote repository of attendance already exists.');
    }
  }

  // Write the updated content back to the file
  networkManagerProviderWrapperFile
      .writeAsStringSync(networkManagerProviderWrapperFileContent);

  // Run dart format on the localization_delegates.dart file
  Process.run('dart', ['format', localizationDelegatesFilePath])
      .then((ProcessResult results) {
    print(results.stdout);
  });

  // Run dart format on the blocFilePath file
  Process.run('dart', ['format', blocFilePath]).then((ProcessResult results) {
    print(results.stdout);
  });

  // Run dart format on the network_manager_provider_wrapper.dart file
  Process.run('dart', ['format', networkManagerProviderWrapperFilePath])
      .then((ProcessResult results) {
    print(results.stdout);
  });
}
