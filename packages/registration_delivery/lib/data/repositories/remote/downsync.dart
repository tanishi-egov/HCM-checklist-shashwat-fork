// Generated using mason. Do not modify by hand

import 'package:digit_data_model/data_model.dart';
import 'package:registration_delivery/models/entities/downsync.dart';

class DownsyncRemoteRepository
    extends RemoteRepository<DownsyncModel, DownsyncSearchModel> {
  DownsyncRemoteRepository(
    super.dio, {
    required super.actionMap,
    super.entityName = 'Downsync',
  });

  @override
  DataModelType get type => DataModelType.downsync;
}
