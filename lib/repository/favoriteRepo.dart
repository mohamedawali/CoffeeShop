import 'package:cart/dataBase/local/favoriteDataBase.dart';
import 'package:cart/models/localDbModel.dart';

class FavoriteRepo{

  DbFavoriteTable dbFavorite=DbFavoriteTable();
  void saveToFavorite(String name, int price, String image, int value) {
 LocalDrinkModel localDrinkModel=   LocalDrinkModel(productName: name,productPrice: price,productImage: image,selectFavorite:value);
 var saveDrink = localDrinkModel.saveFavoriteDrink();
    dbFavorite.insertInTable(saveDrink);

  }
  Future<List<LocalDrinkModel>> returnFromFavorite()async{
    var favoriteList =await dbFavorite.returnFromTable();

    var list2 =
    favoriteList.map((element) => LocalDrinkModel.getCartDrinks(element)).toList();

    return list2;
  }

  void deleteFromFavorite(int? id) {
    dbFavorite.delete(id);
  }
}