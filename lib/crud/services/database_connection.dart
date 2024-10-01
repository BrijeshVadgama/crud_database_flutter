import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class MyDatabase {
  Future<Database> initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'my_database.db'),
      version: 1,
      onCreate: (db, version) {
        db.execute(
          'CREATE TABLE USER(UserID INTEGER PRIMARY KEY AUTOINCREMENT, UserName TEXT, UserCity TEXT)',
        );
      },
    );
  }

  Future<void> insertUser(String name, String city) async {
    final Database db = await initDatabase();

    // Create a map of the data you want to insert
    Map<String, dynamic> user = {
      'Name': name,
      'City': city,
    };

    // Insert the user data into the Tbl_User table
    await db.insert(
      'Tbl_User',
      user,
      conflictAlgorithm:
          ConflictAlgorithm.replace, // This will replace any duplicate entries
    );
  }
}
