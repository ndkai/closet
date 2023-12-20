import 'dart:io';
import 'package:flutter/material.dart';


class StuffItem extends StatefulWidget {
  final String path;

  const StuffItem({super.key, required this.path});

  @override
  State<StuffItem> createState() => StuffItemState();
}

class StuffItemState extends State<StuffItem> {
  bool _isChoose = false;
  bool chooseMode = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void turnOffChoosing(){
    if(chooseMode) {
      setState(() {
      _isChoose = false;
    });
    }
  }

  void turnOnChoosing(){
    if(chooseMode) {
      setState(() {
      _isChoose = true;
    });
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        if(chooseMode) {
          setState(() {
          _isChoose = !_isChoose;
        });
        }
      },
      child: Stack(
        children: [
          Image.file(File(widget.path), fit: BoxFit.contain),
          _isChoose ? Container(
            color: Colors.black12,
          ) : const SizedBox(),
          _isChoose ? const Align(
            alignment: Alignment.bottomRight,
            child: Icon(
              Icons.check_circle,
              color: Colors.green,
              size: 18,
            ),
          ) : const SizedBox()

        ],
      ),
    );
  }
}

class StuffDraggingItem extends StatelessWidget {
  const StuffDraggingItem({
    super.key,
    required this.dragKey,
    required this.widget,
  });

  final GlobalKey dragKey;
  final Widget widget;

  @override
  Widget build(BuildContext context) {
    return FractionalTranslation(
      translation: const Offset(0, -0.5),
      child: ClipRRect(
        key: dragKey,
        borderRadius: BorderRadius.circular(12),
        child: Opacity(
          opacity: 0.85,
          child: widget,
        ),
      ),
    );
  }
}
