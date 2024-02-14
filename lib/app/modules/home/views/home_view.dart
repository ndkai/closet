import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/common/size_config.dart';

import '../controllers/home_controller.dart';
import 'components/stuff_item.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey.withOpacity(.1),
        leading: Center(
          child: Text("My Closet"),
        ),
        leadingWidth: 100,
        actions: [
          Icon(
            Icons.ac_unit
          ),
          Icon(
              Icons.ac_unit
          ),
          Icon(
              Icons.ac_unit
          ),
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            Text("Good morning, Kaind"),
            Text("See your dress to day"),
            Row(
              children: [
                Container(

                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
