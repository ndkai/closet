import 'package:weather_app/app/models/stuff_category.dart';

class AppConstants{
  static String version = "v1.1.0";

  static const int timeout = 30000;

  static const String remoteAPi = "https://vientim-user.bakco.vn/api";

  static var stuffCategories = [
    StuffCategory(name: 'Áo thun', asset: 'assets/stuff_catgories/'),
    StuffCategory(name: 'Quần dài', asset: 'assets/stuff_catgories/'),
    StuffCategory(name: 'Phụ kiện', asset: 'assets/stuff_catgories/'),

  ];
}


