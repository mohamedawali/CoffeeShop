import 'package:cart/get/cartGet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../constant/colorConstant.dart';
class Cart extends StatelessWidget {

   Cart( {Key? key}) : super(key: key);


  CartController cartController=Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
  cartController.returnFromCart();
    return Scaffold(
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8),
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
                  // color: Colors.cyan,
                )),
          ),
          backgroundColor: background,
          elevation: 0,
          title: const Text(
            'Cart',
            style: TextStyle(color: icon),
          ),
          centerTitle: true,
        ),
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
                              onPressed: () {},
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
}
