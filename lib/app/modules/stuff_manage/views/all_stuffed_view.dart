import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/app/modules/stuff_manage/controllers/stuff_manage_controller.dart';
import 'components/choosing_button.dart';
import 'components/stuff_item.dart';

class AllStuffView extends GetView<StuffManageController> {
  const AllStuffView({super.key});

  @override
  Widget build(BuildContext context) {
    controller.initData();
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.chooseImage();
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Vật dụng của bạn",
          style: TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          InkWell(
            onTap: () {
              controller.changeChooseMode();
            },
            child: Obx(() => ChoosingButton(
                title: controller.choosingMode.value ? "Hủy":"Chọn")),
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Obx(
            () {
              if (controller.images.isNotEmpty) {
                return GridView.builder(
                    itemCount: controller.images.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3, // Number of columns in the grid
                      crossAxisSpacing: 10.0, // Spacing between columns
                      mainAxisSpacing: 10.0, // Spacing between rows
                    ),
                    itemBuilder: (context, index) {
                      return StuffItem(
                        key: controller.images[index].key,
                        path: controller.images[index].filePath!,
                      );
                    });
              } else {
                return Container();
              }
            },
          ),
        ),
      ),
    );
  }
}
