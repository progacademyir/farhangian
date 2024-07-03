import 'package:platformchannels/db/devices.dart';
import 'package:platformchannels/db/users.dart';
import 'package:path/path.dart';
import 'package:sqflite_common_ffi/sqflite_ffi.dart';

class DBHandler {
  final String tbl_users = "users";
  final String tbl_devices = "devices";

  Future<Database> initDB() async {
    String path = await getDatabasesPath();
    return openDatabase(join(path, 'db.db'),
        onCreate: (database, version) async {
      await database.execute(
          "CREATE TABLE $tbl_users(id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "password TEXT NOT NULL, autologin TEXT NOT NULL, pattern TEXT NOT NULL, language TEXT)");
      await database.execute(
          "CREATE TABLE $tbl_devices(id INTEGER PRIMARY KEY AUTOINCREMENT,"
          "name TEXT NOT NULL, password TEXT NOT NULL, model TEXT NOT NULL)");
    }, version: 1);
  }

  Future<int> insertUsers(Users users) async {
    final Database db = await initDB();
    var result = await db.insert(tbl_users, users.toMap());
    print('Insert data status: $result');
    return result;
  }

  Future<List<Users>> getUsersList() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> result = await db.query(tbl_users);
    var mylists = result.map((e) => Users.fromMap(e)).toList();
    return mylists;
  }

  Future<void> UpdatePassword(String password) async {
    final Database db = await initDB();
    var data = {'password': password};
    await db.update(tbl_users, data, where: "id = ?", whereArgs: [1]);
  }

  Future<void> UpdatePattern(String pattern) async {
    final Database db = await initDB();
    var data = {'pattern': pattern};
    await db.update(tbl_users, data, where: "id = ?", whereArgs: [1]);
  }

  Future<void> UpdateRemember(String autologin) async {
    final Database db = await initDB();
    var data = {'autologin': autologin};
    await db.update(tbl_users, data, where: "id = ?", whereArgs: [1]);
  }

  Future<List<Users>> getUserLogin() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> result = await db.query(tbl_users);
    var mylists = result.map((e) => Users.fromMap(e)).toList();
    return mylists;
  }

  Future<List<Users>> getUsersSelect(String id) async {
    final Database db = await initDB();
    final List<Map<String, Object?>> res = await db.query(
      tbl_users,
      where: "username = ?",
      whereArgs: [id],
    );
    var mylists = res.map((e) => Users.fromMap(e)).toList();
    return mylists;
  }

  Future<void> UpdateUsers(String password, String autologin, String pattern,
      String language, int id) async {
    final Database db = await initDB();
    var data = {
      'password': password,
      'autologin': autologin,
      'pattern': pattern,
      'language': language,
    };
    await db.update(tbl_users, data, where: "id = ?", whereArgs: [id]);
  }

  Future<void> DeleteIdUsers() async {
    final Database db = await initDB();
    var data = {
      'username': ' ',
      'password': '3545345345',
      'mute': null,
      'user': null,
      'pass': null,
    };
    await db.update(tbl_users, data, where: "id = ?", whereArgs: [1]);
  }

  Future<void> DeleteUsers(int id) async {
    final Database db = await initDB();
    var res = await db.delete(tbl_users, where: "id = ?", whereArgs: [id]);
    print("delete: $res");
  }

////////////////////////////////// Accounts /////////////////////////////////////////////////////

  Future<int> insertDevices(Devices devices) async {
    final Database db = await initDB();
    var result = await db.insert(tbl_devices, devices.toMap());
    print('Insert data status: $result');
    return result;
  }

  Future<List<Devices>> getDevicesList() async {
    final Database db = await initDB();
    final List<Map<String, Object?>> result = await db.query(tbl_devices);
    var mylists = result.map((e) => Devices.fromMap(e)).toList();
    return mylists;
  }

  Future<void> UpdateDevice(
      int id, String name, String password, String model) async {
    final Database db = await initDB();
    var data = {
      'name': name,
      'password': password,
      'model': model,
    };
    await db.update(tbl_devices, data, where: "id = ?", whereArgs: [id]);
  }

  // Future<Database> initDBaccounts() async {
  //   String path = await getDatabasesPath();
  //   return openDatabase(join(path, 'accounts.db'),
  //       onCreate: (database, version) async {
  //     await database.execute(
  //         "CREATE TABLE $tbl_accounts(id INTEGER PRIMARY KEY AUTOINCREMENT,"
  //         "password TEXT NOT NULL, autologin TEXT NOT NULL, pattern TEXT, language TEXT)");
  //   }, version: 1);
  // }

  // Future<int> insertAccounts(String password, String autologin, String pattern,
  //     String language) async {
  //   final Database dbaccounts = await initDBaccounts();
  //   var data = {
  //     'password': password,
  //     'autologin': autologin,
  //     'pattern': pattern,
  //     'language': language,
  //   };
  //   var result = await dbaccounts.insert(tbl_accounts, data);
  //   print('Insert data status: $result');
  //   return result;
  // }

  // Future<List<Accounts>> getAccount() async {
  //   final Database dbaccounts = await initDBaccounts();
  //   final List<Map<String, Object?>> result = await dbaccounts.query(
  //     tbl_accounts,
  //     where: "id = ?",
  //     whereArgs: [1],
  //   );
  //   var mylists = result.map((e) => Accounts.fromMap(e)).toList();
  //   return mylists;
  // }

//////////////////////////////////// Setting ////////////////////////////////////////////////////

  Future<void> UpdateLang(String language) async {
    final Database db = await initDB();
    var data = {'language': language};
    await db.update(tbl_users, data, where: "id = ?", whereArgs: [1]);
  }
}
