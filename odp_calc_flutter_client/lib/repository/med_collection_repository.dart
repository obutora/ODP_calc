import 'package:isar/isar.dart';

import '../const.dart';
import '../entity/med_collection.dart';
import '../interface/isar_repository_interface.dart';
import 'isar.dart';

class MedCollectionRepository
    implements IsarRepositoryInterface<MedCollection> {
  final medCollections = IsarRepository.isar.medCollections;
  @override
  Future<List<MedCollection>> getAll() async {
    final getAll = await medCollections.where().findAll();

    log.v('get all medCollections length : ${getAll.length}');
    return getAll;
  }

  @override
  Future<MedCollection?> getById(int id) async {
    final getById = await medCollections.where().idEqualTo(id).findFirst();

    log.v('getById : $getById');
    return getById;
  }

  @override
  Future<int> put(MedCollection medCollection) async {
    final id = await IsarRepository.isar.writeTxn(() async {
      return await medCollections.put(medCollection);
    });
    log.v('put : $medCollection');

    return id;
  }

  @override
  Future deleteById(int id) async {
    await IsarRepository.isar.writeTxn(() async {
      return await medCollections.delete(id);
    });

    log.v('delete : $id');
  }

  @override
  Future<bool> isExistById(int id) async {
    final isExist = await medCollections.where().idEqualTo(id).isNotEmpty();

    log.v('isExist : $isExist');
    return isExist;
  }

  Future<List<MedCollection>> getByPatientId(int patientId) async {
    final getByPatientId =
        await medCollections.filter().patientIdEqualTo(patientId).findAll();

    log.v('getByPatientId : $getByPatientId');
    return getByPatientId;
  }

  Future deleteByPatientId(int id) async {
    await IsarRepository.isar.writeTxn(() async {
      return await medCollections.filter().patientIdEqualTo(id).deleteAll();
    });

    log.v('deleteByPatientId : $id');
  }
}
