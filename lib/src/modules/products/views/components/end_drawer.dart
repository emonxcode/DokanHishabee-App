import 'package:flutter/material.dart';
import '../../../../utils/app_space.dart';
import '../../../../utils/colors.dart';
import '../../../widgets/dokan_hishabee_text.dart';
import '../../../widgets/dokan_hishabee_text_field.dart';

class EndDrawerWidget extends StatelessWidget {
  const EndDrawerWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            AppSpace.spaceW10,
            const DokanHishabeeTextWidget(
              text: "Cart",
              fontSize: 20,
            ),
            const Spacer(),
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(Icons.close),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10),
          child: DokanHishabeeTextWidget(text: "Customer", fontSize: 18),
        ),
        AppSpace.spaceH10,
        SizedBox(
          height: 60,
          width: double.infinity,
          child: Row(
            children: [
              AppSpace.spaceW10,
              const Expanded(
                child: SizedBox(
                  height: 60,
                  child: DokanHishabeeTextField(
                    hint: "Search customer...",
                  ),
                ),
              ),
              AppSpace.spaceW10,
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.search),
              )
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: 6,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return Container(
                height: 75,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: AppColors.lightGrey,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(left: 10),
                      child: DokanHishabeeTextWidget(
                        text: "বাসমোতি চাউল ৫০ কেজি",
                        color: AppColors.darkGrey,
                        fontSize: 15,
                      ),
                    ),
                    Row(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: DokanHishabeeTextWidget(
                            text: "2x5 = ৳ 250",
                            color: AppColors.darkGrey,
                            fontSize: 14,
                          ),
                        ),
                        const Spacer(),
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.remove_circle),
                          ),
                        ),
                        AppSpace.spaceW10,
                        const DokanHishabeeTextWidget(
                          text: "2",
                          color: AppColors.darkGrey,
                          fontSize: 18,
                        ),
                        AppSpace.spaceW10,
                        SizedBox(
                          height: 40,
                          width: 40,
                          child: IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.add_circle),
                          ),
                        ),
                        AppSpace.spaceW10,
                      ],
                    ),
                  ],
                ),
              );
            },
          ),
        ),
        AppSpace.spaceH10,
        SizedBox(
          height: 50,
          child: Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                  height: 50,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                    ),
                    color: AppColors.primaryColor,
                  ),
                  child: const Center(
                    child: DokanHishabeeTextWidget(
                      text: "SAVE",
                      color: AppColors.whiteColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                  ),
                ),
              ),
              Container(height: 60, width: 1.5, color: AppColors.whiteColor),
              Expanded(
                flex: 2,
                child: InkWell(
                  onTap: () {},
                  child: Container(
                    height: 50,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(15),
                      ),
                      color: AppColors.primaryColor,
                    ),
                    child: const Center(
                      child: Icon(
                        Icons.print,
                        color: AppColors.whiteColor,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
