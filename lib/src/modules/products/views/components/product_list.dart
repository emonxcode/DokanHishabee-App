import 'package:amar_dokan_app/src/modules/products/views/components/product_view.dart';
import 'package:flutter/material.dart';

import '../../controller/products_provider.dart';

class ProductList extends StatelessWidget {
  const ProductList({
    super.key,
    required this.controller,
  });

  final ProductsController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GridView.builder(
        itemCount: controller.productList.length,
        physics: const BouncingScrollPhysics(),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          childAspectRatio: 0.68,
          crossAxisSpacing: 5,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (context, index) {
          var product = controller.productList[index];
          return ProductView(
            index: index,
            product: product,
          );
        },
      ),
    );
  }
}
