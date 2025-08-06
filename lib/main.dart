import 'package:bndemo/core/utils/routes/app_route.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'features/home/presentation/controller/team_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Teams',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        useMaterial3: true,
      ),
      initialRoute: Routes.dashboard,
      initialBinding: AppBinding(),
      getPages: getPages,
    );
  }
}

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => TeamController());
  }
}
