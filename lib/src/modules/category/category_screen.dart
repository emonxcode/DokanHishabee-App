import 'package:amar_dokan_app/src/constants/api_endpoints.dart';
import 'package:amar_dokan_app/src/modules/category/models/category.dart';
import 'package:amar_dokan_app/src/modules/widgets/dokan_hishabee_text.dart';
import 'package:amar_dokan_app/src/utils/colors.dart';
import 'package:amar_dokan_app/src/utils/extensions/extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';

import '../../utils/app_space.dart';
import '../global_widgets/menu_page_app_bar.dart';
import 'providers/category_provider.dart';
import 'widgets/top_container.dart';

class CategoryScreen extends ConsumerStatefulWidget {
  const CategoryScreen({super.key});

  @override
  ConsumerState<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends ConsumerState<CategoryScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero).then(
      (value) => ref.read(categoryProvider).getAllCategories(context: context),
    );
  }

  @override
  Widget build(BuildContext context) {
    var controller = ref.watch(categoryProvider);
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SlideAnimatedWidget(
          direction: SlideDirectionType.fromOffset,
          duration: const Duration(milliseconds: 300),
          offset: Offset(context.height * 0.5, 0),
          child: SafeArea(
            child: Container(
              height: context.height,
              width: context.width,
              padding: const EdgeInsets.all(10),
              child: Column(
                children: [
                  const CustomMenuAppBar(
                    logoUrl: 'assets/images/category.png',
                    title: "Categories",
                  ),
                  AppSpace.spaceH10,
                  const TopCardAddCategory(),
                  Flexible(
                    child: controller.isDataLoading
                        ? const Center(child: CircularProgressIndicator())
                        : GridView.builder(
                            itemCount: controller.categories.length,
                            padding: const EdgeInsets.only(top: 20),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    crossAxisSpacing: 5.0,
                                    mainAxisSpacing: 5.0),
                            itemBuilder: (context, index) {
                              var category = controller.categories[index];
                              return CategoryItemView(category: category);
                            },
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class CategoryItemView extends StatelessWidget {
  const CategoryItemView({
    super.key,
    required this.category,
  });

  final Category category;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.grey[200],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          SizedBox(
            height: 80,
            width: 80,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                ApiUrl.baseUrl + category.img!,
                errorBuilder: (context, error, stackTrace) => const Center(
                  child: Text("Error!"),
                ),
              ),
            ),
          ),
          const SizedBox(height: 10),
          DokanHishabeeTextWidget(
            text: category.name ?? "",
            color: AppColors.blackColor,
            fontSize: 20,
          ),
        ],
      ),
    );
  }
}
