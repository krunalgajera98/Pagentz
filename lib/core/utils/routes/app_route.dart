import 'package:bndemo/features/home/presentation/pages/dashboard.dart';
import 'package:flutter/animation.dart';
import 'package:get/get.dart';

class Routes {
  static const String dashboard = '/dashboard';
}

List<GetPage<dynamic>>? getPages = [
  GetPage(
    name: Routes.dashboard,
    page: () => DashboardPage(),
    curve: Curves.easeInOut,
  ),
];
