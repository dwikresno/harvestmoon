import 'dart:async';

import 'package:get/get.dart';
import 'package:harvestmoon/controller/map_contoller.dart';
import 'package:harvestmoon/model/map/TypeMapModel.dart';
import 'package:harvestmoon/model/player/ActionPlayer.dart';
import 'package:harvestmoon/model/player/DirectionPlayerModel.dart';

class PlayerController extends GetxController {
  bool isStopRun = false;
  bool isStopWhistle = true;
  double playerXCenter = 270;
  double playerYCenter = 170;
  double playerX = 270;
  double playerY = 170;
  String action = ActionPlayer.walk;
  String direction = DirectionPlayerModel.down;
  int indicatorCharacter = 2;
  double mapX = -277;
  double mapY = -80;
  bool isLast = false;
  MapController mapController = Get.put(MapController());
  int longStep = 15; // change this if wanna move long distance

  move({action = ActionPlayer.walk, required directionParam}) {
    switch (directionParam) {
      case DirectionPlayerModel.up:
        direction = DirectionPlayerModel.up;
        if (playerY != playerYCenter) {
          print("diff ${playerY - playerYCenter}");
          if ((playerY - playerYCenter).abs() <= 5) {
            playerY = playerYCenter;
          } else {
            playerY += longStep;
          }
        } else {
          if (mapY == (currentMaxMap()[3])) {
            playerY += longStep;
          } else {
            mapY += longStep;
          }
        }
        break;
      case DirectionPlayerModel.down:
        direction = DirectionPlayerModel.down;
        if (playerY != playerYCenter) {
          if ((playerY - playerYCenter).abs() <= 5) {
            playerY = playerYCenter;
          } else {
            playerY -= longStep;
          }
        } else {
          if (mapY == (currentMaxMap()[1])) {
            playerY -= longStep;
          } else {
            mapY -= longStep;
          }
        }
        break;
      case DirectionPlayerModel.left:
        direction = DirectionPlayerModel.left;
        if (playerX != playerXCenter) {
          if ((playerX - playerXCenter).abs() <= 5) {
            playerX = playerXCenter;
          } else {
            if (mapX == (currentMaxMap()[2])) {
              playerX += longStep;
            } else {
              mapX += longStep;
              if (playerX > playerXCenter) {
                playerX -= longStep;
              } else {
                playerX += longStep;
              }
            }
          }
        } else {
          if (mapX == (currentMaxMap()[2])) {
            playerX += longStep;
          } else {
            mapX += longStep;
          }
        }
        break;
      case DirectionPlayerModel.right:
        direction = DirectionPlayerModel.right;
        if (playerX != playerXCenter) {
          if ((playerX - playerXCenter).abs() <= 5) {
            playerX = playerXCenter;
          } else {
            if (mapX == (currentMaxMap()[0])) {
              playerX -= longStep;
            } else {
              mapX -= longStep;
              if (playerX > playerXCenter) {
                playerX -= longStep;
              } else {
                playerX += longStep;
              }
            }
          }
        } else {
          if (mapX == (currentMaxMap()[0])) {
            playerX -= longStep;
          } else {
            mapX -= longStep;
          }
        }

        break;
      default:
        print("other");
        break;
    }

    print("player X : $playerX");
    print("player Y : $playerY");
    print("Map X : $mapX");
    print("Map Y : $mapY");
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
    changeMap(mapX, mapY);
  }

  bool isStopMap() {
    return (mapX - mapController.maxMapMyHouse[0]) <= 5;
  }

  changeMap(mapXTemp, mapYTemp) {
    //make sure this position match like on the UI
    if ((mapX == -277 && mapY == -65) &&
        (playerX == playerXCenter && playerY == playerYCenter)) {
      mapController.setCurrentMap(TypeMapModel.myHouse);
      mapX = currentMaxMap()[0];
      mapY = currentMaxMap()[1];
      playerX = 390;
      playerY = 10;
    } else if ((mapX <= -456 && mapX >= -591.0) &&
        (mapY == -166) &&
        (playerX >= 270.0 && playerX <= 390.0) &&
        (playerY <= -5.0 && playerY >= -10.0)) {
      mapController.setCurrentMap(TypeMapModel.myFarm);
      mapX = -277;
      mapY = -65;
      playerX = playerXCenter;
      playerY = playerYCenter;
    }
  }

  List currentMaxMap() {
    List listTemp = [];
    print("current Map ${mapController.currentMap}");
    switch (mapController.currentMap) {
      case TypeMapModel.myHouse:
        listTemp.add(mapController.maxMapMyHouse[0]);
        listTemp.add(mapController.maxMapMyHouse[1]);
        listTemp.add(mapController.maxMapMyHouse[2]);
        listTemp.add(mapController.maxMapMyHouse[3]);
        break;
      default:
        listTemp.add(0);
        listTemp.add(0);
        listTemp.add(0);
        listTemp.add(0);
        break;
    }
    return listTemp;
  }

  stop() {
    indicatorCharacter =
        2; //default start number for every direction,stand up position
  }
}
