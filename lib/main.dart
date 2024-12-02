import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:month_year_picker/month_year_picker.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:task/core/routing/routes.dart';

import 'core/di/di.dart';
import 'core/routing/app_router.dart';

void main() {
  configureDependencies();
  runApp(MyApp(
    appRouter: AppRouter(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.appRouter,
  });
  final AppRouter appRouter;
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(
        600,
        1024,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      // Use builder only if you need to use library outside ScreenUtilInit context
      builder: (_, child) {
        return MaterialApp(
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: const [
              Breakpoint(start: 0, end: 450, name: MOBILE),
              Breakpoint(start: 451, end: 800, name: TABLET),
              Breakpoint(start: 801, end: 1920, name: DESKTOP),
              Breakpoint(start: 1921, end: double.infinity, name: '4K'),
            ],
          ),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            MonthYearPickerLocalizations.delegate,
          ],
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepPurple,
            ),
            useMaterial3: true,
          ),
          initialRoute: Routes.homeScreen,
          onGenerateRoute: appRouter.generateRoute,
        );
      },
    );
  }
}
