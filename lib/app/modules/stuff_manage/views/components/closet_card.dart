import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:weather_app/common/size_config.dart';
import 'package:weather_app/common/ui.dart';

import '../../../../routes/app_routes.dart';

class ClosetCard extends StatefulWidget {
  final String title;
  final String assetPath;
  final List<String> items;
  final Function onTap;

  const ClosetCard(
      {super.key,
      required this.title,
      required this.assetPath,
      required this.items, required this.onTap});

  @override
  State<ClosetCard> createState() => _ClosetCardState();
}

class _ClosetCardState extends State<ClosetCard> {
  late List<int> modes;
  int currentIndex = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    modes = <int>[0, 1, 2];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(5),
            decoration: BoxDecoration(
              color: Colors.grey.withOpacity(.2),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: (){
                      widget.onTap();
                      Get.toNamed(Routes.DETAILEDCATEGORY);
                    },
                    child: Row(
                      children: [
                        // Image.asset(
                        //   widget.assetPath,
                        //   height: 30,
                        //   width: 30,
                        // ),
                        Hero(
                          tag: "category",
                          child: Text("${widget.title}", style: GoogleFonts.sourceSans3(fontWeight: FontWeight.w500, fontSize: 16),),
                        )
                      ],
                    )
                  ),
                  InkWell(
                    onTap: () {
                      print(((widget.items.length / 3).ceil()));
                      setState(() {
                        currentIndex++;
                        if (currentIndex > 2) {
                          currentIndex = 0;
                        }
                      });
                    },
                    child: SizedBox(
                      height: 30,
                      width: 30,
                      child: actionView(currentIndex),
                    ),
                  )
                ],
              ),
            ),
          ),
          stuffView(currentIndex)
        ],
      ),
    );
  }

  Widget stuffView(int index) {
    //0 -> listview, 1 -> gridview, 2 -> noview
    switch (index) {
      case 0:
        return Container(
          height: 150,
          child: ListView.builder(
              itemCount: widget.items.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.asset(widget.items[index]),
                  )),
        );
      case 1:
        return Container(
          width: SizeConfig.screenWidth,
          height: (SizeConfig.screenWidth! - 20) /
              3 *
              ((widget.items.length / 3).ceil()),
          child: GridView.builder(
              itemCount: widget.items.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3, // Number of columns in the grid
                crossAxisSpacing: 10.0, // Spacing between columns
                mainAxisSpacing: 10.0, // Spacing between rows
              ),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: Image.asset(widget.items[index]),
                );
              }),
        );
      default:
        return const SizedBox();
    }
  }

  Widget actionView(int index) {
    //0 -> listview, 1 -> gridview, 2 -> noview
    switch (index) {
      case 0:
        return const Icon(
          Icons.grid_view,
          size: 25,
        );
      case 1:
        return const Icon(
          Icons.visibility_off,
          size: 25,
        );
      default:
        return const Icon(
          Icons.list_outlined,
          size: 25,
        );
    }
  }
}
