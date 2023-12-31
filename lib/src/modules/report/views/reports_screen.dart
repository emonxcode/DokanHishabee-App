import 'package:amar_dokan_app/src/modules/widgets/dokan_hishabee_text.dart';
import 'package:amar_dokan_app/src/utils/app_space.dart';
import 'package:amar_dokan_app/src/utils/colors.dart';
import 'package:amar_dokan_app/src/utils/extensions/extensions.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:countup/countup.dart';
import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';
import 'package:unique_simple_bar_chart/data_models.dart';
import 'package:unique_simple_bar_chart/simple_bar_chart.dart';

import 'widgets/data_card.dart';

class ReportsScreen extends StatefulWidget {
  const ReportsScreen({super.key});

  @override
  State<ReportsScreen> createState() => _ReportsScreenState();
}

class _ReportsScreenState extends State<ReportsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SlideAnimatedWidget(
        direction: SlideDirectionType.fromOffset,
        duration: const Duration(milliseconds: 300),
        offset: Offset(0, context.height * 0.3),
        child: Container(
          height: context.height,
          width: context.width,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  AppSpace.spaceH10,
                  Container(
                      height: 50,
                      width: context.width * 0.7,
                      margin: const EdgeInsets.only(top: 5),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: AppColors.whiteColor,
                          boxShadow: const [
                            BoxShadow(
                              offset: Offset(0, 0),
                              spreadRadius: 2,
                              blurRadius: 2,
                              color: Color.fromARGB(255, 233, 233, 233),
                            )
                          ]),
                      child: Row(
                        children: [
                          const SizedBox(width: 15),
                          const DokanHishabeeTextWidget(
                            text: "Filter By",
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color.fromARGB(255, 165, 165, 165),
                          ),
                          const SizedBox(width: 15),
                          Container(
                            height: 45,
                            width: context.width * 0.455,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              color: const Color.fromARGB(255, 241, 241, 241),
                              //    border: Border.all(width: 1),
                            ),
                            child: DropdownButtonFormField(
                                decoration: const InputDecoration(
                                  hintText: "Filter By",
                                  enabledBorder: InputBorder.none,
                                  focusedBorder: InputBorder.none,
                                ),
                                isExpanded: true,
                                alignment: Alignment.center,
                                borderRadius: BorderRadius.circular(20),
                                padding: const EdgeInsets.only(
                                    left: 10, right: 10, top: 0, bottom: 0),
                                hint: const Text("Filter by"),
                                value: "Day Wise",
                                items: [
                                  "Day Wise",
                                  "Month Wise",
                                  "Yearly",
                                ]
                                    .map((e) => DropdownMenuItem(
                                        value: e, child: Text(e)))
                                    .toList(),
                                onChanged: (v) {}),
                          ),
                        ],
                      )),
                  // TextButton(
                  //     onPressed: () async {
                  //       final selected = await showMonthYearPicker(
                  //         context: context,
                  //         initialDate: DateTime.now(),
                  //         firstDate: DateTime(2019),
                  //         lastDate: DateTime(2023),
                  //       );
                  //     },
                  //     child: const Text("Filter by")),
                  AppSpace.spaceH20,
                  Container(
                    padding: const EdgeInsets.all(8.0),
                    decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 255, 238, 216),
                        borderRadius: BorderRadiusDirectional.circular(10)),
                    child: CalendarTimeline(
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2019),
                      lastDate: DateTime(2030),
                      onDateSelected: (date) => print(date),
                      leftMargin: 25,
                      monthColor: Colors.blueGrey,
                      dayColor: Colors.black54,
                      activeDayColor: Colors.white,
                      activeBackgroundDayColor: AppColors.primaryColor,
                      dotsColor: const Color(0xFF333A47),
                      //selectableDayPredicate: (date) => date.day != 23,
                      locale: 'en_ISO',
                      showYears: false,
                    ),
                  ),
                  AppSpace.spaceH6,
                  const Divider(
                    thickness: 1,
                  ),
                  AppSpace.spaceH6,
                  Container(
                    width: context.width,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: const Color.fromARGB(255, 255, 238, 216),
                    ),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        AppSpace.spaceH16,
                        ProfitStatusValue(
                            value: 345,
                            label: "Proft",
                            labelSize: 15,
                            valueSize: 18),
                        AppSpace.spaceH10,
                        ProfitStatusValue(
                            value: 345,
                            label: "Total Sales",
                            labelSize: 15,
                            valueSize: 18),
                        AppSpace.spaceH16,
                      ],
                    ),
                  ),
                  AppSpace.spaceH10,
                  const Row(
                    children: [
                      DataCardView(
                        label: "Sales",
                        value: "3453",
                        bgColor: Color.fromRGBO(230, 243, 236, 1),
                        valueColor: Color.fromRGBO(32, 179, 100, 1),
                      ),
                      AppSpace.spaceW10,
                      DataCardView(
                        label: "Purchase",
                        value: "3453",
                        bgColor: Color.fromRGBO(243, 228, 255, 1),
                        valueColor: Color.fromRGBO(189, 108, 255, 1),
                      ),
                    ],
                  ),
                  AppSpace.spaceH10,
                  const Row(
                    children: [
                      DataCardView(
                        label: "Expense",
                        value: "3453",
                        bgColor: Color.fromARGB(255, 243, 236, 216),
                        valueColor: Color.fromARGB(255, 199, 154, 31),
                      ),
                      AppSpace.spaceW10,
                      DataCardView(
                        label: "Due",
                        value: "3453",
                        bgColor: Color.fromRGBO(253, 234, 236, 1),
                        valueColor: Color.fromRGBO(252, 104, 119, 1),
                      ),
                    ],
                  ),
                  AppSpace.spaceH30,
                  const Align(
                    alignment: Alignment.topLeft,
                    child: DokanHishabeeTextWidget(
                      text: "Last 30 days sales data",
                      color: AppColors.darkGrey,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 216,
                    width: context.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        height: 216,
                        width: 400,
                        child: SimpleBarChart(
                          horizontalBarPadding: 10,
                          listOfHorizontalBarData: [
                            HorizontalDetailsModel(
                              name: '1',
                              color: const Color(0xFFEB7735),
                              size: 100,
                            ),
                            HorizontalDetailsModel(
                              name: '2',
                              color: const Color(0xFFEB7735),
                              size: 92,
                            ),
                            HorizontalDetailsModel(
                              name: '3',
                              color: const Color(0xFFFBBC05),
                              size: 120,
                            ),
                            HorizontalDetailsModel(
                              name: '4',
                              color: const Color(0xFFFBBC05),
                              size: 86,
                            ),
                            HorizontalDetailsModel(
                              name: '5',
                              color: const Color(0xFFFBBC05),
                              size: 64,
                            ),
                            HorizontalDetailsModel(
                              name: '6',
                              color: const Color(0xFFFBBC05),
                              size: 155,
                            ),
                            HorizontalDetailsModel(
                              name: '7',
                              color: const Color(0xFFFBBC05),
                              size: 200,
                            ),
                            HorizontalDetailsModel(
                              name: '5',
                              color: const Color(0xFFFBBC05),
                              size: 64,
                            ),
                            HorizontalDetailsModel(
                              name: '6',
                              color: const Color(0xFFFBBC05),
                              size: 155,
                            ),
                            HorizontalDetailsModel(
                              name: '7',
                              color: const Color(0xFFFBBC05),
                              size: 200,
                            ),
                          ],
                          verticalInterval: 100,
                        ),
                      ),
                    ),
                  ),
                  AppSpace.spaceH30,
                  const Align(
                    alignment: Alignment.topLeft,
                    child: DokanHishabeeTextWidget(
                      text: "This month sales data",
                      color: AppColors.darkGrey,
                      fontSize: 18,
                    ),
                  ),
                  SizedBox(
                    height: 216,
                    width: context.width,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: SizedBox(
                        height: 216,
                        width: 1000,
                        child: SimpleBarChart(
                          horizontalBarPadding: 10,
                          listOfHorizontalBarData: [
                            HorizontalDetailsModel(
                              name: '1',
                              color: const Color(0xFFEB7735),
                              size: 100,
                            ),
                            HorizontalDetailsModel(
                              name: '2',
                              color: const Color(0xFFEB7735),
                              size: 92,
                            ),
                            HorizontalDetailsModel(
                              name: '3',
                              color: const Color(0xFFFBBC05),
                              size: 120,
                            ),
                            HorizontalDetailsModel(
                              name: '4',
                              color: const Color(0xFFFBBC05),
                              size: 86,
                            ),
                            HorizontalDetailsModel(
                              name: '5',
                              color: const Color(0xFFFBBC05),
                              size: 64,
                            ),
                            HorizontalDetailsModel(
                              name: '6',
                              color: const Color(0xFFFBBC05),
                              size: 155,
                            ),
                            HorizontalDetailsModel(
                              name: '7',
                              color: const Color(0xFFFBBC05),
                              size: 200,
                            ),
                            HorizontalDetailsModel(
                              name: '1',
                              color: const Color(0xFFEB7735),
                              size: 100,
                            ),
                            HorizontalDetailsModel(
                              name: '2',
                              color: const Color(0xFFEB7735),
                              size: 92,
                            ),
                            HorizontalDetailsModel(
                              name: '3',
                              color: const Color(0xFFFBBC05),
                              size: 120,
                            ),
                            HorizontalDetailsModel(
                              name: '4',
                              color: const Color(0xFFFBBC05),
                              size: 86,
                            ),
                            HorizontalDetailsModel(
                              name: '5',
                              color: const Color(0xFFFBBC05),
                              size: 64,
                            ),
                            HorizontalDetailsModel(
                              name: '6',
                              color: const Color(0xFFFBBC05),
                              size: 155,
                            ),
                            HorizontalDetailsModel(
                              name: '7',
                              color: const Color(0xFFFBBC05),
                              size: 200,
                            ),
                            HorizontalDetailsModel(
                              name: '1',
                              color: const Color(0xFFEB7735),
                              size: 100,
                            ),
                            HorizontalDetailsModel(
                              name: '2',
                              color: const Color(0xFFEB7735),
                              size: 92,
                            ),
                            HorizontalDetailsModel(
                              name: '3',
                              color: const Color(0xFFFBBC05),
                              size: 120,
                            ),
                            HorizontalDetailsModel(
                              name: '4',
                              color: const Color(0xFFFBBC05),
                              size: 86,
                            ),
                            HorizontalDetailsModel(
                              name: '5',
                              color: const Color(0xFFFBBC05),
                              size: 64,
                            ),
                            HorizontalDetailsModel(
                              name: '6',
                              color: const Color(0xFFFBBC05),
                              size: 155,
                            ),
                            HorizontalDetailsModel(
                              name: '7',
                              color: const Color(0xFFFBBC05),
                              size: 200,
                            ),
                            HorizontalDetailsModel(
                              name: '1',
                              color: const Color(0xFFEB7735),
                              size: 100,
                            ),
                            HorizontalDetailsModel(
                              name: '2',
                              color: const Color(0xFFEB7735),
                              size: 92,
                            ),
                            HorizontalDetailsModel(
                              name: '3',
                              color: const Color(0xFFFBBC05),
                              size: 120,
                            ),
                            HorizontalDetailsModel(
                              name: '4',
                              color: const Color(0xFFFBBC05),
                              size: 86,
                            ),
                            HorizontalDetailsModel(
                              name: '5',
                              color: const Color(0xFFFBBC05),
                              size: 64,
                            ),
                            HorizontalDetailsModel(
                              name: '6',
                              color: const Color(0xFFFBBC05),
                              size: 155,
                            ),
                            HorizontalDetailsModel(
                              name: '7',
                              color: const Color(0xFFFBBC05),
                              size: 200,
                            ),
                          ],
                          verticalInterval: 100,
                        ),
                      ),
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

class ProfitStatusValue extends StatelessWidget {
  const ProfitStatusValue({
    super.key,
    required this.value,
    required this.label,
    required this.labelSize,
    required this.valueSize,
  });
  final String label;
  final double value;
  final double labelSize;
  final double valueSize;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        AppSpace.spaceW10,
        Expanded(
          child: Align(
            alignment: Alignment.centerLeft,
            child: DokanHishabeeTextWidget(
              text: label,
              color: const Color.fromARGB(255, 119, 119, 119),
              fontWeight: FontWeight.bold,
              fontSize: labelSize,
            ),
          ),
        ),
        DokanHishabeeTextWidget(
          text: ":    ",
          color: const Color.fromARGB(255, 68, 68, 68),
          fontWeight: FontWeight.bold,
          fontSize: labelSize,
        ),
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadiusDirectional.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Countup(
                  begin: 0,
                  end: value,
                  style: TextStyle(
                    fontSize: valueSize,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(32, 179, 100, 1),
                    decorationStyle: TextDecorationStyle.solid,
                    decorationThickness: 2,
                  ),
                  duration: const Duration(milliseconds: 2000),
                ),
                AppSpace.spaceW6,
                DokanHishabeeTextWidget(
                  text: "Tk",
                  color: Colors.teal,
                  fontWeight: FontWeight.bold,
                  fontSize: labelSize,
                ),
              ],
            ),
          ),
        ),
        AppSpace.spaceW16,
      ],
    );
  }
}
