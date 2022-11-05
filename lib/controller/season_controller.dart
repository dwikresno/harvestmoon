import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:harvestmoon/model/season/SeasonModel.dart';

class SeasonController extends GetxController {
  String currentSeason = SeasonModel.spring;

  setCurrentSeason(String newMap) {
    currentSeason = newMap;
  }
}
