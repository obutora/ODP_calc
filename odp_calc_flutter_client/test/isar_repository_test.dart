import 'package:flutter_test/flutter_test.dart';
import 'package:odp_calc_flutter_client/entity/med_collection.dart';
import 'package:odp_calc_flutter_client/entity/patient.dart';
import 'package:odp_calc_flutter_client/repository/isar.dart';
import 'package:odp_calc_flutter_client/repository/med_collection_repository.dart';
import 'package:odp_calc_flutter_client/repository/patient_repository.dart';

Future main() async {
  await IsarRepository.init();

  // MedCollection ------------------------------------------------------------
  group("med_collection_CRUD", () {
    final medCollection = MedCollection(
      id: 123456,
      patientId: 1,
      medMasterId: 2,
      amount: 100,
      isCollected: false,
    );

    final repo = MedCollectionRepository();
    test("put: med_collection", () async {
      await repo.put(medCollection);
      final getted = await repo.getById(medCollection.id!);

      // 存在確認
      final isExist = await repo.isExistById(medCollection.id!);
      expect(isExist, true);

      // idチェック
      expect(medCollection.id, getted!.id);
    });

    test("update: med_collection", () async {
      medCollection.amount = 200;
      await repo.put(medCollection);
      final getted = await repo.getById(medCollection.id!);

      // idチェック
      expect(medCollection.id, getted!.id);

      // amountチェック
      expect(getted.amount, 200);
    });

    test("delete: med_collection", () async {
      bool isExist = await repo.isExistById(medCollection.id!);
      expect(isExist, true);

      await repo.deleteById(medCollection.id!);

      // 存在確認
      isExist = await repo.isExistById(medCollection.id!);
      expect(isExist, false);
    });
  });

  // Patient ------------------------------------------------------------------
  group("Patient: CRUD", () {
    final patient = Patient(
      id: 23456,
      patientId: 34567,
      name: "test",
      katakana: "テスト",
      updateAt: DateTime.now(),
    );

    final repo = PatientRepository();

    test("put: Patient", () async {
      await repo.put(patient);

      final getted = await repo.getById(patient.id!);
      final isExist = await repo.isExistById(patient.id!);

      // 存在確認
      expect(isExist, true);

      // idチェック
      expect(patient.id, getted!.id);
    });

    test("update: Patient", () async {
      patient.name = "update";
      await repo.put(patient);

      final getted = await repo.getById(patient.id!);

      // idチェック
      expect(patient.id, getted!.id);
      // nameチェック
      expect(getted.name, "update");
    });

    test("delete: Patient", () async {
      bool isExist = await repo.isExistById(patient.id!);
      expect(isExist, true);

      await repo.deleteById(patient.id!);

      // 存在確認
      isExist = await repo.isExistById(patient.id!);
      expect(isExist, false);
    });
  });
}
