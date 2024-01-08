import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/app/modules/stuff_manage/controllers/stuff_manage_controller.dart';

class DetailedCatgoryView extends GetView<StuffManageController>{
  const DetailedCatgoryView({super.key});
  @override
  Widget build(BuildContext context) {
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

        },
        child: const Icon(Icons.add),
      ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  controller.choosingStuffCategoty!.icon!,
                  height: 30,
                  width: 30,
                ),
                Hero(
                  tag: "category",
                  child: Text(
                    controller.choosingStuffCategoty!.name!,
                    style: GoogleFonts.sourceSans3(
                        fontWeight: FontWeight.bold,
                        fontSize: 20
                    ),
                  ),
                ),
              ],
            ),
            Expanded(child: GridView.builder(
                itemCount: 20,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, // Number of columns in the grid
                  crossAxisSpacing: 5.0, // Spacing between columns
                  mainAxisSpacing: 5.0, // Spacing between rows
                ),
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.asset("assets/fake_data/shirt1.jpg"),
                  );
                }))
          ],
        )
      ),
    );
  }

}