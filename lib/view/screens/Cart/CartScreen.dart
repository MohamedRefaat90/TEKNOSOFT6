import 'package:ecommerce/controller/Cart/cartController.dart';
import 'package:ecommerce/core/class/statusRequest.dart';
import 'package:ecommerce/core/shared/HandleingRequsetData.dart';
import 'package:ecommerce/data/Model/productModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/shared/BTN.dart';
import '../../../core/shared/customField.dart';
import '../../widgets/Cart/CartAppBar.dart';
import '../../widgets/Cart/CartBill.dart';
import '../../widgets/Cart/CartItem.dart';
import '../../widgets/Cart/CartTitle.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(CartControllerImp());
    return GetBuilder<CartControllerImp>(builder: (controller) {
      return Scaffold(
          appBar: cartAppBar(),
          bottomNavigationBar:
              (controller.statusRequest == StatusRequest.success ||
                      controller.statusRequest == StatusRequest.none)
                  ? CartBill()
                  : null,
          body: HandleingRequsetData(
              statusRequest: controller.statusRequest!,
              widget: SingleChildScrollView(
                  child: Column(children: [
                CartTitle(numofItems: controller.cartQuantity.toInt()),
                SizedBox(height: 10),
                ListView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    itemCount: controller.cartProducts.length,
                    itemBuilder: (context, index) => CartItem(
                        product: productModel
                            .formjson(controller.cartProducts[index]),
                        index: index)),
              ]))));
    });
  }
}
