import 'package:cart/get/favoritGet.dart';
import 'package:cart/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../constant/colorConstant.dart';
class Favorite extends StatelessWidget {
    Favorite({Key? key}) : super(key: key);
    FavoriteController favoriteController=Get.put<FavoriteController>(FavoriteController());

  @override
  Widget build(BuildContext context) {
    favoriteController.returnFromFavorite();
    return Scaffold(appBar: appBar('Favorite'),body: Container(color: background,
        child:Padding(
          padding: const EdgeInsets.only(right: 20,left: 20,top:10,bottom: 10),
          child: GetX<FavoriteController>(init: FavoriteController(),
            builder:(fav)=> GridView.builder(
            itemCount: fav.favoriteList.length,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 0.8,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10),
            itemBuilder: (context, index) =>  Container(
                  decoration: BoxDecoration(
                      color: buttonBackground,
                      borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10, top: 10),
                    child:  Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              height: MediaQuery.of(context).size.height / 5.5,
                              child: FadeInImage.assetNetwork(placeholder:'asset/loading.gif' ,placeholderCacheHeight: 20,image:


                            fav.favoriteList[index].productImage!
                                ,
                                fit: BoxFit.fill,
                              ),


                            ),

                          ),
                          SizedBox(
                            height: 8.h,
                          ),
                          Text(
                           fav.favoriteList[index].productName,
                            style: TextStyle(
                              fontSize: 18.sp,
                              color: Colors.white,
                            ),
                          ),
                          // SizedBox(
                          //   height: 5.h,
                          // ),
                          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                               " ${fav.favoriteList[index].productPrice}",
                                style: TextStyle(fontSize: 16.sp, color: icon),
                              ),IconButton(onPressed: (){fav.deleteFromFavorite(fav.favoriteList[index].id,index);}, icon: const Icon(Icons.favorite_outlined,color: icon,))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),

                ),
          ))),
        );
  }
}
