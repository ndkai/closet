import 'package:get/get.dart';
import 'package:weather_app/app/providers/remote_data_provider.dart';


class WeatherRepository{
  late RemoteDataProvider _provider;
  WeatherRepository(){
    _provider = Get.find<RemoteDataProvider>();
  }


}