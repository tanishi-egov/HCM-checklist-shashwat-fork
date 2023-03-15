// Generated using mason. Do not modify by hand
import 'package:dart_mappable/dart_mappable.dart';
import 'package:drift/drift.dart';

import '../data_model.dart';
import '../../data/local_store/sql_store/sql_store.dart';

@MappableClass(ignoreNull: true)
class HouseholdSearchModel extends EntitySearchModel {
  final String? id;
  final int? memberCount;
  final List<String>? clientReferenceId;
  final String? tenantId;
  final bool? isDeleted;
  
  HouseholdSearchModel({
    this.id,
    this.memberCount,
    this.clientReferenceId,
    this.tenantId,
    this.isDeleted,
    super.boundaryCode,
  }):  super();
}

@MappableClass(ignoreNull: true)
class HouseholdModel extends EntityModel {
  final String? id;
  final int? memberCount;
  final String clientReferenceId;
  final String? tenantId;
  final String createdBy;
  final bool? isDeleted;
  final int? rowVersion;
  final AddressModel? address;
  final DateTime createdAtTime;
  

  HouseholdModel({
    this.id,
    this.memberCount,
    required this.clientReferenceId,
    this.tenantId,
    required this.createdBy,
    this.isDeleted,
    this.rowVersion,
    this.address,
    required int createdAt,
    super.auditDetails,
  }): createdAtTime = DateTime.fromMillisecondsSinceEpoch(createdAt),
       super();

  int  get createdAt => createdAtTime.millisecondsSinceEpoch;
  

  HouseholdCompanion get companion {
    return HouseholdCompanion(
      auditCreatedBy: Value(auditDetails?.createdBy),
      auditCreatedTime: Value(auditDetails?.createdTime),
      auditModifiedBy: Value(auditDetails?.lastModifiedBy),
      auditModifiedTime: Value(auditDetails?.lastModifiedTime),
      id: Value(id),
      memberCount: Value(memberCount),
      clientReferenceId: Value(clientReferenceId),
      tenantId: Value(tenantId),
      createdBy: Value(createdBy),
      isDeleted: Value(isDeleted),
      rowVersion: Value(rowVersion),
      createdAt: Value(createdAt),
      );
  }
}
