import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:harvestmoon/model/map/TypeMapModel.dart';

class MapController extends GetxController {
  String currentMap = TypeMapModel.intro;
  bool isIntroDone = false;

  setCurrentMap(String newMap) {
    currentMap = newMap;
  }

  setIntroStatus(bool status) {
    isIntroDone = status;
  }
}
