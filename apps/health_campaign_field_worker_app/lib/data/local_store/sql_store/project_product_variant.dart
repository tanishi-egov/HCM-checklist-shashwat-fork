import 'package:drift/drift.dart';

class ProjectProductVariantTable extends Table {
  TextColumn get clientReferenceId => text().unique()();

  @override
  Set<Column>? get primaryKey => {  };
}