import 'package:isar/isar.dart';

import '../const.dart';
import '../entity/med_collection.dart';
import '../entity/med_master.dart';
import '../entity/patient.dart';

class IsarRepository {
  static late Isar isar;

  static Future<void> init() async {
    isar = await Isar.open(
      [PatientSchema, MedMasterSchema, MedCollectionSchema],
    );

    log.i('IsarRepository init');
  }
}
