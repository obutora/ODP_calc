import 'package:flutter_test/flutter_test.dart';
import 'package:odp_calc_flutter_client/entity/med_collection.dart';
import 'package:odp_calc_flutter_client/repository/isar.dart';
import 'package:odp_calc_flutter_client/repository/med_collection_repository.dart';

Future main() async {
  await IsarRepository.init();
  group("med_collection_CRUD", () {
    final medCollection = MedCollection(
      id: 123456,
      patientId: 1,
      medMasterId: 2,
      amount: 100,
      isCollected: false,
    );
    test("put: med_collection", () async {
      await MedCollectionRepository.put(medCollection);
      final getted = await MedCollectionRepository.getById(medCollection.id!);

      // 存在確認
      final isExist =
          await MedCollectionRepository.isExistById(medCollection.id!);
      expect(isExist, true);

      // idチェック
      expect(medCollection.id, getted!.id);
    });

    test("update: med_collection", () async {
      medCollection.amount = 200;
      await MedCollectionRepository.put(medCollection);
      final getted = await MedCollectionRepository.getById(medCollection.id!);

      // idチェック
      expect(medCollection.id, getted!.id);

      // amountチェック
      expect(getted.amount, 200);
    });

    test("delete: med_collection", () async {
      bool isExist =
          await MedCollectionRepository.isExistById(medCollection.id!);
      expect(isExist, true);

      await MedCollectionRepository.deleteById(medCollection.id!);

      // 存在確認
      isExist = await MedCollectionRepository.isExistById(medCollection.id!);
      expect(isExist, false);
    });
  });
}
