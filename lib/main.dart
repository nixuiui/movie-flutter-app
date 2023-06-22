import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:movie_app/resources/colors/colors.dart';
import 'package:nixui/themes/theme.dart';

import 'injector.dart';
import 'resources/widgets/dialog_manager.dart';
import 'routes/app_pages.dart';

void main() async {
  initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();

  NxTheme.setupBaseColor(
    primary: AppColors.primary,
    secondary: AppColors.secondary
  );

  NxTheme.setupButtonTheme(
    backgroundColor: AppColors.primary,
    textColor: Colors.white,
    radius: 50
  );

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: NxColor.primary,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: NxColor.primary,
          elevation: 0,
          shadowColor: Colors.grey[50],
          iconTheme: IconThemeData(
            color: NxTextTheme.textColor
          ),
          titleTextStyle: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w600
          )
        ),
        dividerTheme: const DividerThemeData(thickness: 0, space: 0),
        dividerColor: NxColor.border, colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: NxColor.primary,
          secondary: NxColor.secondary,
        ).copyWith(error: NxColor.error),
      ),
      title: "Movie App",
      initialBinding: BindingsBuilder(Injector.init),
      getPages: AppPages.routes,
      initialRoute: AppPages.initial,
      builder: (context, widget) => Navigator(
        onGenerateRoute: (settings) => MaterialPageRoute(
          builder: (context) => DialogManager(
            child: widget,
          ),
        ),
      ),
    ),
  );
}