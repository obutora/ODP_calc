import 'package:isar/isar.dart';

part 'med_master.g.dart';

@collection
class MedMaster {
  Id? id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? name;

  String? unit;
  String? yjCode;

  MedMaster({
    int? id,
    required this.name,
    required this.unit,
    required this.yjCode,
  });

  @override
  String toString() {
    return 'MedMaster{id: $id, name: $name, unit: $unit, yjCode: $yjCode\n';
  }

  factory MedMaster.fromJson(Map<String, dynamic> json) => MedMaster(
        name: json['name'],
        unit: json['unit'],
        yjCode: json['yjCode'],
      );
}
