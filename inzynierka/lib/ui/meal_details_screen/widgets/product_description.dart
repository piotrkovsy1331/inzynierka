import 'package:flutter/material.dart';
import 'package:inzynierka/ui/meal_details_screen/widgets/product_text.dart';

import '../../../models/product.dart';

class ProductDescription extends StatelessWidget {
  const ProductDescription(
      {Key? key, required this.product, required this.isCollapsed})
      : super(key: key);

  final Product product;
  final bool isCollapsed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductText(
            property: 'kcal :',
            value: product.kcal.toString(),
          ),
          if (!isCollapsed) ...[
            const SizedBox(
              height: 5,
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Theme.of(context).cardColor,
            ),
            const SizedBox(
              height: 5,
            ),
            ProductText(
              property: 'białko :',
              value: product.protein.toString(),
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Theme.of(context).cardColor,
            ),
            const SizedBox(
              height: 5,
            ),
            ProductText(
              property: 'tłuszcz :',
              value: product.fat.toString(),
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Theme.of(context).cardColor,
            ),
            const SizedBox(
              height: 5,
            ),
            ProductText(
              property: 'cukier :',
              value: product.sugar.toString(),
            ),
            const SizedBox(
              height: 5,
            ),
            Divider(
              height: 1,
              thickness: 1,
              color: Theme.of(context).cardColor,
            ),
            const SizedBox(
              height: 5,
            ),
            ProductText(
              property: 'gramy : ',
              value: product.weight.toString(),
            ),
            const SizedBox(
              height: 5,
            ),
          ]
        ],
      ),
    );
  }
}
