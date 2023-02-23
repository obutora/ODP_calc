import 'package:isar/isar.dart';
import 'package:odp_calc_flutter_client/entity/enum/exists.dart';

import '../const.dart';
import '../entity/patient.dart';
import '../interface/isar_repository_interface.dart';
import 'isar.dart';

class PatientRepository implements IsarRepositoryInterface<Patient> {
  final patients = IsarRepository.isar.patients;

  @override
  Future<List<Patient?>> getAll() async {
    final getAll = await patients.where().findAll();

    log.v('get all patients length : ${getAll.length}');
    return getAll;
  }

  @override
  Future<Patient?> getById(int id) async {
    final getById = await patients.where().idEqualTo(id).findFirst();

    log.v('getById : $getById');
    return getById;
  }

  @override
  Future<int> put(Patient patient) async {
    final id = IsarRepository.isar.writeTxn(() async {
      return await patients.put(patient);
    });
    log.v('put : $patient');

    return id;
  }

  Future putAll(List<Patient> patients) async {
    final isarPatients = IsarRepository.isar.patients;

    final ids = await IsarRepository.isar.writeTxn(() async {
      return await isarPatients.putAll(patients);
    });
    log.v('putAll : $patients');

    return ids;
  }

  @override
  Future deleteById(int id) async {
    final deleteId = await IsarRepository.isar.writeTxn(() async {
      return await patients.delete(id);
    });

    log.v('delete : $id');
    return deleteId;
  }

  /// DANGER:テスト用：全削除
  Future deleteAll() async {
    final deleteAll = await IsarRepository.isar.writeTxn(() async {
      return await patients.clear();
    });

    return deleteAll;
  }

  @override
  Future<bool> isExistById(int id) async {
    final isExist = await patients.where().idEqualTo(id).isNotEmpty();

    log.v('isExist : $isExist');
    return isExist;
  }

  Future<Exists> existsByKana(String kana) async {
    final count = await patients.filter().katakanaContains(kana).count();

    log.v('exist kana count : $count');

    if (count == 0) {
      return Exists.empty;
    } else if (count == 1) {
      return Exists.single;
    } else {
      return Exists.multiple;
    }
  }

  Future<int> count() async {
    final count = await patients.where().count();
    return count;
  }

  Future<List<Patient?>> getByKana(String kana) async {
    final getByKana = await patients.filter().katakanaContains(kana).findAll();

    log.v('getByKana : $getByKana');
    return getByKana;
  }

  Future deleteByName(String name) async {
    final deleteByName = await IsarRepository.isar.writeTxn(() async {
      return await patients.filter().nameEqualTo(name).deleteAll();
    });

    log.v('deleteByName : $deleteByName');
    return deleteByName;
  }
}
