import 'package:get/get.dart';
import 'package:weather_app/app/modules/stuff_manage/controllers/stuff_manage_controller.dart';


class StuffManageBinding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut<StuffManageController>(() => StuffManageController());
  }

}