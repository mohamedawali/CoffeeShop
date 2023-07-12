import 'package:cart/dataBase/local/cartDataBase.dart';
import 'package:cart/get/cartGet.dart';
import 'package:cart/repository/cartRepo.dart';
import 'package:cart/route/pageRoute.dart';
import 'package:cart/view/cart.dart';
import 'package:cart/view/favorite.dart';
import 'package:cart/widget/gridView.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constant/colorConstant.dart';
import '../constant/strings.dart';
import '../get/cafeGet.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CafeController cafeController = Get.find<CafeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Container(
        height: MediaQuery.of(context).size.height,
        color: background,
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20, top: 20),
          child: SingleChildScrollView(
            child:

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.27,
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    ElevatedButton(
                                        onPressed: () {
                                          //Get.toNamed('/favorite');
                                          Get.to(Favorite(),transition: Transition.leftToRight,curve: Curves.easeIn,duration: Duration(seconds: 1));
                                        },
                                        style: ElevatedButton.styleFrom(
                                          minimumSize: Size(0, 40.h),
                                          primary: buttonBackground,
                                        ),
                                        child: const Icon(
                                          Icons.favorite_outline,
                                          color: icon,
                                          size: 30,
                                        )),
                                    Stack(
                                      children: [
                                        ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              minimumSize: Size(0, 40.h),
                                              primary: buttonBackground,
                                            ),
                                            onPressed: () {
                                              Get.to(Cart(),transition: Transition.rightToLeft,curve: Curves.easeIn,duration: Duration(seconds: 1));
                                          //    Get.toNamed('/cart',);
                                            },
                                            child: const Icon(
                                                Icons.shopping_cart_outlined,
                                                color: icon,
                                                size: 30)),
                                        Positioned(
                                            right: 23,
                                            top: 6,
                                            child: CircleAvatar(
                                              backgroundColor: Colors.red,
                                              radius: 7,
                                              child: GetX<CartController>(
                                                builder: (lengthList)=>Text(
                                                  "${lengthList.cartList.length}",
                                                  style:  TextStyle(
                                                      fontSize: 10.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                              ),
                                            ))
                                      ],
                                    ),
                                  ]),
                              SizedBox(
                                height: 30.h,
                              ),
                              Text(
                                'Find your favorite\ndrink with ......',
                                style: TextStyle(
                                    fontSize: 28.sp, color: Colors.white),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              SizedBox(
                                height: 28.h,
                                child: ListView.separated(
                                  separatorBuilder: (context, index) =>
                                      SizedBox(
                                    width: 10.w,
                                  ),
                                  scrollDirection: Axis.horizontal,
                                  itemCount: list.length,
                                  itemBuilder: (context, index) => GetX<CafeController>(
                                    builder: (selectIndex)=>ChoiceChip(
                                        backgroundColor: background,
                                        elevation: 0,
                                        labelStyle:
                                            TextStyle(color: buttonBackground),
                                        side: const BorderSide(
                                            width: 0, color: background),
                                        label: Text(
                                          list[index],
                                          style: TextStyle(fontSize: 16.sp),
                                        ),
                                        selected:
                                        selectIndex.select.value == index,
                                        onSelected: (isSelect) {
                                          selectIndex.change(isSelect, index);
                                        }),
                                  ),
                                ),
                              ),
                            ])),
                    SizedBox(
                      height: 10.h,
                    ),

                    SizedBox(
                        height: MediaQuery.of(context).size.height * 0.67,
                        child: GetX<CafeController>(builder: (selected)=>view(selected.select.value))),SizedBox(height: 20.h,)
                    // cafeController.select.value
                  ],
                )),

          ),
        ),

    ));
  }

  Widget view(int i) {
    switch (i) {
      case 0:
        return Obx(() {
          if (cafeController.isLoading.value) {
            return const Center(
                child: CircularProgressIndicator(
              color: icon,
            ));
          } else {
            return cafeGridView(cafeController.listHotCoffee, context);
          }
        });

      case 1:
        return Obx(() {
          if (cafeController.isLoading.value) {
            return const Center(
                child: CircularProgressIndicator(
              color: icon,
            ));
          } else {
            return cafeGridView(cafeController.listIceCoffee, context);
          }
        });
      case 2:
        return Obx(() {
          if (cafeController.isLoading.value) {
            return const Center(
                child: CircularProgressIndicator(
              color: icon,
            ));
          } else {
            return drinkGridView(cafeController.listOrdinaryDrink);
          }
        });
      case 3:
        return Obx(() {
          if (cafeController.isLoading.value) {
            return const Center(
                child: CircularProgressIndicator(
              color: icon,
            ));
          } else {
            return drinkGridView(cafeController.listCocktail);
          }
        });
    }
    return Container(
      color: Colors.deepOrange,
    );
  }
}
