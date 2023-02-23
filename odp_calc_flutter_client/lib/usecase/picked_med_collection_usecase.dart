import 'package:odp_calc_flutter_client/entity/med_collection.dart';

import '../interface/picked_med_collection.dart';

class PickedMedCollectionUsecase {
  static Map<String, List<PickedMedCollection>> splitByIsCollected(
      List<PickedMedCollection> list) {
    return {
      "collected": list.where((element) => element.isCollected).toList(),
      "notCollected": list.where((element) => !element.isCollected).toList()
    };
  }
}
