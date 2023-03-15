// Generated using mason. Do not modify by hand

import 'package:drift/drift.dart';

class ProjectFacility extends Table {
  TextColumn get id => text()();
  TextColumn get facilityId => text()();
  TextColumn get projectId => text()();
  TextColumn get auditCreatedBy => text().nullable()();
  IntColumn get auditCreatedTime => integer().nullable()();
  TextColumn get auditModifiedBy => text().nullable()();
  IntColumn get auditModifiedTime => integer().nullable()();
  TextColumn get tenantId => text().nullable()();
  TextColumn get createdBy => text()();
  BoolColumn get isDeleted => boolean().nullable()();
  IntColumn get rowVersion => integer().nullable()();
  IntColumn get createdAt => integer()();

  @override
  Set<Column> get primaryKey => {
        id,
        auditCreatedBy,
      };
}
