import 'package:amar_dokan_app/src/modules/widgets/dokan_hishabee_text.dart';
import 'package:amar_dokan_app/src/utils/app_space.dart';
import 'package:amar_dokan_app/src/utils/colors.dart';
import 'package:amar_dokan_app/src/utils/extensions/extensions.dart';
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:countup/countup.dart';
import 'package:d_chart/d_chart.dart';
import 'package:flutter/material.dart';
import 'package:simple_animation_transition/simple_animation_transition.dart';

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
          child: Column(
            children: [
              AppSpace.spaceH30,
              CalendarTimeline(
                initialDate: DateTime.now(),
                firstDate: DateTime(2019),
                lastDate: DateTime(2025),
                onDateSelected: (date) => print(date),
                leftMargin: 20,
                monthColor: Colors.blueGrey,
                dayColor: Colors.black54,
                activeDayColor: Colors.white,
                activeBackgroundDayColor: AppColors.primaryColor,
                dotsColor: const Color(0xFF333A47),
                //selectableDayPredicate: (date) => date.day != 23,
                locale: 'en_ISO',
                showYears: false,
              ),
              AppSpace.spaceH16,
              Container(
                height: 80,
                width: context.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: AppColors.primaryColor,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    AppSpace.spaceW10,
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        DokanHishabeeTextWidget(
                          text: "Profit".toUpperCase(),
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Countup(
                          begin: 0,
                          end: 25500,
                          style: const TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: AppColors.whiteColor,
                          ),
                          duration: const Duration(milliseconds: 500),
                        ),
                        AppSpace.spaceW10,
                        const DokanHishabeeTextWidget(
                          text: "Tk",
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ],
                    ),
                    AppSpace.spaceW16,
                  ],
                ),
              ),
              AppSpace.spaceH10,
              const Row(
                children: [
                  DataCardView(
                    label: "Sales",
                    value: "3453",
                    bgColor: Color.fromRGBO(253, 234, 236, 1),
                    valueColor: Color.fromRGBO(252, 104, 119, 1),
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
                    valueColor: Color.fromARGB(255, 223, 172, 34),
                  ),
                  AppSpace.spaceW10,
                  DataCardView(
                    label: "Expense",
                    value: "3453",
                    bgColor: Color.fromRGBO(230, 243, 236, 1),
                    valueColor: Color.fromRGBO(39, 216, 121, 1),
                  ),
                ],
              ),
              AppSpace.spaceH10,
              SizedBox(
                height: 200,
                width: context.width,
                child: SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: SizedBox(
                    height: 200,
                    width: 2500,
                    child: DChartBarO(
                      groupList: [
                        OrdinalGroup(
                          id: '2',
                          color: AppColors.primaryColor,
                          chartType: ChartType.bar,
                          data: [
                            OrdinalData(domain: '30', measure: 2),
                            OrdinalData(domain: '29', measure: 6),
                            OrdinalData(domain: '28', measure: 3),
                            OrdinalData(domain: '27', measure: 7),
                            OrdinalData(domain: '26', measure: 2),
                            OrdinalData(domain: '25', measure: 6),
                            OrdinalData(domain: '24', measure: 3),
                            OrdinalData(domain: '23', measure: 7),
                            OrdinalData(domain: '22', measure: 2),
                            OrdinalData(domain: '21', measure: 6),
                            OrdinalData(domain: '20', measure: 3),
                            OrdinalData(domain: '19', measure: 7),
                            OrdinalData(domain: '18', measure: 2),
                            OrdinalData(domain: '17', measure: 6),
                            OrdinalData(domain: '16', measure: 3),
                            OrdinalData(domain: '15', measure: 7),
                            OrdinalData(domain: '14', measure: 2),
                            OrdinalData(domain: '13', measure: 6),
                            OrdinalData(domain: '12', measure: 3),
                            OrdinalData(domain: '11', measure: 7),
                            OrdinalData(domain: '10', measure: 2),
                            OrdinalData(domain: '9', measure: 6),
                            OrdinalData(domain: '8', measure: 3),
                            OrdinalData(domain: '7', measure: 7),
                            OrdinalData(domain: '6', measure: 2),
                            OrdinalData(domain: '5', measure: 6),
                            OrdinalData(domain: '4', measure: 3),
                            OrdinalData(domain: '3', measure: 7),
                            OrdinalData(domain: '2', measure: 2),
                            OrdinalData(
                                domain: '1',
                                measure: 6,
                                other: const Text(
                                  "data",
                                  style: TextStyle(color: Colors.white),
                                )),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
