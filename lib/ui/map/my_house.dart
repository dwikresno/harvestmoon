import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harvestmoon/controller/player_controller.dart';
import 'package:harvestmoon/controller/season_controller.dart';
import 'package:harvestmoon/ui/player.dart';

class MyHouse extends StatefulWidget {
  const MyHouse({super.key});

  @override
  State<MyHouse> createState() => _MyHouseState();
}

class _MyHouseState extends State<MyHouse> {
  PlayerController playerController = Get.put(PlayerController());
  SeasonController seasonController = Get.put(SeasonController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: playerController.mapX,
            top: playerController.mapY,
            child: Container(
              child: Image.asset(
                "assets/map/house/my-house.png",
                scale: 0.4,
                fit: BoxFit.cover,
              ),
            ),
          ),
          // Container(
          //   width: 20,
          //   height: 20,
          //   color: Colors.amber,
          // ),//this is to make us know where center of stack is
          Player(
            isStopRun: playerController.isStopRun,
            isStopWhistle: playerController.isStopWhistle,
            playerX: playerController.playerX,
            playerY: playerController.playerY,
            action: playerController.action,
            indicatorCharacter: playerController.indicatorCharacter,
            direction: playerController.direction,
          ),
        ],
      ),
    );
  }
}
