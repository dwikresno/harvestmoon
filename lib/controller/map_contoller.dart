import 'dart:convert';
import 'dart:math';

import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:harvestmoon/model/map/TypeMapModel.dart';
import 'package:harvestmoon/model/map/TypeWildThing.dart';
import 'package:harvestmoon/model/map/WildThingModel.dart';

class MapController extends GetxController {
  String currentMap = TypeMapModel.intro;
  bool isIntroDone = false;
  double mapScale = 0.4;
  //[x1,y1,x2,y2]
  //x1 -> max right
  //y1 -> max bottom
  //x2 -> max left
  //y2 -> max top
  List<double> maxMapMyHouse = [-591, -166, -6, -1];
  List<WildThingModel> listWildThing = [];
  List areaX = [];
  List areaY = [];
  double minXFarm = 690;
  double minYFarm = 450;
  int indicatorWildThing = 1;

  setCurrentMap(String newMap) {
    currentMap = newMap;
  }

  setIntroStatus(bool status) {
    isIntroDone = status;
  }

  clearAreaFarm() {
    areaX.clear();
    areaY.clear();
    minXFarm = 690;
    minYFarm = 450;
  }

  setAreaFarm() {
    for (int i = 0; i < 5; i++) {
      areaX.add(minXFarm);
      areaY.add(minYFarm);
      minXFarm = minXFarm + 60;
      minYFarm = minYFarm + 60;
    }
  }

  clearSpawWildThing() {
    listWildThing.clear();
  }

  spawnWildThing() {
    double tempX = areaX.elementAt(Random().nextInt(areaX.length));
    double tempY = areaY.elementAt(Random().nextInt(areaY.length));
    print("area X random : ${tempX}");
    print("area Y random : ${tempY}");
    List type = [
      TypeWildThingModel.wood,
      TypeWildThingModel.weeds,
      TypeWildThingModel.stone,
    ];
    String randomType = type.elementAt(Random().nextInt(type.length));
    var jsonTemp = {
      "x": tempX,
      "y": tempY,
      "type": randomType,
      "indicator": 1,
    };
    if (listWildThing
            .where((element) =>
                element.x == jsonTemp['x'] && element.y == jsonTemp['y'])
            .length ==
        0) {
      listWildThing.add(WildThingModel.fromJson(jsonTemp));
    }
    print("area spawns : ${jsonEncode(listWildThing)}");
  }
}
