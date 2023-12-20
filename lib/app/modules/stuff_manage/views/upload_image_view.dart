import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/stuff_manage/controllers/stuff_manage_controller.dart';
import 'package:weather_app/common/size_config.dart';
import 'components/stuff_item.dart';

class UploadImageView extends GetView<StuffManageController> {
  const UploadImageView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Phân loại tủ đồ",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Container(
              child: Column(
                children: [
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Icon(Icons.cloud),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
