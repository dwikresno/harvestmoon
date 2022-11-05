import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:harvestmoon/model/map/TypeMapModel.dart';

class MapController extends GetxController {
  String currentMap = TypeMapModel.intro;
  bool isIntroDone = false;
  //[x1,y1,x2,y2]
  //x1 -> max right
  //y1 -> max bottom
  //x2 -> max left
  //y2 -> max top
  List<double> maxMapMyHouse = [-591, -166, -6, -1];

  setCurrentMap(String newMap) {
    currentMap = newMap;
  }

  setIntroStatus(bool status) {
    isIntroDone = status;
  }
}
