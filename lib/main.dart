import 'dart:collection';

import 'package:calculator/res/routes/routes.dart';
import 'package:calculator/view/advanceSetting/advance_setting.dart';
import 'package:calculator/view/homeView/home_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomeView(),
      getPages: Routes.appRoutes,
    );
  }
}
