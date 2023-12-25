
  import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DatabaseConnection {
    Future<Database> setDatabase() async {
      var directory = await getApplicationDocumentsDirectory();

      var path = join(directory.path , 'db_crud');
      var database = await openDatabase(
          path , version: 1 , onCreate: createdatabase);
      return database;



    }
    Future <void> createdatabase(Database database , int versiob) async {
      String sql = "CREATE TABLE PRODUCTS (id INTEGER PRIMARY KEY ,"
          " name TEXT, price INTEGER, pricebuy INTEGER, numberproduct INTEGER)";
      await database.execute(sql);
    }
  }