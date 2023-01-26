import 'package:cart/get/favoritGet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constant/colorConstant.dart';
import '../get/cartGet.dart';

class Details extends StatefulWidget {
  const Details({Key? key}) : super(key: key);

  @override
  State<Details> createState() => _DetailsState();
}

class _DetailsState extends State<Details> {
  var name, image, description;
  int price = 15;
  CartController? cartController;
  FavoriteController? favoriteController;
  @override
  void initState() {
    super.initState();
    image = Get.parameters['image'];

    name = Get.parameters['name'];
    description = Get.parameters['description'];

    cartController = Get.find<CartController>();

    favoriteController = Get.put<FavoriteController>(FavoriteController());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
            child: Container(
      height: MediaQuery.of(context).size.height,
      color: background,
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        image: DecorationImage(
                            image: NetworkImage(image), fit: BoxFit.cover)),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                        decoration: BoxDecoration(
                            color: buttonBackground,
                            borderRadius: BorderRadius.circular(15)),
                        child: IconButton(
                          onPressed: () {
                            Get.back();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios,
                            color: Colors.white,
                          ),
                          color: Colors.cyan,
                        )),
                  )
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text(
              name,
              style: TextStyle(fontSize: 22.sp, color: Colors.white),
            ),
            SizedBox(
              height: 20.h,
            ),
            Text('Description',
                style: TextStyle(fontSize: 20.sp, color: Colors.white)),
            SizedBox(
              height: 10.h,
            ),
            Text(description,
                style: TextStyle(fontSize: 18.sp, color: buttonBackground)),
            SizedBox(
              height: 20.h,
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
              Card(
                  color: background,
                  elevation: 8,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                      side: BorderSide(width: 1, color: buttonBackground)),
                  child: Row(children: [
                    IconButton(
                        onPressed: () {
                          cartController!.decrement();
                        },
                        icon: const Icon(
                          Icons.remove,
                          color: icon,
                          size: 28,
                        )),
                    SizedBox(
                      width: 5.w,
                    ),
                    GetX<CartController>(
                      builder: (counter) => Text(
                        '${counter.count.value}',
                        style: TextStyle(fontSize: 22.sp, color: icon),
                      ),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    IconButton(
                        onPressed: () {
                          cartController!.increment();
                        },
                        icon: const Icon(
                          Icons.add,
                          color: icon,
                          size: 28,
                        ))
                  ])),
              Text(
                '${price} EGP',
                style: TextStyle(color: icon, fontSize: 22.sp),
              )
            ]),

            SizedBox(
              height: 20.h,
            ),
            Obx(
              () => Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: buttonBackground,
                          borderRadius: BorderRadius.circular(15)),
                      child: IconButton(
                          onPressed: () {
                            favoriteController!
                                .selectFavorite(name, price, image);
                          },
                          icon: favoriteController!.isFavorite.value
                              ? const Icon(
                                  Icons.favorite_outlined,
                                  color: icon,
                                  size: 30,
                                )
                              : const Icon(
                                  Icons.favorite_outline,
                                  color: icon,
                                  size: 30,
                                )),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.3,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            minimumSize: Size(0, 40.h),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15)),
                            primary: icon,
                            onPrimary: Colors.white,
                            textStyle: TextStyle(fontSize: 18.sp)),
                        onPressed: () {
                          cartController!.addToCart(name, price, image);
                        },
                        child: const Text('Add to Cart'),
                      ),
                    ),
                  ]),
            ),
            //SizedBox(height: 50,)
          ]),
        ),
      ),
    )));
  }
}
