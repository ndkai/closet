import 'package:flutter/material.dart';

class StuffItem extends StatelessWidget {
  const StuffItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Image.asset("assets/loader.png", height: 100, width: 100,);
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
