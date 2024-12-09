import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/route_manager.dart';
import 'package:test_media/core/routes/app_routes.dart';
import 'package:test_media/core/services/size_config.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: false,
      builder: (_, child) {
             return LayoutBuilder(
          builder: (context, constraints) {
            return OrientationBuilder(
              builder: (context, orientation) {
                SizeConfig().init(constraints, orientation);
                return GetMaterialApp.router(
                  routerDelegate: AppRoutes.appRouter.routerDelegate,
                  routeInformationParser:
                      AppRoutes.appRouter.routeInformationParser,
                  debugShowCheckedModeBanner: false,
                  routeInformationProvider:
                      AppRoutes.appRouter.routeInformationProvider,
                  title: 'Miles',
                );
              },
            );
          },
        );
      },

    );
  }
}
