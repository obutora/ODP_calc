import '../entity/med_master.dart';

class MedMasterUsecase {
  static createListFromJson(json) {
    List<MedMaster> medMasters = [];

    for (var element in json) {
      medMasters.add(MedMaster.fromJson(element));
    }

    return medMasters;
  }
}
