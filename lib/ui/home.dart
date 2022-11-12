// ignore_for_file: sized_box_for_whitespace, prefer_const_constructors, avoid_unnecessary_containers, unused_field, avoid_print

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harvestmoon/controller/map_contoller.dart';
import 'package:harvestmoon/controller/player_controller.dart';
import 'package:harvestmoon/model/map/TypeMapModel.dart';
import 'package:harvestmoon/model/player/ActionPlayer.dart';
import 'package:harvestmoon/model/player/DirectionPlayerModel.dart';
import 'package:harvestmoon/ui/map/intro.dart';
import 'package:harvestmoon/ui/map/my_farm.dart';
import 'package:harvestmoon/ui/map/my_house.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  //controller
  MapController mapController = Get.put(MapController());
  PlayerController playerController = Get.put(PlayerController());
  double sizeArrow = 28;
  Timer? timeAction;

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      body: SafeArea(
        right: true,
        child: Container(
          child: Row(
            children: [
              Expanded(
                child: Container(
                  margin: EdgeInsets.only(top: 50),
                  height: MediaQuery.of(context).size.height / 2,
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Listener(
                        onPointerDown: (details) {
                          timeAction = Timer.periodic(
                              Duration(milliseconds: 200), (timer) {
                            setState(() {
                              playerController.move(
                                  directionParam: DirectionPlayerModel.left);
                            });
                          });
                        },
                        onPointerUp: (details) {
                          setState(() {
                            playerController.stop();
                            timeAction!.cancel();
                          });
                        },
                        child: Container(
                          child: Icon(
                            Icons.arrow_left,
                            size: sizeArrow,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Listener(
                              onPointerDown: (details) {
                                timeAction = Timer.periodic(
                                    Duration(milliseconds: 200), (timer) {
                                  setState(() {
                                    playerController.move(
                                        directionParam:
                                            DirectionPlayerModel.up);
                                  });
                                });
                              },
                              onPointerUp: (details) {
                                setState(() {
                                  playerController.stop();
                                  timeAction!.cancel();
                                });
                              },
                              child: Container(
                                child: Icon(
                                  Icons.arrow_drop_up,
                                  size: sizeArrow,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: sizeArrow,
                            ),
                            Listener(
                              onPointerDown: (details) {
                                timeAction = Timer.periodic(
                                    Duration(milliseconds: 200), (timer) {
                                  setState(() {
                                    playerController.move(
                                        directionParam:
                                            DirectionPlayerModel.down);
                                  });
                                });
                              },
                              onPointerUp: (details) {
                                setState(() {
                                  playerController.stop();
                                  timeAction!.cancel();
                                });
                              },
                              child: Container(
                                child: Icon(
                                  Icons.arrow_drop_down,
                                  size: sizeArrow,
                                  color: Colors.white,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Listener(
                        onPointerDown: (details) {
                          timeAction = Timer.periodic(
                              Duration(milliseconds: 200), (timer) {
                            setState(() {
                              playerController.move(
                                  directionParam: DirectionPlayerModel.right);
                            });
                          });
                        },
                        onPointerUp: (details) {
                          setState(() {
                            playerController.stop();
                            timeAction!.cancel();
                          });
                        },
                        child: Container(
                          child: Icon(
                            Icons.arrow_right,
                            size: sizeArrow,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              AnimatedSwitcher(
                duration: const Duration(milliseconds: 200),
                child: Container(
                  color: Colors.amber,
                  key: ValueKey<String>(mapController.currentMap),
                  width: height * 1.50, //this maybe not same for every device
                  height: height,
                  child: switchMap(),
                ),
              ),
              Expanded(
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          mapController.clearAreaFarm();
                          print("trace area X: ${mapController.areaX}");
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            // borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              "Clear Area",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          mapController.setAreaFarm();
                          print("trace area X: ${mapController.areaX}");
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            // borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              "Set Area",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            mapController.spawnWildThing();
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            // borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              "Spawn Wild Thing",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            mapController.clearSpawWildThing();
                          });
                        },
                        child: Container(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            // borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              "Clear Wild Thing",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 50,
                      ),
                      GestureDetector(
                        onTap: () {
                          if (mapController.currentMap == TypeMapModel.intro) {
                            if (mapController.isIntroDone) {
                              setState(() {
                                mapController
                                    .setCurrentMap(TypeMapModel.myFarm);
                                print(
                                    "Trace new map ${mapController.currentMap}");
                              });
                            }
                          } else {
                            playerController.checkFront();
                            if (playerController.indexWildThingRemove >= 0) {
                              playerController.indicatorCharacter = 1;
                              Timer.periodic(Duration(milliseconds: 100),
                                  (timer) {
                                setState(() {
                                  playerController.indicatorCharacter += 1;
                                });
                                if (playerController.indicatorCharacter == 5) {
                                  setState(() {
                                    playerController.isStopRun = false;
                                    playerController.action = ActionPlayer.walk;
                                    playerController.indicatorCharacter = 2;
                                    timer.cancel();
                                    Timer.periodic(Duration(milliseconds: 100),
                                        (timer1) {
                                      setState(() {
                                        mapController.listWildThing
                                            .elementAt(playerController
                                                .indexWildThingRemove)
                                            .indicator += 1;
                                      });
                                      if (mapController.listWildThing
                                              .elementAt(playerController
                                                  .indexWildThingRemove)
                                              .indicator ==
                                          3) {
                                        setState(() {
                                          mapController.listWildThing.removeAt(
                                              playerController
                                                  .indexWildThingRemove);
                                          timer1.cancel();
                                        });
                                      }
                                    });
                                  });
                                }
                              });
                            }
                          }
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.blue,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              "B",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            mapController.setCurrentMap(TypeMapModel.intro);
                            print("Trace new map ${mapController.currentMap}");
                          });
                        },
                        child: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.circular(50),
                          ),
                          child: Center(
                            child: Text(
                              "A",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 30,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget switchMap() {
    Widget? result;
    switch (mapController.currentMap) {
      case TypeMapModel.intro:
        result = IntroPage();
        break;
      case TypeMapModel.myFarm:
        result = MyFarm();
        break;
      case TypeMapModel.myHouse:
        result = MyHouse();
        break;
      default:
        result = Container();
        break;
    }
    return result;
  }
}
