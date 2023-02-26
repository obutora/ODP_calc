import 'package:flutter_test/flutter_test.dart';
import 'package:isar/isar.dart';
import 'package:odp_calc_flutter_client/entity/med_collection.dart';
import 'package:odp_calc_flutter_client/entity/patient.dart';
import 'package:odp_calc_flutter_client/interactor/repository_interactor/patient_collection_interactor.dart';
import 'package:odp_calc_flutter_client/repository/isar.dart';
import 'package:odp_calc_flutter_client/repository/med_collection_repository.dart';
import 'package:odp_calc_flutter_client/repository/patient_repository.dart';

Future main() async {
  // test用のDBをダウンロード
  await Isar.initializeIsarCore(download: true);
  await IsarRepository.init();

  // Patient <-> MedCollection Interactor

  group("Patient <-> MedCollection", () {
    final interactor = PatientMedCollectionInteractor();

    final collectionRepo = MedCollectionRepository();
    final patientRepo = PatientRepository();

    test("getCollectionByKana: カナ名が存在しない場合", () async {
      await patientRepo.deleteByName("test");

      late bool isSuccess;
      try {
        await interactor.getCollectionByKana("テスト");
      } catch (e) {
        isSuccess = false;
      }
      expect(isSuccess, false);
    });

    test("getCollectionByKana: 正常にコレクションを取得できた場合", () async {
      await patientRepo.deleteByName("test");

      final patient = Patient(
        patientId: 34567, // CAUTION:このIDは使用しない
        name: "test",
        katakana: "テスト",
        updateAt: DateTime.now(),
      );

      final int patientId = await patientRepo.put(patient);

      final medCollection = MedCollection(
        patientId: patientId,
        medMasterId: 2,
        amount: 100,
        isCollected: false,
      );

      await collectionRepo.put(medCollection);

      final collection = await interactor.getCollectionByKana("テスト");
      final isCollect = collection.every((item) => item.patientId == patientId);
      expect(isCollect, true);

      await collectionRepo.deleteByPatientId(patientId);
      await patientRepo.deleteByName(patient.name!);
    });

    test("getCollectionByKana : カナ名が複数存在する場合", () async {
      await patientRepo.deleteByName("test");

      final patient = Patient(
        patientId: 34567, // CAUTION:このIDは使用しない
        name: "test",
        katakana: "テスト",
        updateAt: DateTime.now(),
      );

      await patientRepo.putAll([
        patient,
        patient,
        patient,
      ]);

      expect(await patientRepo.count(), 3);

      late bool isSuccess;
      try {
        await interactor.getCollectionByKana("テスト");

        // ↑でエラーが発生しなければ失敗
        expect(true, false);
      } catch (e) {
        // print(e.toString());
        isSuccess = false;
        expect(isSuccess, false);
      }

      await collectionRepo.deleteByPatientId(34567);
    });
  });
}
