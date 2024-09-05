import 'package:calculator/res/appColors/app_colors.dart';
import 'package:calculator/viewmodel/controller/homeViewController/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CertificationCostFixedView extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final Color color;
  final double topMargin;
  final double leftMargin;
  final bool enable;
  const CertificationCostFixedView(
      {super.key,
      this.height = 0,
      this.width = 0,
      this.color = Colors.white,
      this.topMargin = 0,
      required this.text,
      this.enable = true,
      this.leftMargin = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: topMargin, left: leftMargin),
      height: height,
      width: width,
      child: TextFormField(
        textAlign: TextAlign.end,
        decoration: InputDecoration(
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
        controller:
            HomeViewController.certificationFixedCostValueController.value,
        keyboardType: TextInputType.number,
      ),
    );
  }
}