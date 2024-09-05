import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeViewController extends GetxController {
  static var priceValueController = TextEditingController().obs;
  static var rateMTValueController = TextEditingController().obs;
  static var containerLoadingValueController = TextEditingController().obs;
  static var usdRateValueController = TextEditingController().obs;
  static var noOFContainerValueController = TextEditingController().obs;
  static var productValueController = TextEditingController().obs;
  static var agencyCustomsValueController = TextEditingController().obs;
  static var agencyCustomsFixedValueController = TextEditingController().obs;
  static var thcValueController = TextEditingController().obs;
  static var thcFixedValueController = TextEditingController().obs;
  static var blValueController = TextEditingController().obs;
  static var blFixedValueController = TextEditingController().obs;
  static var certificationCostController = TextEditingController().obs;
  static var certificationFixedCostValueController =
      TextEditingController().obs;
  static var miscCostController = TextEditingController().obs;
  static var miscFixedCostValueController = TextEditingController().obs;
  static var total1ValueController = TextEditingController().obs;
  static var profitPercentageValueController = TextEditingController().obs;
  static var fobMTVNetalueController = TextEditingController().obs;
  static var freightContController = TextEditingController().obs;
  static var freightContFixedValueController = TextEditingController().obs;
  static var insuranceFixedValueController = TextEditingController().obs;
  static var total2ValueController = TextEditingController().obs;
  static var cifMTNetValueController = TextEditingController().obs;
  static var cifMTProfitValueController = TextEditingController().obs;
  static var fobMTProfitValueController = TextEditingController().obs;
  static var fobMTMarginValueController = TextEditingController().obs;
  static var cifMTMarginValueController = TextEditingController().obs;

  static var currentPage = 0;

  //variables
  static double priceValue = 0;
  static double total1Value = 0;
  static double productValue = 0;
  static double agencyCustomsValue = 0;
  static double thcValue = 0;

  static double noOfContainerValue = 0;
  static double rateMTValue = 0;
  static double ctnLoadingValue = 0;
  static double fobMT = 0;
  static double fobMTProfitValue = 0;
  static double fobMTNetValue = 0;
  static double freightContValue = 0;
  static double total2Value = 0;
  static double cifMTNetValue = 0;
  static double cifValueProfit = 0;
  static double cifValueMargin = 0;
  static double profitPercentageValue = 0;
  static double fobMTMarginValue = 0;

  // fixedValue
  static double usdRateFixedValue = 0;
  static double agencyCustomsValueFixed = 0;
  static double thcFixed = 0;
  static double blFixed = 0;
  static double certificationCostFixed = 0;
  static double miscCostFixed = 0;
  static double freightContFixedValue = 0;
  static double insuranceFixedValue = 0;

  @override
  void onInit() {
    super.onInit();
    loadAllData();
  }

//RateMT Calculation
  static void rateMTCal() {
    priceValue = double.parse(priceValueController.value.text);
    if (priceValue != 0) {
      double result = priceValue * 1000;
      rateMTValueController.value.text = result.toStringAsFixed(2);
      rateMTValue = double.parse(rateMTValueController.value.text);
    }
  }

// Product Value Calcualtion
  static void productValueCal() {
    ctnLoadingValue = double.parse(containerLoadingValueController.value.text);
    noOfContainerValue = double.parse(noOFContainerValueController.value.text);
    rateMTValue = double.parse(rateMTValueController.value.text);
    if (ctnLoadingValue != 0 && noOfContainerValue != 0 && rateMTValue != 0) {
      double result = ctnLoadingValue * rateMTValue * noOfContainerValue;
      productValueController.value.text = result.toStringAsFixed(2);
      productValue =
          double.parse(productValueController.value.text).roundToDouble();
    }
  }

// Agency & Customs Calculation
  static void agencyCustomsValueCal() {
    noOfContainerValue = double.parse(noOFContainerValueController.value.text);
    agencyCustomsValueFixed =
        double.parse(agencyCustomsFixedValueController.value.text);
    if (noOfContainerValue != 0) {
      double result = noOfContainerValue * agencyCustomsValueFixed;
      agencyCustomsValueController.value.text = result.toStringAsFixed(2);
      agencyCustomsValue =
          double.parse(agencyCustomsValueController.value.text).roundToDouble();
    }
  }

//THC value Calculation
  static void thcValueCal() {
    thcFixed = double.parse(thcFixedValueController.value.text);
    noOfContainerValue = double.parse(noOFContainerValueController.value.text);
    if (noOfContainerValue != 0 && thcFixed != 0) {
      double result = noOfContainerValue * thcFixed;
      thcValueController.value.text = result.toStringAsFixed(2);
      thcValue = double.parse(thcValueController.value.text).roundToDouble();
    }
  }

// total1  after bl,THC and more cost add
  static void total1ValueCal() {
    productValue = double.parse(productValueController.value.text);
    agencyCustomsValue = double.parse(agencyCustomsValueController.value.text);
    thcValue = double.parse(thcValueController.value.text);
    blFixed = double.parse(blFixedValueController.value.text);
    certificationCostFixed =
        double.parse(certificationFixedCostValueController.value.text);
    miscCostFixed = double.parse(miscFixedCostValueController.value.text);

    if (productValue != 0 &&
        agencyCustomsValue != 0 &&
        thcValue != 0 &&
        blFixed != 0 &&
        certificationCostFixed != 0 &&
        miscCostFixed != 0) {
      double result = productValue +
          agencyCustomsValue +
          thcValue +
          blFixed +
          certificationCostFixed +
          miscCostFixed;
      total1ValueController.value.text = result.toStringAsFixed(2);
      total1Value = double.parse(total1ValueController.value.text);
    }
  }

// FOBMT Net Value Calculation
  static void fobMTNetValueCal() {
    total1Value = double.parse(total1ValueController.value.text);
    noOfContainerValue = double.parse(noOFContainerValueController.value.text);
    ctnLoadingValue = double.parse(containerLoadingValueController.value.text);
    usdRateFixedValue = double.parse(usdRateValueController.value.text);

    if (total1Value != 0 && noOfContainerValue != 0 && ctnLoadingValue != 0) {
      double result = ((total1Value / usdRateFixedValue) / noOfContainerValue) /
          ctnLoadingValue;
      String fobMTValues = result.toStringAsFixed(2);
      fobMTVNetalueController.value.text = fobMTValues;
      fobMTNetValue = double.parse(fobMTValues);
    }
  }

// FOBMT add Profit Margin Value Calculation
  static void fobMTProfitCal() {
    fobMTNetValue = double.parse(fobMTVNetalueController.value.text);
    profitPercentageValue =
        double.parse(profitPercentageValueController.value.text);
    if (fobMTNetValue != 0 && profitPercentageValue != 0) {
      profitPercentageValue = profitPercentageValue / 100;
      double result = fobMTNetValue + (profitPercentageValue * fobMTNetValue);

      fobMTProfitValueController.value.text = result.toStringAsFixed(2);
      fobMTProfitValue = double.parse(fobMTProfitValueController.value.text);
    }
  }

// FOBMT Profit Value Calculation
  static void fobMTMarginValueCal() {
    fobMTNetValue = double.parse(fobMTVNetalueController.value.text);
    fobMTProfitValue = double.parse(fobMTProfitValueController.value.text);
    double result = fobMTProfitValue - fobMTNetValue;
    fobMTMarginValueController.value.text = result.toStringAsFixed(2);
    fobMTMarginValue = double.parse(fobMTMarginValueController.value.text);
  }

// Freight Container Value Calculation
  static void freingtContCal() {
    freightContFixedValue =
        double.parse(freightContFixedValueController.value.text);
    usdRateFixedValue = double.parse(usdRateValueController.value.text);
    noOfContainerValue = double.parse(noOFContainerValueController.value.text);
    double result =
        (freightContFixedValue * (usdRateFixedValue + 2) * noOfContainerValue);
    freightContController.value.text = result.toStringAsFixed(2);
    freightContValue = double.parse(freightContController.value.text);
  }

// after insurance and other cost add Total Value Calculation
  static void total2ValueCal() {
    total1Value = double.parse(total1ValueController.value.text);
    freightContValue = double.parse(freightContController.value.text);
    insuranceFixedValue =
        double.parse(insuranceFixedValueController.value.text);
    // Get.snackbar("title", insuranceFixedValue.toString());

    if (total1Value != 0 && freightContValue != 0 && insuranceFixedValue != 0) {
      double result = total1Value + freightContValue + insuranceFixedValue;
      total2ValueController.value.text = result.toStringAsFixed(2);
      total2Value = double.parse(total2ValueController.value.text);
    }
  }

// CIF Value Net Calcualtion
  static void cifMTNetValueCal() {
    total2Value = double.parse(total2ValueController.value.text);
    ctnLoadingValue = double.parse(containerLoadingValueController.value.text);
    noOfContainerValue = double.parse(noOFContainerValueController.value.text);
    usdRateFixedValue = double.parse(usdRateValueController.value.text);
    total2Value = (total2Value / usdRateFixedValue);

    if (total2Value != 0 &&
        usdRateFixedValue != 0 &&
        noOfContainerValue != 0 &&
        ctnLoadingValue != 0) {
      double result = total2Value / noOfContainerValue / ctnLoadingValue;
      cifMTNetValueController.value.text = result.toStringAsFixed(2);
      cifMTNetValue = double.parse(cifMTNetValueController.value.text);
    }
  }

//CIF Value Profit Margin add Calculation
  static void cifMTProfitValueCal() {
    cifMTNetValue = double.parse(cifMTNetValueController.value.text);
    profitPercentageValue =
        double.parse(profitPercentageValueController.value.text);

    profitPercentageValue = profitPercentageValue / 100;
    double result = cifMTNetValue + (cifMTNetValue * profitPercentageValue);
    cifMTProfitValueController.value.text = result.toStringAsFixed(2);
    cifValueProfit = double.parse(cifMTProfitValueController.value.text);
  }

// CIF Profit Value Calculation
  static void cifMTMarginValueCal() {
    cifMTNetValue = double.parse(cifMTNetValueController.value.text);
    cifValueProfit = double.parse(cifMTProfitValueController.value.text);
    double result = (cifValueProfit - cifMTNetValue);
    cifMTMarginValueController.value.text = result.toStringAsFixed(2);
    cifValueMargin = double.parse(cifMTMarginValueController.value.text);
  }

  static savedFixedValue() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.clear();
    await pref.setString("agencyCustomsFixedValue",
        agencyCustomsFixedValueController.value.text);
    await pref.setString("THCFixedValue", thcFixedValueController.value.text);
    await pref.setString("BlFixedValue", blFixedValueController.value.text);
    await pref.setString("certificationFixedCostValue",
        certificationFixedCostValueController.value.text);
    await pref.setString(
        'insuranceFixedValue', insuranceFixedValueController.value.text);
  }

  static void savedAllData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.clear();
    await pref.setString('priceValue', priceValueController.value.text);
    await pref.setString('rateMTValue', rateMTValueController.value.text);
    await pref.setString(
        'containerLoadingValue', containerLoadingValueController.value.text);
    await pref.setString('usdRateValue', usdRateValueController.value.text);
    await pref.setString(
        'noOFContainerValue', noOFContainerValueController.value.text);
    await pref.setString('productValue', productValueController.value.text);
    await pref.setString(
        'agencyCustomsValue', agencyCustomsValueController.value.text);
    await pref.setString('THCValue', thcValueController.value.text);
    await pref.setString('total1Value', total1ValueController.value.text);
    await pref.setString('freightContValue', freightContController.value.text);
    await pref.setString('total2Value', total2ValueController.value.text);
    await pref.setString('cifMTNetValue', cifMTNetValueController.value.text);
    await pref.setString(
        "cifMTProfitValue", cifMTProfitValueController.value.text);
    await pref.setString(
        "cifMTMarginValue", cifMTMarginValueController.value.text);
    await pref.setString(
        'profitPercentageValue', profitPercentageValueController.value.text);
    await pref.setString(
        'freightContFixedValue', freightContFixedValueController.value.text);
    await pref.setString(
        "miscFixedCostValue", miscFixedCostValueController.value.text);
    await pref.setString('fobMTNetValue', fobMTVNetalueController.value.text);
    await pref.setString(
        "fobMTProfitValue", fobMTProfitValueController.value.text);
    await pref.setString(
        "fobMTMarginValue", fobMTMarginValueController.value.text);
  }

  static void loadAllData() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    // pref.clear();
