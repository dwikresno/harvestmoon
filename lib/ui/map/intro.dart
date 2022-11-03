// ignore_for_file: unnecessary_brace_in_string_interps, use_key_in_widget_constructors, prefer_const_constructors, avoid_print, sized_box_for_whitespace, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, library_private_types_in_public_api, must_be_immutable

import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:harvestmoon/controller/map_contoller.dart';
import 'package:harvestmoon/ui/dog.dart';
import 'package:harvestmoon/ui/player.dart';

class IntroPage extends StatefulWidget {
  IntroPage({Key? key});

  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage>
    with SingleTickerProviderStateMixin {
  //player
  int indicatorCharacter = 1;
  Timer? timer;
  bool isLast = false;
  double playerX = -60; //290
  double playerY = 20;
  bool isStopRun = false;
  bool isStopWhistle = false;
  String action = "run";
  String direction = "left";

  //dog
  Timer? timerDog;
  int indicatorDog = 1;
  bool isLastDog = false;
  double dogX = -60; //290
  double dogY = 20;
  String actionDog = "run";
  String directionDog = "left";
  bool isDogStopRun = false;

  //title board
  double boardX = 100; //290
  double boardY = -230;

  //horse
  double horseX = 50; //290
  double horseY = 155;
  int indicatorHorse = 1;
  Timer? timerHorse;

  //finger animation
  Animation<double>? offsetAnimation;
  bool visibilityStart = false;
  AnimationController? animationController;

  //controller
  MapController mapController = Get.put(MapController());

  @override
  void initState() {
    mapController.setIntroStatus(false);
    animationController = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    )..repeat(reverse: true);
    offsetAnimation = Tween(begin: 0.0, end: 8.0)
        .chain(CurveTween(curve: Curves.linear))
        .animate(animationController!);
    run();
    horse();
    super.initState();
  }

  reset() {
    setState(() {
      //reset character
      indicatorCharacter = 1;
      isLast = false;
      playerX = -60; //290
      playerY = 20;
      isStopRun = false;
      action = "run";
      direction = "left";
      isStopWhistle = false;

      //reset dog
      indicatorDog = 1;
      isLastDog = false;
      dogX = -60; //290
      dogY = 20;
      actionDog = "run";
      directionDog = "left";
      isDogStopRun = false;

      //title board
      boardX = 100; //290
      boardY = -230;

      //visibility start
      visibilityStart = false;
    });
    run();
  }

  horse() {
    timerHorse = Timer.periodic(Duration(milliseconds: 300), (timer) {
      if (indicatorHorse > 1) {
        setState(() {
          indicatorHorse--;
        });
      } else {
        setState(() {
          indicatorHorse++;
        });
      }
    });
  }

  joy() {
    setState(() {
      isStopWhistle = true;
      isStopRun = true;
      action = "joy";
      indicatorCharacter = 1;
    });
    Timer.periodic(Duration(milliseconds: 300), (timer) {
      if (indicatorCharacter > 1) {
        setState(() {
          indicatorCharacter--;
        });
      } else {
        setState(() {
          indicatorCharacter++;
        });
      }
      if (timer.tick == 6) {
        setState(() {
          boardY = 10;
        });
      }

      if (timer.tick == 12) {
        setState(() {
          indicatorCharacter = 1;
        });
        timer.cancel();
        mapController.setIntroStatus(true);
      }
    });
  }

