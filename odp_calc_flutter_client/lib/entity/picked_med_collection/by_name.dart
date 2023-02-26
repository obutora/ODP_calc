import '../../interface/picked_med_collection.dart';
import '../med_collection.dart';
import '../med_master.dart';
import '../patient.dart';

class PickedMedCollectionByName extends PickedMedCollection {
  final String searchName;

  PickedMedCollectionByName({
    required this.searchName,
    required super.patientId,
    required super.patientName,
    required super.medMasterId,
    required super.medName,
    required super.amount,
    required super.isCollected,
  });

  factory PickedMedCollectionByName.create({
    required String searchName,
    required Patient patient,
    required MedCollection collection,
    required MedMaster master,
  }) {
    return PickedMedCollectionByName(
      searchName: searchName,
      patientId: patient.id!,
      patientName: patient.name!,
      medMasterId: master.id!,
      medName: master.name!,
      amount: collection.amount!,
      isCollected: collection.isCollected!,
    );
  }
}
