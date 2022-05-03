
import 'package:flutter/material.dart';

class SlideDots extends StatelessWidget {
  bool isActive;
  SlideDots(this.isActive);

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 5),
      height: isActive ? 12 : 10,
      width: isActive ? 12 : 10,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFF9e9e9e) : const Color(0xFFe0e0e0),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }
}