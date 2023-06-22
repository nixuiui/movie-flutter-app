import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:movie_app/features/home/home_routes.dart';
import 'package:movie_app/resources/colors/colors.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {

  @override
  void initState() {
    Future.delayed(const Duration(seconds: 1)).then(
      (value) => Get.offNamed(homeRoutes.home)
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Image.asset(
          'assets/launcher.png',
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}