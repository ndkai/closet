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
      body: SafeArea(
        child: Stack(
          children: [
            Row(
              children: [
                Container(
                  color: Colors.black,
                  height: SizeConfig.screenHeight,
                  width: 100,
                  child: ListView.builder(
                      itemCount: 20,
                      itemBuilder: (context, index) {
                        return Container(
                          padding: const EdgeInsets.all(8),
                          child: const Text(
                            "Quần áo",
                            style: TextStyle(color: Colors.white),
                          ),
                        );
                      }),
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: 20,
                        itemBuilder: (context, index) {
                          return SingleChildScrollView(
                            scrollDirection: Axis.horizontal,
                            child: DragTarget(
                              builder: (context, _, __) {
                                return Container(
                                  margin: const EdgeInsets.all(10),
                                  height: 200,
                                  width: 2000,
                                  color: Colors.yellow,
                                );
                              },
                              onAcceptWithDetails: (detail) {
                                print(detail);
                              },
                            ),
                          );
                        }))
              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 100,
                width: SizeConfig.screenWidth,
                color: Colors.black,
                child: ListView.builder(
                  itemCount: 20,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Draggable(
                      feedback: StuffDraggingItem(
                        dragKey: GlobalKey(),
                        widget: const StuffItem(),
                      ),
                      childWhenDragging: Container(),
                      child: const StuffItem(),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
