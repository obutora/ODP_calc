import 'package:isar/isar.dart';

import '../const.dart';
import '../entity/med_collection.dart';
import '../interface/isar_repository_interface.dart';
import 'isar.dart';

class MedCollectionRepository
    implements IsarRepositoryInterface<MedCollection> {
  @override
  Future<List<MedCollection>> getAll() async {
    final medCollections = IsarRepository.isar.medCollections;
    final getAll = await medCollections.where().findAll();

    log.v('get all medCollections length : ${getAll.length}');
    return getAll;
  }

  @override
  Future<MedCollection?> getById(int id) async {
    final medCollections = IsarRepository.isar.medCollections;
    final getById = await medCollections.where().idEqualTo(id).findFirst();

    log.v('getById : $getById');
    return getById;
  }

  @override
  Future<int> put(MedCollection medCollection) async {
    final medCollections = IsarRepository.isar.medCollections;

    final id = await IsarRepository.isar.writeTxn(() async {
      return await medCollections.put(medCollection);
    });
    log.v('put : $medCollection');

    return id;
  }

  @override
  Future deleteById(int id) async {
    final medCollections = IsarRepository.isar.medCollections;

    await IsarRepository.isar.writeTxn(() async {
      return await medCollections.delete(id);
    });

    log.v('delete : $id');
  }

  @override
  Future<bool> isExistById(int id) async {
    final medCollections = IsarRepository.isar.medCollections;
    final isExist = await medCollections.where().idEqualTo(id).isNotEmpty();

    log.v('isExist : $isExist');
    return isExist;
  }
}
