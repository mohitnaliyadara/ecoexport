// advance_setting.dart
import 'package:calculator/view/calculatingView/calculating_view.dart';
import 'package:calculator/view/widgets/button/ElavatedButton/elevated_custom_button.dart';
import 'package:calculator/view/widgets/fixedValueField/certificationCostFixedView/certification_cost_view_fixed.dart';
import 'package:calculator/view/widgets/fixedValueField/insuranceFixedValue/insurance_value_fixed.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator/view/widgets/fixedValueField/agency_CustomesFixedView/agency_customs_view_fixed.dart';
import 'package:calculator/view/widgets/fixedValueField/blValueFixedView/bl_value_view_fixed.dart';
import 'package:calculator/view/widgets/fixedValueField/thcValueFixedView/thc_value_view_fixed.dart';
import 'package:calculator/viewmodel/controller/homeViewController/home_view_controller.dart';
import 'package:calculator/res/appColors/app_colors.dart';

class AdvanceSetting extends StatefulWidget {
  const AdvanceSetting({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _AdvanceSettingState createState() => _AdvanceSettingState();
}

class _AdvanceSettingState extends State<AdvanceSetting> {
  // Access the controller instance
  final homeController = Get.find<HomeViewController>();
  final calculatingView = Get.put(const CalculatingView());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBackColor,
        title: Text(
          'Advance Setting',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 22,
            color: AppColors.focusBorderColor,
          ),
        ),
      ),
      backgroundColor: AppColors.appBackColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AgencyCustomsFixedView(
                  text: "Agency",
                  width: 160,
                  topMargin: 50,
                  height: 50,
                ),
                ThcValueFixedView(
                  text: "Thc",
                  width: 160,
                  topMargin: 50,
                  height: 50,
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlValueFixedView(
                  text: "BL",
                  width: 160,
                  topMargin: 20,
                  height: 50,
                ),
                CertificationCostFixedView(
                  text: "Certification",
                  width: 160,
                  topMargin: 20,
                  height: 50,
                ),
              ],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [],
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                InsuranceValueFixed(
                  text: "Insurance",
                  width: 160,
                  topMargin: 20,
                  height: 50,
                ),
              ],
            ),
            SizedBox(height: Get.height * 0.45),
            ElevatedCustomButton(
              text: "Saved",
              onPress: () {
                if (HomeViewController.currentPage != 0) {
                  HomeViewController.saved40FitContainerFixedValue();
                } else {
                  HomeViewController.savedFixedValue();
                }
              },
            )
          ],
        ),
      ),
    );
  }
}
