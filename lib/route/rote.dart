
import 'package:cart/view/favorite.dart';
import 'package:cart/view/home1.dart';
import 'package:cart/view/itemDetails.dart';


import 'package:get/get.dart';

import '../binding.dart';
import '../view/cart.dart';


class Routes {

  static List<GetPage>? routes = [
    GetPage(name: '/', page: () => const Home(),binding: Binding()),
    GetPage(name: '/details', page: () => const Details()),
    GetPage(name: '/cart', page: () => Cart()),
    GetPage(name: '/favorite', page: () => Favorite())
  ];
}