//fixed
    agencyCustomsFixedValueController.value.text =
        pref.getString("agencyCustomsFixedValue") ?? "14000";
    thcFixedValueController.value.text =
        pref.getString("THCFixedValue") ?? "16000";
    blFixedValueController.value.text =
        pref.getString("BlFixedValue") ?? "5500";
    certificationFixedCostValueController.value.text =
        pref.getString("certificationFixedCostValue") ?? "5000";
    insuranceFixedValueController.value.text =
        (pref.getString("insuranceFixedValue") ?? "15000");

    //
    priceValueController.value.text = (pref.getString("priceValue") ?? "50");
    rateMTValueController.value.text = (pref.getString("rateMTValue") ?? "0");
    containerLoadingValueController.value.text =
        (pref.getString("containerLoadingValue") ?? "13");
    usdRateValueController.value.text =
        (pref.getString("usdRateValue") ?? "83");
    noOFContainerValueController.value.text =
        (pref.getString("noOFContainerValue") ?? "5");
    productValueController.value.text = (pref.getString("productValue") ?? "0");
    agencyCustomsValueController.value.text =
        (pref.getString("agencyCustomsValue") ?? "0");
    thcValueController.value.text = (pref.getString("THCValue") ?? "0");
    freightContController.value.text =
        (pref.getString("freightContValue") ?? "0");
    total2ValueController.value.text = (pref.getString("total2Value") ?? "0");

    total1ValueController.value.text = (pref.getString("total1Value") ?? "0");

    cifMTNetValueController.value.text =
        (pref.getString("cifMTNetValue") ?? "0");
    cifMTProfitValueController.value.text =
        (pref.getString("cifMTProfitValue") ?? "0");
    cifMTMarginValueController.value.text =
        (pref.getString("cifMTMarginValue") ?? "0");

    profitPercentageValueController.value.text =
        (pref.getString("profitPercentageValue") ?? "5");
    freightContFixedValueController.value.text =
        (pref.getString("freightContFixedValue") ?? "1900");
    miscFixedCostValueController.value.text =
        pref.getString("miscFixedCostValue") ?? "5000";

    fobMTVNetalueController.value.text =
        (pref.getString("fobMTNetValue") ?? "0");
    fobMTProfitValueController.value.text =
        (pref.getString("fobMTProfitValue") ?? "0");
    fobMTMarginValueController.value.text =
        (pref.getString("fobMTMarginValue") ?? "0");
  }

  static void load40FitContainerValue() async {
    //fixed
    SharedPreferences prefs = await SharedPreferences.getInstance();
    agencyCustomsFixedValueController.value.text =
        prefs.getString("agencyCustomsFixedValue40") ?? "14000";
    thcFixedValueController.value.text =
        prefs.getString("THCFixedValue40") ?? "16000";
    blFixedValueController.value.text =
        prefs.getString("BlFixedValue40") ?? "5500";
    certificationFixedCostValueController.value.text =
        prefs.getString("certificationFixedCostValue40") ?? "5000";
    insuranceFixedValueController.value.text =
        (prefs.getString("insuranceFixedValue40") ?? "15000");
    //
    priceValueController.value.text = (prefs.getString("priceValue40") ?? "50");
    rateMTValueController.value.text = (prefs.getString("rateMTValue40") ?? "0");
    containerLoadingValueController.value.text =
        (prefs.getString("containerLoadingValue40") ?? "13");
    usdRateValueController.value.text =
        (prefs.getString("usdRateValue40") ?? "83");
    noOFContainerValueController.value.text =
        (prefs.getString("noOFContainerValue40") ?? "5");
    productValueController.value.text =
        (prefs.getString("productValue40") ?? "0");
    agencyCustomsValueController.value.text =
        (prefs.getString("agencyCustomsValue40") ?? "0");
    thcValueController.value.text = (prefs.getString("THCValue40") ?? "0");
    freightContController.value.text =
        (prefs.getString("freightContValue40") ?? "0");
    total2ValueController.value.text = (prefs.getString("total2Value40") ?? "0");

    total1ValueController.value.text = (prefs.getString("total1Value40") ?? "0");

    cifMTNetValueController.value.text =
        (prefs.getString("cifMTNetValue40") ?? "0");
    cifMTProfitValueController.value.text =
        (prefs.getString("cifMTProfitValue40") ?? "0");
    cifMTMarginValueController.value.text =
        (prefs.getString("cifMTMarginValue40") ?? "0");

    profitPercentageValueController.value.text =
        (prefs.getString("profitPercentageValue40") ?? "5");
    freightContFixedValueController.value.text =
        (prefs.getString("freightContFixedValue40") ?? "1900");
    miscFixedCostValueController.value.text =
        prefs.getString("miscFixedCostValue40") ?? "5000";

    fobMTVNetalueController.value.text =
        (prefs.getString("fobMTNetValue40") ?? "0");
    fobMTProfitValueController.value.text =
        (prefs.getString("fobMTProfitValue40") ?? "0");
    fobMTMarginValueController.value.text =
        (prefs.getString("fobMTMarginValue40") ?? "0");
  }

  static void saved40FitData() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // pref.clear();
    await prefs.setString('priceValue40', priceValueController.value.text);
    await prefs.setString('rateMTValue40', rateMTValueController.value.text);
    await prefs.setString(
        'containerLoadingValue40', containerLoadingValueController.value.text);
    await prefs.setString('usdRateValue40', usdRateValueController.value.text);
    await prefs.setString(
        'noOFContainerValue40', noOFContainerValueController.value.text);
    await prefs.setString('productValue40', productValueController.value.text);
    await prefs.setString(
        'agencyCustomsValue40', agencyCustomsValueController.value.text);
    await prefs.setString('THCValue40', thcValueController.value.text);
    await prefs.setString('total1Value40', total1ValueController.value.text);
    await prefs.setString('freightContValue40', freightContController.value.text);
    await prefs.setString('total2Value40', total2ValueController.value.text);
    await prefs.setString('cifMTNetValue40', cifMTNetValueController.value.text);
    await prefs.setString(
        "cifMTProfitValue40", cifMTProfitValueController.value.text);
    await prefs.setString(
        "cifMTMarginValue40", cifMTMarginValueController.value.text);
    await prefs.setString(
        'profitPercentageValue40', profitPercentageValueController.value.text);
    await prefs.setString(
        'freightContFixedValue40', freightContFixedValueController.value.text);
    await prefs.setString(
        "miscFixedCostValue40", miscFixedCostValueController.value.text);
    await prefs.setString('fobMTNetValue40', fobMTVNetalueController.value.text);
    await prefs.setString(
        "fobMTProfitValue40", fobMTProfitValueController.value.text);
    await prefs.setString(
        "fobMTMarginValue40", fobMTMarginValueController.value.text);
  }

  static void saved40FitContainerFixedValue() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("agencyCustomsFixedValue40",
        agencyCustomsFixedValueController.value.text);
    await prefs.setString("THCFixedValue40", thcFixedValueController.value.text);
    await prefs.setString("BlFixedValue40", blFixedValueController.value.text);
    await prefs.setString("certificationFixedCostValue40",
        certificationFixedCostValueController.value.text);
    await prefs.setString(
        'insuranceFixedValue40', insuranceFixedValueController.value.text);
  }
}
