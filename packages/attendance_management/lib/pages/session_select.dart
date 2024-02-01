import 'package:attendance_management/blocs/date_session_bloc.dart';
import 'package:attendance_management/models/enum_values.dart';
import 'package:attendance_management/models/enum_values.mapper.g.dart';
import 'package:digit_components/digit_components.dart';
import 'package:digit_components/widgets/atoms/digit_radio_button_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:reactive_forms/reactive_forms.dart';

import '../../utils/i18_key_constants.dart' as i18;
import '../../widgets/localized.dart';
import '../blocs/app_localization.dart';
import '../blocs/attendance_individual_bloc.dart';
import '../models/attendance_register.dart';
import '../utils/date_util_attendance.dart';
import '../widgets/back_navigation_help_header.dart';
import 'mark_attendance.dart';

class AttendanceDateSessionSelectionPage extends LocalizedStatefulWidget {
  final List<AttendancePackageRegisterModel> registers;
  final String registerID;
  const AttendanceDateSessionSelectionPage({
    required this.registers,
    required this.registerID,
    super.key,
    super.appLocalizations,
  });

  @override
  State<AttendanceDateSessionSelectionPage> createState() =>
      _AttendanceDateSessionSelectionPageState();
}

class _AttendanceDateSessionSelectionPageState
    extends State<AttendanceDateSessionSelectionPage> {
  static const _dateOfSession = 'dateOfSession';
  static const _sessionRadio = 'sessionRadio';
  List<String> attendeeList = [];
  String missedDays = "";
  DateSessionBloc sessionBloc = DateSessionBloc(const DateSessionLoading());
  AttendanceIndividualBloc individualLogBloc = AttendanceIndividualBloc();

  @override
  void initState() {
    super.initState();
  }

  @override
  void deactivate() {
    super.deactivate();
  }

  @override
  void dispose() {
    // Clear the data when the widget is disposed

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final localizations = AttendanceLocalization.of(context);

    return Scaffold(
        body: BlocProvider<DateSessionBloc>(
            create: (context) => sessionBloc
              ..add(
                LoadSelectedRegisterData(
                  registers: widget.registers,
                  registerID: widget.registerID,
                ),
              ),
            child: BlocProvider<AttendanceIndividualBloc>(
              create: (context) => individualLogBloc,
              child: BlocBuilder<DateSessionBloc, DateSessionStates>(
                  builder: (ctx, registerState) {
                return registerState.maybeWhen(
                    orElse: () => const SizedBox.shrink(),
                    dateSessionLoaded: (selectedRegister) =>
                        ReactiveFormBuilder(
                          form: () => buildForm(
                            context,
                          ),
                          builder: (context, form, child) {
                            return ScrollableContent(
                              header: const BackNavigationHelpHeaderWidget(
                                showHelp: false,
                                showLogoutCTA: false,
                              ),
                              enableFixedButton: true,
                              footer: DigitCard(
                                margin: const EdgeInsets.fromLTRB(
                                    0, kPadding, 0, 0),
                                padding: const EdgeInsets.fromLTRB(
                                    kPadding, 0, kPadding, 0),
                                child: isAttendanceCompleted(
                                        form.control(_dateOfSession).value)
                                    ? // view attendance button
                                    DigitElevatedButton(
                                        child: Text(localizations.translate(
                                          i18.attendance.viewAttendance,
                                        )),
                                        onPressed: () {
                                          DateTime s = form
                                              .control(_dateOfSession)
                                              .value;

                                          final entryTime = selectedRegister
                                                          .additionalDetails?[
                                                      'sessions'] ==
                                                  2
                                              ? AttendanceDateTimeManagement
                                                  .getMillisecondEpoch(
                                                  s,
                                                  form
                                                              .control(
                                                                  _sessionRadio)
                                                              .value !=
                                                          null
                                                      ? form
                                                          .control(
                                                              _sessionRadio)
                                                          .value
                                                          .key
                                                      : 0,
                                                  "entryTime",
                                                )
                                              : (DateTime(s.year, s.month,
                                                          s.day, 9)
                                                      .millisecondsSinceEpoch) ~/
                                                  1000;

                                          final exitTime = selectedRegister
                                                          .additionalDetails?[
                                                      'sessions'] ==
                                                  2
                                              ? AttendanceDateTimeManagement
                                                  .getMillisecondEpoch(
                                                  s,
                                                  form
                                                              .control(
                                                                  _sessionRadio)
                                                              .value !=
                                                          null
                                                      ? form
                                                          .control(
                                                              _sessionRadio)
                                                          .value
                                                          .key
                                                      : 1,
                                                  "exitTime",
                                                )
                                              : (DateTime(s.year, s.month,
                                                          s.day, 18)
                                                      .millisecondsSinceEpoch) ~/
                                                  1000;

                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  MarkAttendancePage(
                                                attendees: selectedRegister
                                                            .attendees !=
                                                        null
                                                    ? selectedRegister
                                                        .attendees!
                                                    : [],
                                                dateTime: s,
                                                entryTime: entryTime,
                                                exitTime: exitTime,
                                                registerId: selectedRegister.id,
                                                tenantId: selectedRegister
                                                    .tenantId
                                                    .toString(),
                                              ),
                                            ),
                                          );
                                        },
                                      )
                                    : DigitElevatedButton(
                                        child: Text(localizations.translate(
                                          i18.attendance.viewAttendance,
                                        )),
                                        onPressed: () {
                                          if (form
                                                  .control(_sessionRadio)
                                                  .value ==
                                              null) {
                                            form
                                                .control(_sessionRadio)
                                                .setErrors({'': true});
                                          }
                                          form.markAllAsTouched();

                                    if (!form.valid) {
                                      return;
                                    } else {
                                      DateTime s =
                                          form.control(_dateOfSession).value;

                                      final entryTime = selectedRegister
                                                      .additionalDetails?[
                                                  EnumValues.sessions
                                                      .toValue()] ==
                                              2
                                          ? AttendanceDateTimeManagement
                                              .getMillisecondEpoch(
                                              s,
                                              form
                                                          .control(
                                                              _sessionRadio)
                                                          .value !=
                                                      null
                                                  ? form
                                                      .control(_sessionRadio)
                                                      .value
                                                      .key
                                                  : 0,
                                              EnumValues.entryTime.toValue(),
                                            )
                                          : (DateTime(s.year, s.month, s.day, 9)
                                                  .millisecondsSinceEpoch) ~/
                                              1000;

                                      final exitTime = selectedRegister
                                                      .additionalDetails?[
                                                  EnumValues.sessions
                                                      .toValue()] ==
                                              2
                                          ? AttendanceDateTimeManagement
                                              .getMillisecondEpoch(
                                              s,
                                              form
                                                          .control(
                                                              _sessionRadio)
                                                          .value !=
                                                      null
                                                  ? form
                                                      .control(_sessionRadio)
                                                      .value
                                                      .key
                                                  : 1,
                                              EnumValues.exitTime.toValue(),
                                            )
                                          : (DateTime(s.year, s.month, s.day,
                                                      18)
                                                  .millisecondsSinceEpoch) ~/
                                              1000;

                                            Navigator.of(context).push(
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    MarkAttendancePage(
                                                  attendees: selectedRegister
                                                              .attendees !=
                                                          null
                                                      ? selectedRegister
                                                          .attendees!
                                                      : [],
                                                  dateTime: s,
                                                  entryTime: entryTime,
                                                  exitTime: exitTime,
                                                  registerId:
                                                      selectedRegister.id,
                                                  tenantId: selectedRegister
                                                      .tenantId
                                                      .toString(),
                                                ),
                                              ),
                                            );
                                          }
                                        },
                                      ),
                              ),
                              children: [
                                DigitCard(
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        localizations.translate(
                                          i18.attendance.selectSession,
                                        ),
                                        style: DigitTheme.instance.mobileTheme
                                            .textTheme.headlineLarge,
                                      ),
                                      DigitDateFormPicker(
                                        start: selectedRegister.startDate !=
                                                null
                                            ? DateTime
                                                .fromMillisecondsSinceEpoch(
                                                    selectedRegister.startDate!)
                                            : null,
                                        end: selectedRegister.endDate != null
                                            ? selectedRegister.endDate! <
                                                    DateTime.now()
                                                        .millisecondsSinceEpoch
                                                ? DateTime
                                                    .fromMillisecondsSinceEpoch(
                                                        selectedRegister
                                                            .endDate!)
                                                : DateTime.now()
                                            : null,
                                        label: localizations.translate(
                                          i18.attendance.dateOfSession,
                                        ),
                                        formControlName: _dateOfSession,
                                        cancelText: localizations.translate(
                                            i18.common.coreCommonCancel),
                                        confirmText: localizations
                                            .translate(i18.common.coreCommonOk),
                                      ),
                                      if (selectedRegister.additionalDetails?[
                                              EnumValues.sessions.toValue()] ==
                                          2)
                                        DigitRadioButtonList<KeyValue>(
                                          errorMessage: localizations.translate(
                                              i18.attendance.plzSelectSession),
                                          formControlName: _sessionRadio,
                                          options: [
                                            KeyValue(
                                                i18.attendance.morningSession,
                                                0),
                                            KeyValue(
                                                i18.attendance.eveningSession,
                                                1),
                                          ],
                                          valueMapper: (value) {
                                            return value.label;
                                          },
                                        ),
                                      // temporarily commented
                                      // CustomInfoCard(
                                      //   title:
                                      //       " ${localizations.translate(i18.attendance.missedAttendanceInfo)}",
                                      //   description:
                                      //       " ${localizations.translate(i18.attendance.missedAttendanceDesc)}",
                                      // ),
                                    ],
                                  ),
                                ),
                                DigitInfoCard(
                                  title: localizations.translate(
                                    'Missed Attendance!',
                                  ),
                                  description: localizations.translate(
                                    getMissedDays(),
                                  ),
                                ),
                              ],
                            );
                          },
                        ));
              }),
            )));
  }

  FormGroup buildForm(BuildContext ctx) {
    return fb.group(<String, Object>{
      _dateOfSession:
          FormControl<DateTime>(value: DateTime.now(), validators: []),
      _sessionRadio: FormControl<KeyValue>(value: null),
    });
  }

  String getMissedDays() {
    for (var element in widget.registers) {
      if (element.id == widget.registerID) {
        if (element.attendanceLog != null) {
          for (var element in element.attendanceLog!) {
            element.forEach((key, value) {
              if (value == false) {
                missedDays += "${key.day}/${key.month}/${key.year}, /n";
              }
            });
          }
        }
      }
    }
    return "${missedDays}Please ensure you mark attendance for the missing days";
  }

  isAttendanceCompleted(DateTime selectedDate) {
    // [TODO: Test if this is working as expected]
    for (var register in widget.registers) {
      if (register.attendanceLog != null) {
        for (var log in register.attendanceLog!) {
          if (log.keys.first == selectedDate && log.values.first == true) {
            return true;
          }
        }
      }
    }
    return false;
  }
}

class KeyValue {
  String label;
  dynamic key;
  KeyValue(this.label, this.key);
}
