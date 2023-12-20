import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../controllers/root_controller.dart';

class RootBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<RootController>(() => RootController());
    Get.put(HomeController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.put(HomeController(), permanent: true);
    Get.put(HomeController(), permanent: true);
  }
}