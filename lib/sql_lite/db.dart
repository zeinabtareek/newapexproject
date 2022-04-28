// import 'package:path_provider/path_provider.dart';
// import 'package:sqflite/sqflite.dart';
// import 'package:path/path.dart';
//
// class DataBaseServices {
//
//   static final _databaseName ='MyDatabase.db';
//   static final _databaseVersion =1;
//   static final comInfoTable ='com_info';
//   static final columnId ='_id';
//   static final columnDB ='db';
//   static final columnIP ='_ip';
//   static final columnPortNum ='portNum';
//   static final columnpassword ='password';
//   static final columnUserName ='userName';
//   static final columnUserType ='userType';
//   static final columnShowReportsOnly ='showReportsOnly';
//   static final columnCpu ='cpu';
//   static final columnPermisson ='permisson';
//   static final columnCompanyName ='companyName';
//   static final columnEnCurrency ='enCurrency';
//   static final columnArCurrency ='arCurrency';
//   static final columnSerialNumber ='serialNumber';
//   static final columnActive ='active';
//
//
//
//   // DataBaseServices._();
//
//   static Database? _database;
//   DataBaseServices._privateConstructor();
//   static final DataBaseServices instance= DataBaseServices._privateConstructor();
//
//   Future<Database> initializeDB() async {
//     String path = await getDatabasesPath();
//     return openDatabase(
//       join(path, 'example.db'),
//       onCreate: (database, version) async {
//         await database.execute(
//           "CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT NOT NULL,age INTEGER NOT NULL, country TEXT NOT NULL, email TEXT)",
//         );
//       },
//       version: 1,
//     );
//   }
//
//
//
//
//   Future<Database> get database async{
//     if(_database !=null)return _database!;
//     _database=await _initDatabase();
//     return _database!;
//   }
//
//   _initDatabase()async{
//     Directory documentsDirevtory = await getApplicationDocumentsDirectory();
//     String path = join(documentsDirevtory.path,_databaseName);
//     return await openDatabase(path,version: _databaseVersion,onCreate: _onCreate);
//   }
//
//   void _onCreate(Database db ,int version)async{
//     await db.execute('''
//     CREATE TABLE $comInfoTable(
//       $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
//       $columnIP TEXT NOT NULL,
//       $columnDB TEXT NOT NULL UNIQUE,
//       $columnPortNum TEXT NOT NULL,
//       $columnUserName TEXT NOT NULL,
//       $columnPermisson TEXT NOT NULL,
//       $columnSerialNumber TEXT NOT NULL,
//       $columnPortNum TEXT NOT NULL,
//       $columnArCurrency TEXT NOT NULL,
//       $columnCompanyName TEXT NOT NULL UNIQUE,
//       $columnCpu INTEGER NOT NULL,
//       $columnEnCurrency TEXT NOT NULL,
//       $columnActive INTEGER NOT NULL
//
//     )''');
//
//   }
//   /**************/
//
//
//
//   insert(Map<String ,dynamic> row , String table) async {
//    Database? db =await instance.database;
//    return await db!.update(table, row,where: '$columnCpu =?',whereArgs: [cpu]);
//   }
//
//   void <List<Map<String ,dynamic>>> queryAllRows(String table) async {
//     Database db =await instance.database;
//       return await db.query.(table)
//   }
//
//
//   Future <int> delete(int id ,String table) async {
//     Database db = await instance.databese;
//     return await db.delete(table,where: '$columnId =?',whereArgs: [id]);
//   }
// Future <int>
//
// }
// //
import 'package:newapexproject/enum/app_string.dart';
import 'package:newapexproject/model/cart_model.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'package:sqflite/sql.dart';

import '../constant.dart';

class CartDatabaseHelper {
  CartDatabaseHelper._();

  static final CartDatabaseHelper db = CartDatabaseHelper._();
  static Database? _database;

  Future<Database?> get database async {
    if (_database != null) return _database;
    _database = await initDb();
    return _database;
  }

  initDb() async {
    String path = join(await getDatabasesPath(), 'CartProduct.db');

    return await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute('''
         CREATE TABLE $tableCartProduct(

      $columnPrice INTEGER NOT NULL,
      $columnQuantity INTEGER NOT NULL,
      $columnImage TEXT NOT NULL,
      $columnName TEXT NOT NULL,
      $columnProductId TEXT NOT NULL
       )''');
    });

  }

  insert(CartProductModel model) async {
    var dbClient = await database;
    await dbClient!.insert(tableCartProduct, model.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<CartProductModel>> getAllProduct() async {
    var dbClient = await database;
    List<Map> maps = await dbClient!.query(tableCartProduct);
    List<CartProductModel> list = maps.isNotEmpty
        ? maps.map((product) => CartProductModel.fromJson(product)).toList()
        : [];
    return list;
  }

  updateProduct(CartProductModel model) async {
    var dbClient = await database;
    return await dbClient!.update(tableCartProduct, model.toJson(),
        where: '$columnProductId =?', whereArgs: [model.productId]);
  }

  deleteProduct(String name) async {
    var dbClient = await database;
    await dbClient!
        .delete(tableCartProduct, where: "$columnName = ?", whereArgs: [name]);
  }

  deleteAllProduct() async {
    var dbClient = await database;
    await dbClient!.delete(tableCartProduct);
  }
}
