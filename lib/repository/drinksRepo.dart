import 'package:cart/models/drinkModel.dart';

import '../dataBase/webService/drinkWebService.dart';

class DrinksRepo {
 final DrinksService? _drinksService ;

  DrinksRepo(this._drinksService);

  Future<List<Drink>> ordinaryDrink() async {
    var allDrinks = await _drinksService!.ordinaryDrink();
    var drinksModel =
        allDrinks.values.map((e) => DrinkModel.fromJson(allDrinks)).toList();


    return drinksModel[0].drinks!.toList();
  }

  Future<List<Drink>> cocktailDrink() async {
    var allDrinks = await _drinksService!.cocktailDrink();
    var drinksModel =
        allDrinks.values.map((e) => DrinkModel.fromJson(allDrinks)).toList();

    return drinksModel[0].drinks!.toList();
  }
}
