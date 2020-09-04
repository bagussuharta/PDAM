import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

final String tablename = "todo";
final String Column_id = "id";
final String Coulmn_name = "nama";
final String Column_alamat = "alamat";
final String Column_noHp = "noHp";

class TaskModel {
  final String nama;
  final String alamat;
  final String noHp;
  int id;

  TaskModel({this.nama, this.id, this.alamat, this.noHp});

  Map<String, dynamic> toMap() {
    return {"nama": this.nama, "alamat": this.alamat, "noHp": this.noHp};
  }
}

class TodoHelper {
  Database db;
  TodoHelper() {
    initdatabase();
  }
  Future<void> initdatabase() async {
    db = await openDatabase(join(await getDatabasesPath(), "my_db.db"),
        onCreate: (db, version) {
      return db.execute(
          "CREATE TABLE $tablename($Column_id INTEGER PRIMARY KEY AUTOINCREMENT, $Coulmn_name TEXT)");
    }, version: 1);
  }

  Future<void> insertTask(TaskModel task) async {
    try {
      db.insert(tablename, task.toMap(),
          conflictAlgorithm: ConflictAlgorithm.replace);
    } catch (_) {
      print(_);
    }
  }

  Future<List<TaskModel>> getAllTask() async {
    final List<Map<String, dynamic>> tasks = await db.query(tablename);

    return List.generate(tasks.length, (i) {
      return TaskModel(nama: tasks[i][Coulmn_name], id: tasks[i][Column_id]);
    });
  }
}
