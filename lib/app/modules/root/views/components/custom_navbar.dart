// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'animated_,menu_button.dart';

const Color PRIMARY_COLOR = Colors.blueAccent;
const Color BACKGROUND_COLOR = Color(0xffE2E7F2);

class CustomBottomNavigationBar extends StatefulWidget {
  final Color backgroundColor;
  final Color itemColor;
  final List<CustomBottomNavigationItem> children;
  final Function(int)? onChange;
  final int currentIndex;

  const CustomBottomNavigationBar(
      {Key? key,
        this.backgroundColor = BACKGROUND_COLOR,
        this.itemColor = PRIMARY_COLOR,
        this.currentIndex = 0,
        required this.children,
        this.onChange})
      : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  void _changeIndex(int index) {
    if (widget.onChange != null) {
      widget.onChange!(index);
    }
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      color: widget.backgroundColor,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
        navBarItem(widget.children[0]),
        navBarItem(widget.children[1]),
          AnimatedMenuButton(
            radius: 50,
            homeWidget: item(
              color: Colors.black,
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
            actionWidgets: [
              InkWell(
                onTap: () {
                },
                child: item(
                  color: Colors.green,
                  child: const Icon(Icons.face),
                ),
              ),
              InkWell(
                onTap: () {
                },
                child: item(
                  color: Colors.blue,
                  child: const Icon(Icons.image),
                ),
              ),
              InkWell(
                onTap: () {
                },
                child: item(
                  color: Colors.red,
                  child: const Icon(Icons.cached_rounded),
                ),
              )
            ],
            animatedDuration: const Duration(milliseconds: 1000),
          ),
        navBarItem(widget.children[2]),
        navBarItem(widget.children[3]),
        ]
    ));
  }
  Widget item({required Widget child, required Color color}) {
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: color,
      ),
      child: child,
    );
  }
  Widget navBarItem(CustomBottomNavigationItem item){
    var color = item.color ?? widget.itemColor;
    var icon = item.icon;
    var label = item.label;
    int index = widget.children.indexOf(item);
    return GestureDetector(
      onTap: () {
        _changeIndex(index);
      },
      child: Container(
        width: 50,
        padding: const EdgeInsets.only(left: 10, right: 10),
        margin: const EdgeInsets.only(top: 10, bottom: 10),
        alignment: Alignment.center,
        decoration: BoxDecoration(
            color: widget.currentIndex == index
                ? item.color!.withOpacity(0.1)
                : Colors.transparent,
            borderRadius: BorderRadius.circular(10)),
        child:Icon(
          icon,
          size: 24,
          color: widget.currentIndex == index
              ? item.activeColor
              : color.withOpacity(0.5),
        ),
      ),
    );
  }
}

class CustomBottomNavigationItem {
  final IconData icon;
  final String label;
  final Color? color;
  final Color activeColor;

  CustomBottomNavigationItem(
      {required this.icon,
        required this.label,
        this.color,
        this.activeColor = Colors.blue});
}
