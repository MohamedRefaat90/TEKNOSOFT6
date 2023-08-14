import 'package:ecommerce/ApiLinks.dart';
import 'package:ecommerce/core/class/DB_helper.dart';

class ProductsData {
  DB_helper db_helper;
  ProductsData(this.db_helper);

  addToFav(String productID) async {
    var response =
        await db_helper.postData("${ApiLinks.Favourite}$productID", {});
    return response.fold((l) => l, (r) => r);
  }
}
