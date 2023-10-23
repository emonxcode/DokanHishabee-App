import 'package:amar_dokan_app/src/helpers/extensions/extensions.dart';
import 'package:amar_dokan_app/src/providers/products_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'category_view.dart';

class CategoryListView extends ConsumerStatefulWidget {
  const CategoryListView({
    super.key,
  });

  @override
  ConsumerState<CategoryListView> createState() => _CategoryListViewState();
}

class _CategoryListViewState extends ConsumerState<CategoryListView> {
  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(productsProvider);

    return Container(
      height: context.height * 0.14,
      width: context.width,
      child: ListView.builder(
        itemCount: controller.categoryList.length,
        scrollDirection: Axis.horizontal,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return CategoryView(controller: controller, index: index);
        },
      ),
    );
  }
}
