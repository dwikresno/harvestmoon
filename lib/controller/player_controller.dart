import 'dart:async';

import 'package:get/get.dart';
import 'package:harvestmoon/model/player/ActionPlayer.dart';
import 'package:harvestmoon/model/player/DirectionPlayerModel.dart';

class PlayerController extends GetxController {
  bool isStopRun = false;
  bool isStopWhistle = true;
  double playerX = 270;
  double playerY = 170;
  String action = ActionPlayer.walk;
  String direction = DirectionPlayerModel.down;
  int indicatorCharacter = 2;
  double mapX = -277;
  double mapY = -80;
  bool isLast = false;

  move({action = ActionPlayer.walk, required directionParam}) {
    switch (directionParam) {
      case DirectionPlayerModel.up:
        direction = DirectionPlayerModel.up;
        mapY += 15;
        break;
      case DirectionPlayerModel.down:
        direction = DirectionPlayerModel.down;
        mapY -= 15;
        break;
      case DirectionPlayerModel.left:
        direction = DirectionPlayerModel.left;
        mapX += 15;
        break;
      case DirectionPlayerModel.right:
        direction = DirectionPlayerModel.right;
        mapX -= 15;
        break;
      default:
        print("other");
        break;
    }
    if (isLast) {
      indicatorCharacter--;
    } else {
      indicatorCharacter++;
    }
    if (indicatorCharacter >= 3) {
      isLast = true;
    }
    if (indicatorCharacter == 1) {
      isLast = false;
    }
    print(isLast);
  }

  stop() {
    indicatorCharacter = 2; //default start number for every direction
  }
}
