import 'package:amar_dokan_app/src/extensions/extensions.dart';
import 'package:amar_dokan_app/src/modules/products/controller/products_provider.dart';
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

    return SizedBox(
      height: context.height * 0.12,
      width: context.width,
      child: ListView.separated(
        itemCount: controller.categoryList.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        separatorBuilder: (context, index) => const SizedBox(width: 8.0),
        itemBuilder: (context, index) {
          return CategoryView(controller: controller, index: index);
        },
      ),
    );
  }
}
