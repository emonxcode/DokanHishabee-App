import 'package:amar_dokan_app/src/modules/widgets/dokan_hishabee_text.dart';
import 'package:amar_dokan_app/src/utils/colors.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class GaribookDropDown2 extends StatelessWidget {
  const GaribookDropDown2(
      {Key? key,
        this.value,
        this.child,
        this.secondaryItemValue,
        required this.hint,
        required this.items,
        required this.itemValue,
        required this.onChanged,
        this.dropdownWidth,
        this.color,
        this.fontSize,
        this.iconColor,
        this.validator})
      : super(key: key);
  final dynamic value;
  final String hint;
  final String itemValue;
  final String? secondaryItemValue;
  final double? dropdownWidth;
  final List items;
  final Function(dynamic) onChanged;
  final Color? color;
  final Color? iconColor;
  final double? fontSize;
  final String? Function(dynamic)? validator;
  final Widget? child;

  @override
  Widget build(BuildContext context) {

    return DropdownButton(
      // decoration: const InputDecoration(
      //   contentPadding: EdgeInsets.zero,
      //   disabledBorder: InputBorder.none,
      //   enabledBorder: InputBorder.none,
      //   focusedBorder: InputBorder.none,
      //   focusedErrorBorder: InputBorder.none,
      //   errorBorder: InputBorder.none,
      // ),
      // menuItemStyleData: MenuItemStyleData(
      //     padding:
      //     const EdgeInsets.symmetric(horizontal: 8.0, vertical: 0.0)),
      isExpanded: true,
      value: value,
      isDense: true,
      hint: DokanHishabeeTextWidget(
        text: hint,
        fontSize: 18,
        fontWeight: FontWeight.w500,
        color: color ?? AppColors.primaryColor,
        maxLines: 1,
      ),
      style: TextStyle(
        fontSize: fontSize ?? 18,
      ),
      // icon: Icon(
      //   Icons.arrow_drop_down,
      //   color: iconColor ?? ThemeStyles.primaryColor,
      // ),
      // iconSize: 40,
      // buttonHeight: 60,
      // buttonPadding: const EdgeInsets.only(left: 20, right: 0.0),
      // dropdownDecoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(15),
      // ),
      // iconStyleData: const IconStyleData(
      //   icon: Padding(
      //     padding: EdgeInsets.all(8.0),
      //     child: Icon(
      //       Icons.expand_more_outlined,
      //     ),
      //   ),
      //   iconDisabledColor: ThemeStyles.primaryTextColor,
      // ),

      items: items.map((list) {
        return DropdownMenuItem(
          value: list,
          child: secondaryItemValue != null
              ? Wrap(
            direction: Axis.horizontal,
            spacing: 4.0, // gap between adjacent chips
            runSpacing: 1.0, // gap between lines
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: DokanHishabeeTextWidget(
                  text: list[itemValue],
                  fontSize: fontSize ?? 15,
                  color: color ?? AppColors.primaryColor,
                  textAlign: TextAlign.start,
                  fontWeight: FontWeight.w500,
                  maxLines: 1,
                ),

              ),
              Align(
                alignment: Alignment.centerLeft,
                child: DokanHishabeeTextWidget(
                  text: list[secondaryItemValue],
                  fontSize: 10,
                  color: AppColors.darkGrey,
                  textAlign: TextAlign.start,
                  maxLines: 1,
                ),
              )
            ],
          )
              : DokanHishabeeTextWidget(
            text: list[itemValue],
            fontSize: fontSize ?? 15,
            color: color ?? AppColors.primaryColor,
            textAlign: TextAlign.start,
            maxLines: 1,
          ),
        );
      }).toList(),
      onChanged: onChanged,
      // validator: validator,
    );
  }
}
