import 'package:cart/models/cafeModel.dart';

import '../dataBase/webService/cafeWebService.dart';

class CafeRepo {
final  CafeWebService? _webService ;

 CafeRepo(this._webService);
  Future<List<CafeModel>> getHotCoffee() async {
    var hotCoffee = await _webService!.getHotCoffee();

    return hotCoffee
        .map((oneHotCoffee) => CafeModel.fromJson(oneHotCoffee))
        .toList();
  }

  Future<List<CafeModel>> getIcedCoffee() async {
    var iceCoffee = await _webService!.getIcedCoffee();

    return iceCoffee
        .map((oneIceCoffee) => CafeModel.fromJson(oneIceCoffee))
        .toList();
  }
}
