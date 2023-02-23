import 'package:odp_calc_flutter_client/entity/med_collection.dart';

import '../../entity/enum/exists.dart';
import '../../repository/med_collection_repository.dart';
import '../../repository/patient_repository.dart';

class PatientMedCollectionInteractor {
  final patientRepo = PatientRepository();
  final collectionRepo = MedCollectionRepository();

  Future<List<MedCollection>> getCollectionByKana(String kana) async {
    // 1.患者名（カナ）の重複チェック
    // 重複ありの場合はエラー
    // 重複なしの場合は患者名（カナ）をもとに患者IDを特定
    // 患者IDから集薬リストを抽出

    final existsKana = await patientRepo.existsByKana(kana);
    print(existsKana);

    if (existsKana == Exists.multiple) {
      throw Exception('患者名（カナ）が重複しています');
    } else if (existsKana == Exists.empty) {
      throw Exception('患者名（カナ）が存在しません');
    } else {
      //重複なしの場合

      final patients = await patientRepo.getByKana(kana);
      print(patients);
      final int patientId = patients[0]!.id!;

      final medCollections = await collectionRepo.getByPatientId(patientId);
      return medCollections;
    }
  }
}
