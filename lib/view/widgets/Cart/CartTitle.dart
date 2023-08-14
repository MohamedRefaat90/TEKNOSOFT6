import 'package:flutter/material.dart';

import '../../../core/constants/AppColors.dart';

class CartTitle extends StatelessWidget {
  const CartTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text.rich(TextSpan(children: [
        TextSpan(text: "You Have "),
        TextSpan(
            text: "3 ",
            style: TextStyle(
                fontWeight: FontWeight.bold,
                color: AppColors.secondryColor,
                fontSize: 20)),
        TextSpan(text: "item in Your Cart "),
      ])),
    );
  }
}