import 'dart:convert';

import 'package:dio/dio.dart' as dio;
import 'package:get/get.dart';

class RemoteDataProvider extends GetxService{
  late dio.Dio _dio;
  RemoteDataProvider(){
      _dio = dio.Dio();
  }
  Future<RemoteDataProvider> init() async {
    return this;
  }

}