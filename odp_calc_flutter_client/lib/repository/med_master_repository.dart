import 'package:isar/isar.dart';

import '../const.dart';
import '../entity/med_master.dart';
import '../interface/isar_repository_interface.dart';
import 'isar.dart';

class MedMasterRepository implements IsarRepositoryInterface<MedMaster> {
  final medMasters = IsarRepository.isar.medMasters;

  @override
  Future<List<MedMaster>> getAll() async {
    final getAll = await medMasters.where().findAll();

    log.v('get all medMasters length : ${getAll.length}');
    return getAll;
  }

  @override
  Future<MedMaster?> getById(int id) async {
    final getById = await medMasters.where().idEqualTo(id).findFirst();

    log.v('getById : $getById');
    return getById;
  }

  @override
  Future<int> put(MedMaster medMaster) async {
    final id = await IsarRepository.isar.writeTxn(() async {
      return await medMasters.put(medMaster);
    });
    log.v('put : $medMaster');

    return id;
  }

  @override
  Future deleteById(int id) async {
    await IsarRepository.isar.writeTxn(() async {
      return await medMasters.delete(id);
    });

    log.v('delete : $id');
  }

  @override
  Future<bool> isExistById(int id) async {
    final isExist = await medMasters.where().idEqualTo(id).isNotEmpty();

    log.v('isExist : $isExist');
    return isExist;
  }

  Future<List<MedMaster>> getByName(String name) async {
    final getByName = await medMasters.filter().nameEqualTo(name).findAll();

    log.v('getByName : $getByName');
    return getByName;
  }
}
