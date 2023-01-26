import 'package:cart/models/localDbModel.dart';
import 'package:get/get.dart';

import '../repository/favoriteRepo.dart';

class FavoriteController extends GetxController {
  RxBool isFavorite = false.obs;
  RxInt t = 0.obs;

  var favoriteList = <LocalDrinkModel>[].obs;
  FavoriteRepo favoriteRepo = FavoriteRepo();

  selectFavorite(String name, int price, String image) {
    if (isFavorite.value) {
      isFavorite.value = false;
      t.value = 0;
    } else {
      isFavorite.value = true;
      t.value = 1;
    }

    favoriteRepo.saveToFavorite(name, price, image, t.value);
  }

  Future returnFromFavorite() async {
    var data = await favoriteRepo.returnFromFavorite();
    favoriteList.assignAll(data);
  }

  void deleteFromFavorite(int? id, int index) {
    favoriteRepo.deleteFromFavorite(id);
    favoriteList.removeAt(index);
  }
}
