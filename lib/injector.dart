import 'package:get/get.dart';
import 'package:movie_app/core/services/dialog_service.dart';
import 'package:movie_app/core/services/toast_service.dart';

import 'core/services/network_service.dart';
import 'features/home/presentation/controllers/home_controller.dart';

abstract class Injector {
  static void init() {
    serviceInjection();
    homeInjection();
  }
}

void serviceInjection(){
  Get.put(DialogService());
  Get.put(NetworkService());
  Get.put(ToastService());
}

Future<void> homeInjection() async {
  Get.put(HomeController());
}