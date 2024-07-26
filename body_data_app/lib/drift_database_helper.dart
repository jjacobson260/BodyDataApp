import 'package:body_data_app/drift_tables.dart';
import 'package:drift/drift.dart';
import 'drift_database.dart';

part 'drift_database.g.dart';

class DriftDatabaseHelper<T extends Table> {
  final AppDatabase db;

  DriftDatabaseHelper(this.db);

  Future<int> insert(T table, Map<String, dynamic> data) async {
    try {
      final query = into(table).insert(data);
      return await db.runQuery(query);
    } catch (e) {
      // Handle exceptions here, e.g., log the error, rethrow or return a specific error code
      rethrow; // For now, rethrow to propagate the error
    }
  }

  Future<List<Map<String, dynamic>>> getAll(T table) async {
    try {
      final query = select(table);
      return await db.query(query);
    } catch (e) {
      // Handle exceptions here
      rethrow;
    }
  }

  Future<int> update(T table, int id, Map<String, dynamic> data) async {
    try {
      final query = update(table)..where((t) => t.id.equals(id));
      return await db.runUpdate(query, variables: data);
    } catch (e) {
      // Handle exceptions here
      rethrow;
    }
  }

  Future<int> delete(T table, int id) async {
    try {
      final query = delete(table)..where((t) => t.id.equals(id));
      return await db.runDelete(query);
    } catch (e) {
      // Handle exceptions here
      rethrow;
    }
  }

}
