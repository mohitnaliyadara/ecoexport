import 'package:calculator/res/routes/routes_name.dart';
import 'package:calculator/view/advanceSetting/advance_setting.dart';
import 'package:calculator/view/calculatingView/calculating_view.dart';
import 'package:get/get.dart';

class Routes {
  static List<GetPage> appRoutes = [
    GetPage(
      name: RoutesName.homeView,
      page: () => const CalculatingView(),
    ),
    GetPage(
      name: RoutesName.advanceSetting,
      page: () => const AdvanceSetting(),
    ),
    GetPage(
      name: RoutesName.calculatingView,
      page: () => const CalculatingView(),
    )
  ];
}
