import 'package:get/get.dart';

import 'package:nice_spot/app/modules/home/controllers/news_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NewsController>(
      () => NewsController(),
    );
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
  }
}
