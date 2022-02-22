import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:newapexproject/routes/app_route.dart';
import 'package:newapexproject/routes/app_screen.dart';
import 'package:newapexproject/screens/product_screen/products_screen.dart';
import 'package:newapexproject/screens/setting_screen/setting_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    visualDensity: VisualDensity.adaptivePlatformDensity;

    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
    ]);
    return  MediaQuery(
      data: const MediaQueryData(
        // size: Size(1000, 500),
      ),
      child:ScreenUtilInit(
        designSize: const Size (428,926),
        builder :()=> GetMaterialApp(
          debugShowCheckedModeBanner: false,
          // home: SettingScreen(),
          initialRoute: AppRoutes.home,
          getPages: AppScreens.screens,
        ),
      ),
    );
  }
}