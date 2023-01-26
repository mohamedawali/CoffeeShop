import 'package:cart/constant/dbConstant.dart';
import 'package:cart/dbAbstractFunction.dart';
import 'package:sqflite/sqflite.dart';
import '../../dbFunction.dart';

class DbFavoriteTable with DbFunction, DbAbstractFunction {
  @override
  Future delete(int? id) async {
    var instance = await getMyDatabaseInstance();
    var i = await instance
        .delete(favoriteTableName, where: '$columId=?', whereArgs: [id]);

  }

  @override
  Future insertInTable(Map<String, dynamic> data) async {
    Database db = await getMyDatabaseInstance();

    try {
      await db.insert(favoriteTableName, data).then((value) => print('save'));
    } on DatabaseException catch (e) {
      print('err${e}');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> returnFromTable() async {
    Database db = await getMyDatabaseInstance();

    var query = await db.query(favoriteTableName);

    return query;
  }
}
