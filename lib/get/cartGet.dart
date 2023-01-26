import 'package:cart/models/localDbModel.dart';
import 'package:cart/repository/cartRepo.dart';
import 'package:get/get.dart';

class CartController extends GetxController{

var count=1.obs;
var total=15.obs;
var sum=0.obs;
var cartList=<LocalDrinkModel>[].obs;
CartRepo ?cartRepo;


CartController(this.cartRepo);

  @override
  void onInit() {

   returnFromCart();

    super.onInit();
  }
 void  addToCart(var name,int price, String image) {

 cartRepo!.addToCart(name, count.value,  price,total.value,image);


  }
Future returnFromCart()async{
var list = await cartRepo!.returnFromCart();
cartList.assignAll(list);
checkout();


}

   increment(){
    count.value++;

    total.value=total.value+15;

  }
 decrement(){
    if(count.value>1) {
      count.value--;
    }

    total.value=total.value-15;

  }
checkout(){

    for(int i=0;i<cartList.length;i++){
      sum.value=sum.value+cartList[i].productTotal!;
    }

  }

  Future delete(int? id, int index) async{
   await cartRepo!.delete(id);
cartList.removeAt(index);

  }

}