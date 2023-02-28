import 'package:isar/isar.dart';

part 'med_master.g.dart';

@collection
class MedMaster {
  Id? id = Isar.autoIncrement;

  @Index(unique: true, replace: true)
  String? name;

  String? unit;
  List<int>? gs1CodeList;
  bool isUsed;

  MedMaster({
    int? id,
    required this.name,
    required this.unit,
    required this.gs1CodeList,
    this.isUsed = false,
  });

  @override
  String toString() {
    return 'MedMaster{id: $id, name: $name, unit: $unit, gs1CodeList: $gs1CodeList, isUsed: $isUsed\n';
  }

  factory MedMaster.fromJson(Map<String, dynamic> json) => MedMaster(
        name: json['name'],
        unit: json['unit'],
        gs1CodeList: json['gs1CodeList'].cast<int>() as List<int>?,
        isUsed: json['isUsed'],
      );
}
