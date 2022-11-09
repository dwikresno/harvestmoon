import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harvestmoon/controller/map_contoller.dart';
import 'package:harvestmoon/controller/player_controller.dart';
import 'package:harvestmoon/controller/season_controller.dart';
import 'package:harvestmoon/ui/player.dart';

class MyFarm extends StatefulWidget {
  const MyFarm({super.key});

  @override
  State<MyFarm> createState() => _MyFarmState();
}

class _MyFarmState extends State<MyFarm> {
  PlayerController playerController = Get.put(PlayerController());
  SeasonController seasonController = Get.put(SeasonController());
  MapController mapController = Get.put(MapController());

  @override
  void initState() {
    mapController.setAreaFarm();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            left: playerController.mapX,
            top: playerController.mapY,
            child: Stack(
              children: [
                Container(
                  // width: double.infinity,
                  // height: double.infinity,
                  child: Image.asset(
                    "assets/map/my-farm/my-farm-${seasonController.currentSeason}.png",
                    scale: mapController.mapScale,
                    fit: BoxFit.cover,
                  ),
                ),
                for (var wildList in mapController.listWildThing)
                  //   MovieWidget(model: MovieModel.fromJson(movie)),
                  Positioned(
                    left: wildList.x,
                    top: wildList.y,
                    child: Container(
                      child: Image.asset(
                        "assets/map/my-farm/wild/${wildList.type}-1.png",
                        scale: mapController.mapScale,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                // Positioned(
                //   left: 1170,
                //   top: 450,
                //   child: Container(
                //     child: Image.asset(
                //       "assets/map/my-farm/wild/stone-1.png",
                //       scale: mapController.mapScale,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                // Positioned(
                //   left: 1170,
                //   top: 750,
                //   child: Container(
                //     child: Image.asset(
                //       "assets/map/my-farm/wild/weeds-1.png",
                //       scale: mapController.mapScale,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
                // Positioned(
                //   left: 690,
                //   top: 750,
                //   child: Container(
                //     child: Image.asset(
                //       "assets/map/my-farm/wild/weeds-1.png",
                //       scale: mapController.mapScale,
                //       fit: BoxFit.cover,
                //     ),
                //   ),
                // ),
              ],
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
