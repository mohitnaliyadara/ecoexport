import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:calculator/view/advanceSetting/advance_setting.dart';
import 'package:calculator/view/calculatingView/calculating_view.dart';
import 'package:calculator/viewmodel/controller/homeViewController/home_view_controller.dart';
import 'package:calculator/res/appColors/app_colors.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  int _selectedIndex = 0;
  final PageController _pageController = PageController();

  // Initialize HomeViewController using Get.put
  final HomeViewController homeController = Get.put(HomeViewController());

  static final List<Widget> _widgetOptions = <Widget>[
    const CalculatingView(),
    const AdvanceSetting(),
  ];

  void _onItemTapped(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  void dispose() {
    Get.delete<HomeViewController>();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: _pageController,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: _widgetOptions,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.calculate_outlined),
            label: 'Calculate',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Advance Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: AppColors.focusBorderColor,
        onTap: _onItemTapped,
        backgroundColor: AppColors.appBackColor,
      ),
    );
  }
}
