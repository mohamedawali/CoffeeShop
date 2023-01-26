
class LocalDrinkModel {
int? id;
  var productName;
  int? productCount;
  int? productPrice;
  int? productTotal;
  String? productImage;
int? selectFavorite;
  LocalDrinkModel(
      {this.productName,
      this.productCount,
      this.productPrice,
      this.productTotal,
      this.productImage,this.selectFavorite});

  Map<String, dynamic> saveCartDrink() {
    return {
      "ProductName": productName,
      "ProductCount": productCount,
      "ProductPrice": productPrice,
      'ProductTotal': productTotal,
      "ProductImage": productImage,

    };
  }
    Map<String, dynamic> saveFavoriteDrink() {
      return {
        "ProductName": productName,
        "ProductPrice": productPrice,

        "ProductImage": productImage,
        "Favorite": selectFavorite
      };
    }
  LocalDrinkModel.getCartDrinks(Map<String, dynamic>getMap){
    id=getMap['Id'];
    productName=getMap['ProductName'];
    productCount=getMap['ProductCount'];
    productPrice=getMap['ProductPrice'];
    productTotal=getMap['ProductTotal'];
    productImage=getMap['ProductImage'] ;



  }
LocalDrinkModel.getFavoriteDrinks(Map<String, dynamic>getMap){
  id=getMap['Id'];
  productName=getMap['ProductName'];

  productPrice=getMap['ProductPrice'];

  productImage=getMap['ProductImage'] ;

selectFavorite=getMap["Favorite"];

}
}
