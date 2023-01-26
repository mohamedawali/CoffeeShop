import 'package:cart/dataBase/local/cartDataBase.dart';

import '../models/localDbModel.dart';

class CartRepo {
  DbCartTable? dbCartTable;

  CartRepo(this.dbCartTable);
  Future addToCart(
    var name,
    int count,
    int price,
    int total,
    String image,
  ) async {
    LocalDrinkModel data = LocalDrinkModel(
        productName: name,
        productCount: count,
        productPrice: price,
        productTotal: total,
        productImage: image);
    var saveDrink = data.saveCartDrink();
    await dbCartTable!.insertInTable(saveDrink);
  }

  Future<List<LocalDrinkModel>> returnFromCart() async {
    var list = await dbCartTable!.returnFromTable();

    var list2 =
        list.map((element) => LocalDrinkModel.getCartDrinks(element)).toList();

    return list2;
  }

  Future delete(int? id) async {
    await dbCartTable!.delete(id);
  }
}
