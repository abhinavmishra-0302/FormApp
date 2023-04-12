import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/database_model.dart';

class SQLiteService{
  Future<Database> initializeDB() async{
    String path = await getDatabasesPath();

    return openDatabase(
      join(path, "databases.db"),
      onCreate: (database, version) async {
        await database.execute(
            "CREATE TABLE IF NOT EXISTS Info(name TEXT NOT NULL,lastName TEXT NOT NULL, mobile TEXT NOT NULL, product TEXT NOT NULL, e_mail TEXT UNIQUE NOT NULL, PRIMARY KEY(name,e_mail))",
        );
      },
      version: 1
    );
  }

  Future<int> insertItem(Info info) async{
    final Database db = await initializeDB();

    final id = db.insert("Info", info.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
    
    // db.update("Info", values)

    return id;
  }

  Future<List<Info>> getItems() async {
    final db = await initializeDB();
    final List<Map<String, Object?>> queryResult = await db.query("Info",);


    return queryResult.map((e) => Info.fromMap(e)).toList();
  }
  
  Future<int> deleteItem(Info info) async{
    final Database db = await initializeDB();
    
    final id = db.delete("Info", where: "name = ? AND e_mail = ?", whereArgs: [info.name, info.eMail]);

    return id;
  }

  Future<int> updateItem(Info info, String name, String eMail) async{
    final Database db = await initializeDB();

    final count = db.update("Info", info.toMap(), where: "name = ? AND e_mail = ?", whereArgs: [name, eMail]);

    return count;
  }
}