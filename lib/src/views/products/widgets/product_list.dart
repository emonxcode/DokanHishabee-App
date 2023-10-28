import 'package:amar_dokan_app/src/views/products/widgets/product_view.dart';
import 'package:flutter/material.dart';

import '../../../providers/products_provider.dart';

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
          childAspectRatio: 0.75,
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
