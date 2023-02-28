import '../../const.dart';
import '../../entity/enum/exists.dart';
import '../../entity/picked_med_collection/picked_med_collection.dart';
import '../../repository/med_collection_repository.dart';
import '../../repository/med_master_repository.dart';
import '../../repository/patient_repository.dart';

class AllRepositoryInteractor {
  final medMasterRepo = MedMasterRepository();
  final medCollectionRepo = MedCollectionRepository();
  final patientRepo = PatientRepository();

  Future<List<PickedMedCollection?>> getPickedMedCollectionByMedName(
      String medName) async {
    // 1.薬品名の重複チェック
    // 重複ありの場合はエラー
    final existsName = await medMasterRepo.existsByName(medName);

    if (existsName == Exists.empty) {
      throw Exception('薬品名が存在しません');
    } else if (existsName == Exists.multiple) {
      throw Exception('薬品名が重複しています');
    } else {
      //重複なしの場合
      final medMasters = await medMasterRepo.getByName(medName);
      final medMasterId = medMasters.first!.id!;

      log.v('medMasterId: $medMasterId');

      final medCollections =
          await medCollectionRepo.getByMedMasterId(medMasterId);

      log.v('medCollections: $medCollections');

      final pickedMedCollectionList = <PickedMedCollection?>[];

      for (var medCollection in medCollections) {
        final patient = await patientRepo.getById(medCollection.patientId!);
        final master = await medMasterRepo.getById(medCollection.medMasterId!);

        final pickedMedCollection = PickedMedCollection.create(
            searchName: medName,
            patient: patient!,
            collection: medCollection,
            master: master!);

        pickedMedCollectionList.add(pickedMedCollection);
      }

      return pickedMedCollectionList;
    }
  }
}
