import 'package:isar/isar.dart';

part 'med_collection.g.dart';

@collection
class MedCollection {
  Id? id = Isar.autoIncrement;
  int? patientId;
  int? medMasterId;
  int? amount;
  bool? isCollected;

  MedCollection({
    int? id,
    required this.patientId,
    required this.medMasterId,
    required this.amount,
    required this.isCollected,
  });

  @override
  String toString() {
    return 'MedCollection{id: $id, patientId: $patientId, medMasterId: $medMasterId, amount: $amount, isCollected: $isCollected}';
  }
}
