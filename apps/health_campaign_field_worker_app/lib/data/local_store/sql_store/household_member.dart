import 'package:drift/drift.dart';

class HouseholdMemberTable extends Table {
  TextColumn get clientReferenceId => text().unique()();

  @override
  Set<Column>? get primaryKey => {  };
}