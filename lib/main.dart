import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:nixui/themes/theme.dart';

import 'injector.dart';
import 'resources/widgets/dialog_manager.dart';
import 'routes/app_pages.dart';

void main() async {
  initializeDateFormatting();
  WidgetsFlutterBinding.ensureInitialized();

  NxTheme.setupBaseColor(
    primary: const Color(0xff182d4e),
    secondary: const Color(0xfff6c872)
  );

  NxTheme.setupTextTheme(
    textColor: const Color(0xff000000),
    fontFamily: 'Poppins',
  );

  NxTheme.setupButtonTheme(
    radius: 50,
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 24),
    textColor: const Color(0xff3f3d56),
    iconColor: const Color(0xff3f3d56),
    backgroundColor: const Color(0xfffebb1b),
    disabledBackgroundColor: NxColor.primary100,
    fontWeight: FontWeight.w600
  );

  NxTheme.setupInputFielldTheme(
    prefixColor: NxTextTheme.textColor,
    backgroundColor: const Color(0xfffbfbfb),
    borderColor: Colors.transparent,
    hintTextColor: const Color(0xffbfbfbf),
    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
    dropdownPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
    underlinedPadding: const EdgeInsets.symmetric(vertical: 16),
    fontWeight: FontWeight.w600,
    fontSize: 14,
    radius: 50,
    errorIcon: const Icon(Icons.info_rounded),
  );

  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Poppins',
        primaryColor: NxColor.primary,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.white,
          elevation: 0,
          shadowColor: Colors.grey[50],
          iconTheme: IconThemeData(
            color: NxTextTheme.textColor
          ),
          titleTextStyle: TextStyle(
            color: NxTextTheme.textColor,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600
          )
        ),
        dividerTheme: const DividerThemeData(thickness: 0, space: 0),
        dividerColor: NxColor.border, colorScheme: ColorScheme.fromSwatch().copyWith(
          primary: NxColor.primary,
          secondary: NxColor.secondary,
        ).copyWith(error: NxColor.error),
      ),
      title: "Kirimant",
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