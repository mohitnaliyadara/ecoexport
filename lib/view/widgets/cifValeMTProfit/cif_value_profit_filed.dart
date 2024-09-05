import 'package:calculator/res/appColors/app_colors.dart';
import 'package:calculator/viewmodel/controller/homeViewController/home_view_controller.dart';
import 'package:flutter/material.dart';

class CifValueProfitField extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final Color color;
  final double topMargin;
  final double leftMargin;
  final bool enable;
  const CifValueProfitField({
    super.key,
    this.height = 0,
    this.width = 0,
    this.color = Colors.white,
    this.topMargin = 0,
    required this.text,
    this.enable = true,
    this.leftMargin = 0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin, left: leftMargin),
      height: height,
      width: width,
      child: TextFormField(
         style: TextStyle(color: AppColors.finalValueColor, fontSize: 17),
        textAlign: TextAlign.end,
        decoration: InputDecoration(
          prefix: const Text(
            "\$",
            style: TextStyle(fontSize: 20),
          ),
          label: Text(
            text,
            style: TextStyle(
                color: AppColors.textFieldTextColor,
                fontWeight: FontWeight.w500),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          disabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(20),
              borderSide: BorderSide(color: AppColors.focusBorderColor)),
        ),
        controller: HomeViewController.cifMTProfitValueController.value,
        keyboardType: TextInputType.number,
        enabled: false,
      ),
    );
  }
}
