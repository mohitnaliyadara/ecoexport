import 'package:calculator/res/appColors/app_colors.dart';
import 'package:calculator/view/widgets/cifValeMTProfit/cif_value_profit_filed.dart';
import 'package:calculator/view/widgets/cifValueFiled/cif_value_filed.dart';
import 'package:calculator/view/widgets/cifValueMTMargin/cif_value_margin_filed.dart';
import 'package:calculator/view/widgets/fobMTProfitValue/fob_profit_value.dart';
import 'package:calculator/view/widgets/fobMTValueNetView/fob_value_view_net.dart';
import 'package:calculator/view/widgets/fobValueMargin/fob_value_margin_filed.dart';
import 'package:flutter/material.dart';

class Fit40Container extends StatelessWidget {
  const Fit40Container({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appBackColor,
      body: Column(
        children: [
          Container(
            width: 333,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.textBackColor,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              "40 Ft. CONTAINER",
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.w500,
                  color: AppColors.textFieldTextColor),
            ),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FobMTValueNetView(
                text: "FOB/MT Net",
                enable: true,
                height: 50,
                width: 110,
                topMargin: 15,
              ),
              FobMTValueMargin(
                text: "P",
                height: 50,
                width: 110,
                topMargin: 15,
              ),
              FobMTValueProfitView(
                text: "FOB",
                height: 50,
                width: 110,
                topMargin: 15,
              )
            ],
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CifValueField(
                text: "CIF/MT Net",
                height: 50,
                width: 110,
                topMargin: 20,
              ),
              CifValueMTMargin(
                text: "P",
                width: 110,
                height: 50,
                topMargin: 15,
              ),
              CifValueProfitField(
                text: "CIF",
                height: 50,
                width: 110,
                topMargin: 20,
              )
            ],
          ),
        ],
      ),
    );
  }
}
