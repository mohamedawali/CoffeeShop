import 'package:cart/dbFunction.dart';
import 'package:cart/dbAbstractFunction.dart';
import 'package:cart/models/localDbModel.dart';

import 'package:sqflite/sqflite.dart';
import 'package:sqflite_common/sqlite_api.dart';

import '../../constant/dbConstant.dart';

class DbCartTable with DbAbstractFunction, DbFunction {
  @override
  Future delete(int? id) async {
    var instance = await getMyDatabaseInstance();
    var i = await instance
        .delete(cartTableName, where: '$columId=?', whereArgs: [id]);
  }

  @override
  Future insertInTable(Map<String, dynamic> data) async {
    Database db = await getMyDatabaseInstance();

    try {
      await db.insert(cartTableName, data).then((value) => print('save'));
    } on DatabaseException catch (e) {
      print('err${e}');
    }
  }

  @override
  Future<List<Map<String, dynamic>>> returnFromTable() async {
    Database db = await getMyDatabaseInstance();

    var query = await db.query(cartTableName);

    return query;
  }
}
