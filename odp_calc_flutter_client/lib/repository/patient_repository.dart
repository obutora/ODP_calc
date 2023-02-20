import 'package:isar/isar.dart';

import '../const.dart';
import '../entity/patient.dart';
import 'isar.dart';

class PatientRepository {
  static Future<List<Patient?>> getAll() async {
    final patients = IsarRepository.isar.patients;
    final getAll = await patients.where().findAll();

    log.v('get all patients length : ${getAll.length}');
    return getAll;
  }

  static Future put(Patient patient) async {
    final patients = IsarRepository.isar.patients;

    IsarRepository.isar.writeTxn(() async => {await patients.put(patient)});
    log.v('put : $patient');
  }

  static Future delete(int id) async {
    final patients = IsarRepository.isar.patients;

    IsarRepository.isar.writeTxn(() async => {await patients.delete(id)});
    log.v('delete : $id');
  }
}
