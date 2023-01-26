import 'package:cart/models/cafeModel.dart';
import 'package:cart/repository/cafeRepo.dart';
import 'package:cart/repository/drinksRepo.dart';
import 'package:get/get.dart';

import '../../models/drinkModel.dart';

class CafeController extends GetxController {
  RxInt select = 0.obs;
   final CafeRepo? _cafeRepo ;
  final DrinksRepo? _drinksRepo;
  var listHotCoffee = RxList<CafeModel>([]);
  var listIceCoffee = RxList<CafeModel>([]);
  var listCocktail = RxList<Drink>([]);
  var listOrdinaryDrink = RxList<Drink>([]);
  var isLoading = RxBool(true);
  CafeController(this._cafeRepo, this._drinksRepo);


  @override
  void onInit() {
    getHotCoffee();
    getIcedCoffee();
    ordinaryDrink();
    cocktailDrink();
    super.onInit();
  }

  Future getHotCoffee() async {
    try {
      isLoading(true);
      var hotCoffee = await _cafeRepo!.getHotCoffee();
      listHotCoffee.assignAll(hotCoffee);
    } finally {
      isLoading(false);
    }
  }

  Future getIcedCoffee() async {
    try {
      isLoading(true);
      var iceCoffee = await _cafeRepo!.getIcedCoffee();
      listIceCoffee.assignAll(iceCoffee);
    } finally {
      isLoading(false);
    }
  }
  Future ordinaryDrink() async {
    try {
      isLoading(true);
      var drink = await _drinksRepo!.ordinaryDrink();
      listOrdinaryDrink.assignAll(drink);
    } finally {
      isLoading(false);
    }
  }
  Future cocktailDrink() async {
    try {
      isLoading(true);
      var drink = await _drinksRepo!.cocktailDrink();
      listCocktail.assignAll(drink);
    } finally {
      isLoading(false);
    }
  }
change(bool isSelect, int index){
    select.value=isSelect?index:0;






}
}
