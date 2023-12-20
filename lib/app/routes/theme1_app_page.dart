// ignore_for_file: constant_identifier_names

import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:weather_app/app/modules/stuff_manage/bindings/stuff_manage_binding.dart';
import 'package:weather_app/app/modules/stuff_manage/views/all_stuffed_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/root/bindings/root_binding.dart';
import '../modules/root/views/root_view.dart';
import '../modules/stuff_manage/views/stuff_category_view.dart';
import 'app_routes.dart';

class Theme1AppPages{
  static const INITIAL = Routes.STUFFCATEGORY;

  static final routes = [
    GetPage(name: Routes.ROOT, page: () => const RootView(), binding: RootBinding()),
    GetPage(name: Routes.HOME, page: () => const HomeView(), binding: HomeBinding()),
    GetPage(name: Routes.AllSTUFF, page: () => const AllStuffView(), binding: StuffManageBinding()),
    GetPage(name: Routes.STUFFCATEGORY, page: () => const StuffCategoryView(), binding: StuffManageBinding()),

  ];
}