import 'package:isar/isar.dart';

import '../const.dart';
import '../entity/enum/exists.dart';
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

  Future<List<int?>> getAllIds() async {
    return await medMasters.where().idProperty().findAll();
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

  Future putAll(List<MedMaster> medMasters) async {
    await IsarRepository.isar.writeTxn(() async {
      return await this.medMasters.putAll(medMasters);
    });
    log.v('putAll : ${medMasters.length} masters.');
  }

  Future upsert(List<MedMaster> medMasters) async {
    int putCount = 0;
    int throwCount = 0;

    List<MedMaster> needPutMasters = [];

    for (MedMaster master in medMasters) {
      final exist = await existsByName(master.name!, isStrict: true);

      if (exist == Exists.empty) {
        needPutMasters.add(master);
        putCount++;
      } else {
        throwCount++;
      }
    }

    if (needPutMasters.isNotEmpty) {
      await putAll(needPutMasters);
    }

    log.v('upsert : put $putCount, throw $throwCount');
  }

  @override
  Future deleteById(int id) async {
    await IsarRepository.isar.writeTxn(() async {
      return await medMasters.delete(id);
    });

    log.v('delete : $id');
  }

  Future deleteAll() async {
    await IsarRepository.isar.writeTxn(() async {
      return await medMasters.clear();
    });

    log.v('deleteAll');
  }

  @override
  Future<bool> isExistById(int id) async {
    final isExist = await medMasters.where().idEqualTo(id).isNotEmpty();
    return isExist;
  }

  Future<Exists> existsByName(String name, {isStrict = false}) async {
    late int count;

    if (isStrict == true) {
      count = await medMasters.where().nameEqualTo(name).count();
    } else {
      count = await medMasters.filter().nameContains(name).count();
    }

    if (count == 0) {
      return Exists.empty;
    } else if (count == 1) {
      return Exists.single;
    } else {
      return Exists.multiple;
    }
  }

  Future<List<MedMaster?>> getByName(String name) async {
    final getByName =
        await medMasters.filter().nameContains(name).sortByIsUsed().findAll();

    log.v('getByName : $getByName');
    return getByName;
  }

  Future<List<MedMaster?>> getByGs1(int gs1) async {
    final getBtGs1 =
        await medMasters.filter().gs1CodeListElementEqualTo(gs1).findAll();

    log.v('getBtGs1 : $getBtGs1');
    return getBtGs1;
  }

  Future<List<int?>> getIdListByName(String name) async {
    final getById = await medMasters.filter().nameContains(name).findAll();

    log.v('getIdByName : $getById');
    return getById.map((e) => e.id).toList();
  }

  /// [name] を含む薬剤をすべて削除する
  ///
  ///テスト用の関数であり安易に使用すべきでない
  Future deleteAllByName(String name) async {
    await IsarRepository.isar.writeTxn(() async {
      return await medMasters.filter().nameContains(name).deleteAll();
    });

    log.v('deleteAllByName : $name');
  }
}
