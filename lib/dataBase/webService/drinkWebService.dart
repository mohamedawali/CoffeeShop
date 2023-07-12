import 'package:cart/constant/api.dart';
import 'package:dio/dio.dart';

class DrinksService {
  Dio? _dio;

  DrinksService() {
    BaseOptions baseOptions = BaseOptions(baseUrl: drinksUrl);
    _dio = Dio(baseOptions);
  }
  Future<Map<String, dynamic>> ordinaryDrink() async {
    try {
      Response response = await _dio!
          .get('filter.php', queryParameters: {'c': 'Ordinary_Drink'});

      return response.data;
    } on DioError catch (e) {
      print('err${e.error}');
    }
    return {"bb": 0};
  }

  Future<Map<String, dynamic>> cocktailDrink() async {
    Response response =
        await _dio!.get('filter.php', queryParameters: {'c': 'Cocktail'});

    return response.data;
  }
}
