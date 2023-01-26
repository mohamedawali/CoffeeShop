import 'package:cart/dataBase/local/cartDataBase.dart';
import 'package:cart/get/cartGet.dart';
import 'package:cart/repository/cafeRepo.dart';
import 'package:cart/repository/cartRepo.dart';
import 'package:cart/repository/drinksRepo.dart';
import 'package:get/get.dart';


import 'dataBase/webService/cafeWebService.dart';
import 'dataBase/webService/drinkWebService.dart';
import 'get/cafeGet.dart';

class Binding implements  Bindings{
  CafeRepo? _cafeRepo;
  DrinksRepo? _drinksRepo;
  CartRepo? _cartRepo;


  Binding(){

    _cafeRepo = CafeRepo(CafeWebService());
    _drinksRepo = DrinksRepo(DrinksService());
_cartRepo=CartRepo(DbCartTable());
  }
  @override
  void dependencies() {
Get.put<CartController>(CartController(_cartRepo));
    Get.put<CafeController>(CafeController(_cafeRepo, _drinksRepo));

  }

}