  whistle() {
    setState(() {
      action = "walk";
      direction = "down";
      indicatorCharacter = 2;
    });
    Future.delayed(const Duration(milliseconds: 200), () {
      setState(() {
        action = "whistle";
        direction = "right";
        indicatorCharacter = 4;
      });
      Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          indicatorCharacter = 1;
        });
        Timer.periodic(Duration(milliseconds: 200), (timer) {
          if (indicatorCharacter == 4) {
            setState(() {
              timer.cancel();
            });
            runDog();
          } else {
            setState(() {
              indicatorCharacter++;
            });
          }
        });
      });
    });
  }

  run() {
    setState(() {
      action = "run";
    });
    timer = Timer.periodic(Duration(milliseconds: 200), (timer) {
      if (isStopRun) {
        timer.cancel();
        Future.delayed(const Duration(milliseconds: 200), () {
          whistle();
        });
      } else {
        if (isLast) {
          setState(() {
            indicatorCharacter--;
          });
        } else {
          setState(() {
            indicatorCharacter++;
          });
        }

        if (indicatorCharacter == 3) {
          setState(() {
            isLast = true;
          });
        }

        if (indicatorCharacter == 1) {
          setState(() {
            isLast = false;
          });
        }

        if (playerX + 20 < 290) {
          setState(() {
            playerX += 20;
          });
        } else {
          setState(() {
            playerX = 290;
            indicatorCharacter = 2;
            isStopRun = true;
          });
        }
      }
      print("is last: ${isLast}");
      print("player x: ${playerX}");
      print("Indicator Character : ${indicatorCharacter}");
    });
  }

  runDog() {
    setState(() {
      actionDog = "run";
    });
    timerDog = Timer.periodic(Duration(milliseconds: 200), (timer) {
      if (isDogStopRun) {
        timer.cancel();
        Future.delayed(const Duration(milliseconds: 200), () {
          barking();
        });
      } else {
        if (isLastDog) {
          setState(() {
            indicatorDog--;
          });
        } else {
          setState(() {
            indicatorDog++;
          });
        }

        if (indicatorDog == 3) {
          setState(() {
            isLastDog = true;
          });
        }

        if (indicatorDog == 1) {
          setState(() {
            isLastDog = false;
          });
        }

        if (dogX + 20 < 250) {
          setState(() {
            dogX += 20;
          });
        } else {
          Future.delayed(const Duration(milliseconds: 200), () {
            setState(() {
              isStopWhistle = false;
              isStopRun = false;
              action = "walk";
              direction = "down";
              indicatorCharacter = 2;
            });
            joy();
          });
          setState(() {
            dogX = 250;
            isDogStopRun = true;
            actionDog = "bark";
            indicatorDog = 1;
          });
        }
      }
      print("is last Dog: ${isLastDog}");
      print("Dog x: ${dogX}");
      print("Indicator Dog : ${indicatorDog}");
    });
  }

  barking() {
    Timer.periodic(Duration(milliseconds: 300), (timer) {
      if (indicatorDog > 1) {
        setState(() {
          indicatorDog--;
        });
      } else {
        setState(() {
          indicatorDog++;
        });
      }
      if (timer.tick == 12) {
        setState(() {
          indicatorDog = 1;
        });
        timer.cancel();
      }
    });
  }

  @override
  void dispose() {
    timer!.cancel();
    timerDog!.cancel();
    timerHorse!.cancel();
    animationController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Container(
      child: Stack(
        children: [
          Container(
            width: height * 1.50, //this maybe not same for every device
            height: height,
            child: Image.asset(
              "assets/background-opening.png",
              fit: BoxFit.contain,
            ),
          ),
          Player(
            isStopRun: isStopRun,
            isStopWhistle: isStopWhistle,
            playerX: playerX,
            playerY: playerY,
            action: action,
            indicatorCharacter: indicatorCharacter,
            direction: direction,
          ),
          Dog(
            isDogStopRun: isDogStopRun,
            dogX: dogX,
            dogY: dogY,
            actionDog: actionDog,
            directionDog: directionDog,
            indicatorDog: indicatorDog,
          ),
          Positioned(
            left: horseX,
            top: horseY,
            child: Container(
              child: Image.asset(
                "assets/horse-${indicatorHorse}.png",
                scale: 0.4,
                fit: BoxFit.contain,
              ),
            ),
          ),
          AnimatedPositioned(
            duration: const Duration(seconds: 1),
            curve: Curves.linear,
            right: boardX,
            top: boardY,
            child: Image.asset(
              "assets/title-board.png",
              scale: 0.42,
              fit: BoxFit.contain,
            ),
            onEnd: () {
              setState(() {
                visibilityStart = !visibilityStart;
              });
            },
          ),
          Visibility(
            visible: visibilityStart,
            child: AnimatedBuilder(
              animation: offsetAnimation!,
              builder: (buildContext, child) {
                return Positioned(
                  right: 380 + offsetAnimation!.value,
                  bottom: 100,
                  child: Image.asset(
                    "assets/finger.png",
                    scale: 0.42,
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
          Visibility(
            visible: visibilityStart,
            child: AnimatedPositioned(
              duration: const Duration(seconds: 1),
              curve: Curves.linear,
              right: 240,
              bottom: 100,
              child: Image.asset(
                "assets/start.png",
                scale: 0.42,
                fit: BoxFit.contain,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
