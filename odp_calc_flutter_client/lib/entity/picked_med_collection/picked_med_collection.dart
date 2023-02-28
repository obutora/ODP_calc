import '../med_collection.dart';
import '../med_master.dart';
import '../patient.dart';

class PickedMedCollection {
  final int patientId;
  final String patientName;
  final int medMasterId;
  final String medName;
  final int amount;
  final bool isCollected;

  PickedMedCollection({
    required this.patientId,
    required this.patientName,
    required this.medMasterId,
    required this.medName,
    required this.amount,
    required this.isCollected,
  });

  factory PickedMedCollection.create({
    required String searchName,
    required Patient patient,
    required MedCollection collection,
    required MedMaster master,
  }) {
    return PickedMedCollection(
      patientId: patient.id!,
      patientName: patient.name!,
      medMasterId: master.id!,
      medName: master.name!,
      amount: collection.amount!,
      isCollected: collection.isCollected!,
    );
  }
}
