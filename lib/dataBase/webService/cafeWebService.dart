import 'package:cart/constant/api.dart';
import 'package:dio/dio.dart';

class CafeWebService {
  Dio? _dio;
  CafeWebService() {
    BaseOptions baseOptions = BaseOptions(baseUrl: cafeUrl);
    _dio = Dio(baseOptions);
  }
  Future<List<dynamic>> getHotCoffee() async {
    Response response = await _dio!.get('hot');

    return response.data;
  }

  Future<List<dynamic>> getIcedCoffee() async {
    Response response = await _dio!.get('iced');

    return response.data;
  }
}
