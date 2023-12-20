import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/stuff_manage/controllers/stuff_manage_controller.dart';
import 'package:weather_app/common/size_config.dart';
import 'components/closet_card.dart';
import 'components/stuff_item.dart';

class StuffCategoryView extends GetView<StuffManageController> {
  const StuffCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
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
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              ClosetCard(
                assetPath: "assets/categories/tshirt.png",
                title: "Áo",
                items: [
                  "assets/fake_data/shirt1.jpg",
                  "assets/fake_data/shirt2.jpg",
                  "assets/fake_data/shirt2.jpg",
                  "assets/fake_data/shirt2.jpg",
                  "assets/fake_data/shirt2.jpg",
                  "assets/fake_data/shirt2.jpg",
                  "assets/fake_data/shirt2.jpg",
                ],
              ),
              ClosetCard(
                assetPath: "assets/categories/woman-clothes.png",
                title: "Đồ nữ",
                items: [
                  "assets/fake_data/shirt1.jpg",
                  "assets/fake_data/shirt2.jpg",
                  "assets/fake_data/shirt2.jpg",
                  "assets/fake_data/shirt2.jpg",
                  "assets/fake_data/shirt2.jpg",
                  "assets/fake_data/shirt2.jpg",
                  "assets/fake_data/shirt2.jpg",
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
