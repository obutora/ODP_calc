import 'package:isar/isar.dart';

part 'patient.g.dart';

@collection
class Patient {
  Id? id = Isar.autoIncrement;
  int? patientId;
  String? name;
  String? katakana;
  DateTime? updateAt;

  Patient({
    int? id,
    required this.patientId,
    required this.name,
    required this.katakana,
    required this.updateAt,
  });

  @override
  String toString() {
    return 'Patient{id: $id, patientId: $patientId, name: $name, katakana: $katakana}, updateAt: $updateAt';
  }
}
