import 'package:isar/isar.dart';

part 'med_master.g.dart';

@collection
class MedMaster {
  Id? id = Isar.autoIncrement;
  String? name;
  String? unit;

  MedMaster({
    int? id,
    required this.name,
    required this.unit,
  });

  @override
  String toString() {
    return 'MedMaster{id: $id, name: $name, unit: $unit}';
  }
}
