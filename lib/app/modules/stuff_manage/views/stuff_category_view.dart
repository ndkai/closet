import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/app/modules/stuff_manage/controllers/stuff_manage_controller.dart';
import 'package:weather_app/app/modules/stuff_manage/views/detailed_category_view.dart';
import 'package:weather_app/app/routes/app_routes.dart';
import 'package:weather_app/common/size_config.dart';
import 'add_category_view.dart';
import 'components/closet_card.dart';
import 'components/stuff_item.dart';

class StuffCategoryView extends GetView<StuffManageController> {
  const StuffCategoryView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.initCategory();
    SizeConfig().init(context);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Phân loại tủ đồ",
          style: GoogleFonts.sourceSans3(
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => AddCategoryView()));
        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Obx(() {
            return Column(
              children: controller.stuffCategories
                  .map((element) => ClosetCard(
                        assetPath: element.icon!,
                        title: element.name!,
                        items: const [
                          "assets/fake_data/shirt1.jpg",
                          "assets/fake_data/shirt2.jpg",
                          "assets/fake_data/shirt2.jpg",
                          "assets/fake_data/shirt2.jpg",
                          "assets/fake_data/shirt2.jpg",
                          "assets/fake_data/shirt2.jpg",
                          "assets/fake_data/shirt2.jpg",
                        ],
                        onTap: () {
                          controller.choosingStuffCategoty = element;
                         //
                        },
                      ))
                  .toList(),
            );
          }),
        ),
      ),
    );
  }
}
