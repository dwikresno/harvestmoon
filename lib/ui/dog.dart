// ignore_for_file: use_key_in_widget_constructors, avoid_unnecessary_containers, must_be_immutable

import 'package:flutter/material.dart';

class Dog extends StatelessWidget {
  bool isDogStopRun;
  double dogX;
  double dogY;
  String actionDog;
  String directionDog;
  int indicatorDog;
  Dog({
    required this.isDogStopRun,
    required this.dogX,
    required this.dogY,
    required this.actionDog,
    required this.directionDog,
    required this.indicatorDog,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: dogX,
      bottom: dogY,
      child: Container(
        child: Image.asset(
          isDogStopRun
              ? "assets/$actionDog-$indicatorDog.png"
              : "assets/dog-$actionDog-$directionDog-$indicatorDog.png",
          scale: 0.4,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
