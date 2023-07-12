import 'dart:developer';

import 'package:cart/get/cartGet.dart';
import 'package:cart/widget/appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:my_fatoorah/my_fatoorah.dart';
import '../constant/colorConstant.dart';
import '../dataBase/local/cartDataBase.dart';
import '../repository/cartRepo.dart';
class Cart extends StatelessWidget {

   Cart( {Key? key}) : super(key: key);


  CartController cartController=Get.find<CartController>();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: appBar('Cart'),

        body: Container(
            height: MediaQuery.of(context).size.height,
            color: background,
            child: SingleChildScrollView(
                child: Column(children: [
              Padding(
                padding: const EdgeInsets.all(10),
                child: SizedBox(
                    height: MediaQuery.of(context).size.height / 1.3,
                    child:   GetX<CartController>(
                  builder:(cart)=>   ListView.builder(
                            itemCount:cart.cartList.length ,
                            itemBuilder: (context, index) => Card(
                                  color: buttonBackground,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                        //crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(15),
                                            child:  Image(
                                              image: NetworkImage(
                                                  cart.cartList[index].productImage!),
                                              width: 120,
                                              height: 100,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8.w,
                                          ),
                                          Expanded(
                                              child: SizedBox(
                                            width:
                                                MediaQuery.of(context).size.width,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                 Text(cart.cartList[index].productName!,
                                                    style:  const TextStyle(
                                                        color: icon)),
                                                SizedBox(
                                                  height: 3.h,
                                                ),
                                                 Text("${cart.cartList[index].productPrice}  EGP",
                                                    style: const TextStyle(color: icon)),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                     Text(
                                                     "${ cart.cartList[index].productCount!}  pc",
                                                      style: const TextStyle(color: icon),
                                                    ),
                                                    IconButton(
                                                        onPressed: () {
                                                          cart.delete(cart.cartList[index].id,index);
                                                        },
                                                        icon: const Icon(
                                                            Icons.delete_rounded))
                                                  ],
                                                )
                                              ],
                                            ),
                                          )),
                                        ]),
                                  ),
                                )),
                    ),
                    )),

              Container(
                  color: buttonBackground,
                  height: MediaQuery.of(context).size.height / 8,
                  width: MediaQuery.of(context).size.width,
                  child: Padding(
                    padding: const EdgeInsets.only(right: 10, left: 10),
                    child: GetX<CartController>(
                      builder:(check)=> Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                           Text("${check.cartList.length} Products",style: TextStyle(color: icon,fontSize: 18.sp),),
                          SizedBox(
                            height: 10.h,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width,
                            child: ElevatedButton(
                                onPressed: () {checkPayment(context,check.sum.value.toDouble());},
                                style: ElevatedButton.styleFrom(primary: icon),
                                child:  Text('Checkout(${check.sum.value} EGP)'),

                            ),
                          ),
                        ],
                      ),
                    ),
                  )),

            ]))));
  }

   checkPayment(BuildContext context, double value) async{

      var response = await MyFatoorah.startPayment(context: context,buildAppBar: (context)=>appBar('Payment'),
          request: MyfatoorahRequest.test(
              token: 'rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL',
              language: ApiLanguage.Arabic,
              invoiceAmount: value,
              successUrl: "https://www.nicepng.com/maxp/u2e6w7r5a9u2w7r5/",
              errorUrl: "https://thumbs.dreamstime.com/z/f-hand-drawn-grade-result-circle-fail-exam-worst-work-vector-icon-f-hand-drawn-grade-result-circle-fail-exam-109800778.jpg",
              currencyIso: Country.SaudiArabia));
      print('err${response.toString()}');

   }



}
