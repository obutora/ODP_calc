import 'package:isar/isar.dart';

import '../const.dart';
import '../entity/patient.dart';
import '../interface/isar_repository_interface.dart';
import 'isar.dart';

class PatientRepository implements IsarRepositoryInterface<Patient> {
  @override
  Future<List<Patient?>> getAll() async {
    final patients = IsarRepository.isar.patients;
    final getAll = await patients.where().findAll();

    log.v('get all patients length : ${getAll.length}');
    return getAll;
  }

  @override
  Future<Patient?> getById(int id) async {
    final patients = IsarRepository.isar.patients;
    final getById = await patients.where().idEqualTo(id).findFirst();

    log.v('getById : $getById');
    return getById;
  }

  @override
  Future<int> put(Patient patient) async {
    final patients = IsarRepository.isar.patients;

    final id = IsarRepository.isar.writeTxn(() async {
      return await patients.put(patient);
    });
    log.v('put : $patient');

    return id;
  }

  @override
  Future deleteById(int id) async {
    final patients = IsarRepository.isar.patients;

    final deleteId = await IsarRepository.isar.writeTxn(() async {
      return await patients.delete(id);
    });

    log.v('delete : $id');
    return deleteId;
  }

  @override
  Future<bool> isExistById(int id) async {
    final patients = IsarRepository.isar.patients;
    final isExist = await patients.where().idEqualTo(id).isNotEmpty();

    log.v('isExist : $isExist');
    return isExist;
  }
}
