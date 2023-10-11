import 'package:coba_storage/model/m_contact_model.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static DatabaseHelper? _databaseHelper;
  static Database? _database;

  DatabaseHelper._internal() {
    _databaseHelper = this;
  }

  factory DatabaseHelper() => _databaseHelper ?? DatabaseHelper._internal();

  Future<Database> get database async {
    _database = await _initializeDB();
    return _database!;
  }

  final String tablename = "contact";

  Future<Database> _initializeDB() async {
    var db = await openDatabase(
      'contacts_db.db',
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''CREATE TABLE $tablename(
          id INTEGER PRIMARY KEY AUTOINCREMENT, 
          contactName TEXT, 
          contactNumber TEXT
        )''');
      },
    );
    return db;
  }

  Future<void> instertContact(ContactModel contactModel) async {
    final Database db = await database;
    await db.insert(tablename, contactModel.toMap());
  }

  Future<List<ContactModel>> getContacts() async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(tablename);
    return result.map((e) => ContactModel.fromMap(e)).toList();
  }

  Future<ContactModel> getContactById(int id) async {
    final Database db = await database;
    List<Map<String, dynamic>> result = await db.query(
      tablename,
      where: 'id = ?',
      whereArgs: [id],
    );
    return result.map((e) => ContactModel.fromMap(e)).first;
  }

  Future<void> updateContact(ContactModel contactModel) async {
    final db = await database;
    await db.update(
      tablename,
      contactModel.toMap(),
      where: 'id = ?',
      whereArgs: [contactModel.id],
    );
  }

  Future<void> deleteTask(int id) async {
    final db = await database;
    await db.delete(
      tablename,
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
