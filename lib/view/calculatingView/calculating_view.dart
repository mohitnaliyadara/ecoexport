import 'package:calculator/res/appColors/app_colors.dart';
import 'package:calculator/view/widgets/20FitContainer/20_fit_container.dart';
import 'package:calculator/view/widgets/40FitContainer/40_fit_container.dart';
import 'package:calculator/view/widgets/button/ElavatedButton/elevated_custom_button.dart';
import 'package:calculator/view/widgets/numberOfContainerFiled/number_of_container_filed.dart';
import 'package:calculator/view/widgets/containerLoadingField/container_loading_field.dart';
import 'package:calculator/view/widgets/priceField/price_field.dart';
import 'package:calculator/view/widgets/marginValuePercentage/margin_value_percentage.dart';
import 'package:calculator/view/widgets/usdRateField/usd_rate_view.dart';
import 'package:calculator/viewmodel/controller/homeViewController/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../widgets/fixedValueField/freightCounFixedValue/freight_cont_value_fixed.dart';
import '../widgets/fixedValueField/miscCostFixedView/misc_cost_view_fixed.dart';

class CalculatingView extends StatefulWidget {
  const CalculatingView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _CalculatingViewState createState() => _CalculatingViewState();
}

class _CalculatingViewState extends State<CalculatingView> {
  @override
  void initState() {
    super.initState();

    HomeViewController.loadAllData();
  }

  static final List<Widget> widgetOption = <Widget>[
    const Fit20Container(),
    const Fit40Container(),
  ];
  final pageController = PageController();

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appBackColor,
        title: Text(
          'Calculate',
          textAlign: TextAlign.left,
          style: TextStyle(
            fontSize: 22,
            color: AppColors.focusBorderColor,
          ),
        ),
      ),
      backgroundColor: AppColors.appBackColor,
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  PriceField(
                    height: 50,
                    width: 160,
                    topMargin: 50,
                    text: "Price",
                  ),
                  FreightContFixedValue(
                    text: "Freight/Cont",
                    height: 50,
                    width: 160,
                    topMargin: 50,
                  )
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  NumberOFContainerFiled(
                    text: "No. Of Container",
                    width: 160,
                    topMargin: 20,
                    height: 50,
                  ),
                  ContainerLoadingField(
                    height: 50,
                    width: 160,
                    topMargin: 20,
                    text: "CTN LOADING",
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ProfitPercentage(
                    text: "Percentage",
                    height: 50,
                    width: 160,
                    topMargin: 20,
                  ),
                  MiscCostFixedView(
                    text: "Misc",
                    width: 160,
                    topMargin: 20,
                    height: 50,
                  ),
                ],
              ),
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  UsdRateView(
                    text: "USD Rate",
                    height: 50,
                    width: 160,
                    topMargin: 20,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Container(
                color: AppColors.appBackColor,
                height: 200,
                child: PageView(
                  controller: pageController,
                  onPageChanged: (index) {
                    setState(() {
                      HomeViewController.currentPage = index;
                    });
                    HomeViewController.currentPage = index;

                    // ignore: unrelated_type_equality_checks
                    if (HomeViewController.currentPage != 0) {
                      HomeViewController.load40FitContainerValue();
                    } else {
                      HomeViewController.loadAllData();
                    }
                  },
                  children: widgetOption,
                ),
              ),
              SizedBox(height: Get.height * 0.153),
              ElevatedCustomButton(
                text: "Calculate",
                onPress: () {
                  HomeViewController.rateMTCal();
                  HomeViewController.productValueCal();
                  HomeViewController.agencyCustomsValueCal();
                  HomeViewController.thcValueCal();
                  HomeViewController.total1ValueCal();
                  HomeViewController.fobMTNetValueCal();
                  HomeViewController.freingtContCal();
                  HomeViewController.total2ValueCal();
                  HomeViewController.cifMTNetValueCal();
                  HomeViewController.fobMTProfitCal();
                  HomeViewController.cifMTProfitValueCal();
                  HomeViewController.fobMTMarginValueCal();
                  HomeViewController.cifMTMarginValueCal();

                  if (HomeViewController.currentPage != 0) {
                    HomeViewController.saved40FitData();
                  } else {
                    HomeViewController.savedAllData();
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
