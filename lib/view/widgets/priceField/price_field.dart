import 'package:calculator/res/appColors/app_colors.dart';
import 'package:calculator/viewmodel/controller/homeViewController/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PriceField extends StatelessWidget {
  final String text;
  final double height;
  final double width;
  final Color color;
  final double topMargin;
  final bool enable;
  const PriceField({
    super.key,
    this.height = 0,
    this.width = 0,
    this.color = Colors.white,
    this.topMargin = 0,
    required this.text,
    this.enable = true,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      margin: EdgeInsets.only(top: topMargin),
      height: height,
      width: width,
      child: TextFormField(
        textAlign: TextAlign.end,
        decoration: InputDecoration(
          prefix: const Text(
            "\u{20B9}",
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
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(20),
            borderSide: BorderSide(color: AppColors.focusBorderColor),
          ),
        ),
        controller: HomeViewController.priceValueController.value,
        keyboardType: TextInputType.number,
      ),
    );
  }
}
