import 'package:cart/constant/strings.dart';
import 'package:cart/models/cafeModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../constant/colorConstant.dart';
import '../models/drinkModel.dart';

Widget cafeGridView(RxList<CafeModel>? listCoffee) {
  return GridView.builder(
      itemCount: listCoffee!.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) => InkWell(
            onTap: () => Get.toNamed("/details",parameters:{'image':listCoffee[index].image!,'name':listCoffee[index].title!,"description":listCoffee[index].description!}),
            child: Container(
              decoration: BoxDecoration(
                  color: buttonBackground,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 5.5,
                        child: FadeInImage.assetNetwork(placeholder: 'asset/loading.gif',
                          image:
                            listCoffee[index].image!,
                            fit: BoxFit.cover,

                        ),
                      ),
                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      listCoffee[index].title!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      '15 EGP',
                      style: TextStyle(fontSize: 14.sp, color: icon),
                    )
                  ],
                ),
              ),
            ),
          ));
}

////////////
Widget drinkGridView(RxList<Drink> listDrink) {
  return GridView.builder(
      itemCount: listDrink.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10),
      itemBuilder: (context, index) => InkWell(
            onTap: () => Get.toNamed("/details",parameters:{'image':listDrink[index].strDrinkThumb!,'name':listDrink[index].strDrink!,'description':description}),
            child: Container(
              decoration: BoxDecoration(
                  color: buttonBackground,
                  borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height / 5.5,
                        child: FadeInImage.assetNetwork(placeholder:'asset/loading.gif' ,placeholderCacheHeight: 20,image:


                            listDrink[index].strDrinkThumb!
                            ,
                            fit: BoxFit.fill,
                          ),


                        ),

                    ),
                    SizedBox(
                      height: 8.h,
                    ),
                    Text(
                      listDrink[index].strDrink!,
                      style: TextStyle(
                        fontSize: 16.sp,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      height: 5.h,
                    ),
                    Text(
                      '15 EGP',
                      style: TextStyle(fontSize: 14.sp, color: icon),
                    )
                  ],
                ),
              ),

          )));
}
