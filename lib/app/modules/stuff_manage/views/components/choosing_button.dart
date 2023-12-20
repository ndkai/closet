import 'package:flutter/material.dart';

class ChoosingButton extends StatelessWidget {
  final String title;
  const ChoosingButton({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.black45),
        margin: const EdgeInsets.only(right: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        child: Text(title, style: const TextStyle(color: Colors.white),));
  }
}
