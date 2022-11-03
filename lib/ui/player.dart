// ignore_for_file: use_key_in_widget_constructors, must_be_immutable

import 'package:flutter/material.dart';

class Player extends StatelessWidget {
  bool isStopRun;
  bool isStopWhistle;
  double playerX;
  double playerY;
  String action;
  int indicatorCharacter;
  String direction;
  Player({
    required this.isStopRun,
    required this.isStopWhistle,
    required this.playerX,
    required this.playerY,
    required this.action,
    required this.indicatorCharacter,
    required this.direction,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      right: playerX,
      bottom: playerY,
      child: Image.asset(
        isStopRun && isStopWhistle
            ? "assets/$action-$indicatorCharacter.png"
            : "assets/$action-$direction-$indicatorCharacter.png",
        scale: 0.4,
        fit: BoxFit.contain,
      ),
    );
  }
}
