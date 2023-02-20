import 'package:isar/isar.dart';

import '../const.dart';
import '../entity/med_master.dart';
import '../interface/isar_repository_interface.dart';
import 'isar.dart';

class MedMasterRepository implements IsarRepositoryInterface<MedMaster> {
  @override
  Future<List<MedMaster>> getAll() async {
    final medMasters = IsarRepository.isar.medMasters;
    final getAll = await medMasters.where().findAll();

    log.v('get all medMasters length : ${getAll.length}');
    return getAll;
  }

  @override
  Future<MedMaster?> getById(int id) async {
    final medMasters = IsarRepository.isar.medMasters;
    final getById = await medMasters.where().idEqualTo(id).findFirst();

    log.v('getById : $getById');
    return getById;
  }

  @override
  Future<int> put(MedMaster medMaster) async {
    final medMasters = IsarRepository.isar.medMasters;

    final id = await IsarRepository.isar.writeTxn(() async {
      return await medMasters.put(medMaster);
    });
    log.v('put : $medMaster');

    return id;
  }

  @override
  Future deleteById(int id) async {
    final medMasters = IsarRepository.isar.medMasters;

    await IsarRepository.isar.writeTxn(() async {
      return await medMasters.delete(id);
    });

    log.v('delete : $id');
  }

  @override
  Future<bool> isExistById(int id) async {
    final medMasters = IsarRepository.isar.medMasters;
    final isExist = await medMasters.where().idEqualTo(id).isNotEmpty();

    log.v('isExist : $isExist');
    return isExist;
  }
}
