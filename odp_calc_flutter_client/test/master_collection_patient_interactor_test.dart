import 'package:flutter_test/flutter_test.dart';
import 'package:odp_calc_flutter_client/entity/med_collection.dart';
import 'package:odp_calc_flutter_client/entity/med_master.dart';
import 'package:odp_calc_flutter_client/entity/patient.dart';
import 'package:odp_calc_flutter_client/entity/picked_med_collection/picked_med_collection.dart';
import 'package:odp_calc_flutter_client/interactor/repository_interactor/all_repository_interactor.dart';
import 'package:odp_calc_flutter_client/repository/isar.dart';
import 'package:odp_calc_flutter_client/repository/med_collection_repository.dart';
import 'package:odp_calc_flutter_client/repository/med_master_repository.dart';
import 'package:odp_calc_flutter_client/repository/patient_repository.dart';
import 'package:odp_calc_flutter_client/usecase/picked_med_collection_usecase.dart';

Future main() async {
  // test用のDBをダウンロード
  // await Isar.initializeIsarCore(download: true);

  await IsarRepository.init();

  final patientRepo = PatientRepository();
  final medMasterRepo = MedMasterRepository();
  final medCollectionRepo = MedCollectionRepository();

  // テスト環境と本番環境は異なる
  // テスト環境のDBを初期化する為の処理
  await patientRepo.deleteAll();
  await medMasterRepo.deleteAll();
  await medCollectionRepo.deleteAll();

  group("all repository interactor", () {
    // DBの読み書きなしで、PickedMedCollectionを作成するためのテスト
    test("create: PickedMedCollection", () async {
      final patient = Patient(
          id: 1,
          name: 'patient',
          katakana: 'カタカナ',
          patientId: 12,
          updateAt: DateTime.now());

      final master = MedMaster(name: 'アムロジピン', unit: '錠', gs1CodeList: [1234]);

      final collection = MedCollection(
          patientId: 12, medMasterId: 23, amount: 100, isCollected: false);

      final pickedByName = PickedMedCollection.create(
          searchName: 'search',
          patient: patient,
          collection: collection,
          master: master);

      expect(pickedByName.medName, 'アムロジピン');
      expect(pickedByName.amount, 100);
    });

    test("薬の名称から、それを含む患者リストとそれぞれの薬の集薬量をPickedMedCollectionのリストで取得", () async {
      final repo = MasterCollectionPatientInteractor();

      // patientを作成してput
      final patient = Patient(
          name: 'patient',
          katakana: 'カタカナ',
          patientId: 12,
          updateAt: DateTime.now());
      final int patientId = await patientRepo.put(patient);

      // masterを作成してput
      final master = MedMaster(name: 'アムロジピン', unit: '錠', gs1CodeList: [1234]);
      final int medMasterId = await medMasterRepo.put(master);

      // collectionを作成してput
      final collection = MedCollection(
          patientId: patientId,
          medMasterId: medMasterId,
          amount: 100,
          isCollected: false);
      await medCollectionRepo.put(collection);

      // patient - master - collection の連結テーブルを表現する PickedMedCollection をリストで取得
      final pickedList = await repo.getPickedMedCollectionByMedName('アムロジピン');
      expect(pickedList.isNotEmpty, true);
      final picked = pickedList.first!;

      expect(picked.patientName, 'patient');
      expect(picked.medName, 'アムロジピン');
      expect(picked.amount, 100);

      // isCollectedで分割できるか確認
      final splitted = PickedMedCollectionUsecase.splitByIsCollected(
          pickedList.cast<PickedMedCollection>());

      expect(splitted['collected']!.isEmpty, true);
      expect(splitted['notCollected']!.isNotEmpty, true);

      await patientRepo.deleteByName('patient');
      await medMasterRepo.deleteAllByName('アムロジピン');
      await medCollectionRepo.deleteByPatientId(12);
    });

    test("GS-1から、それを含む患者リストとそれぞれの薬の集薬量をPickedMedCollectionのリストで取得", () async {
      final repo = MasterCollectionPatientInteractor();

      // patientを作成してput
      final patient = Patient(
          name: 'patient',
          katakana: 'カタカナ',
          patientId: 12,
          updateAt: DateTime.now());
      final int patientId = await patientRepo.put(patient);

      // masterを作成してput
      final master = MedMaster(name: 'アムロジピン', unit: '錠', gs1CodeList: [1234]);
      final int medMasterId = await medMasterRepo.put(master);

      // collectionを作成してput
      final collection = MedCollection(
          patientId: patientId,
          medMasterId: medMasterId,
          amount: 100,
          isCollected: false);
      await medCollectionRepo.put(collection);

      // patient - master - collection の連結テーブルを表現する PickedMedCollection をリストで取得
      // gs-1コードをKeyにして検索する
      final pickedList = await repo.getPickedMedCollectionByGs1(1234);

      expect(pickedList.isNotEmpty, true);
      final picked = pickedList.first!;

      expect(picked.patientName, 'patient');
      expect(picked.medName, 'アムロジピン');
      expect(picked.amount, 100);

      // isCollectedで分割できるか確認
      final splitted = PickedMedCollectionUsecase.splitByIsCollected(
          pickedList.cast<PickedMedCollection>());

      expect(splitted['collected']!.isEmpty, true);
      expect(splitted['notCollected']!.isNotEmpty, true);

      await patientRepo.deleteByName('patient');
      await medMasterRepo.deleteAllByName('アムロジピン');
      await medCollectionRepo.deleteByPatientId(12);
    });
  });
}
