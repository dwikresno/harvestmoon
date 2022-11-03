import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harvestmoon/controller/player_controller.dart';
import 'package:harvestmoon/ui/player.dart';

class MyFarm extends StatefulWidget {
  const MyFarm({super.key});

  @override
  State<MyFarm> createState() => _MyFarmState();
}

class _MyFarmState extends State<MyFarm> {
  PlayerController playerController = Get.put(PlayerController());
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: playerController.mapY,
            left: playerController.mapX,
            child: Container(
              child: Image.asset(
                "assets/map/my-farm/my-farm-summer.png",
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
