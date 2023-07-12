import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import 'constant/dbConstant.dart';

class  DbFunction{

  Future getMyDatabasePath() async {
    String path = await getDatabasesPath();

    return join(path, dbName);
  }

  Future<Database> getMyDatabaseInstance() async {
    String filepath = await getMyDatabasePath();
    return openDatabase(
      filepath,
      version: dbVersion,
      onCreate: (db, version) => onCreate(db),
      onUpgrade: (db, oldVersion, newVersion) => onUpgrade(db),
    );
  }
  onCreate(Database db) {
    String cartTable =
        ' create table $cartTableName ( $columId integer primary key autoincrement, $columName text,$columCount integer, $columPrice integer,$columTotal integer, $columImage text )';
    String favoriteTable =
        ' create table $favoriteTableName ( $columId integer primary key autoincrement, $columName text, $columPrice integer, $columImage text ,$columFavorite integer )';
    db.execute(cartTable);
    db.execute(favoriteTable);

  }

  onUpgrade(Database db) {
    var upgrade = 'drop table IF EXISTS $cartTableName';
    db.execute(upgrade);

    onCreate(db);

  }
}