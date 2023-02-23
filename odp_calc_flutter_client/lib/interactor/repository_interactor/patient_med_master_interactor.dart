import '../../repository/med_master_repository.dart';
import '../../repository/patient_repository.dart';

class PatientMedMasterInteractor {
  final masterRepo = MedMasterRepository();
  final patientRepo = PatientRepository();

  Future getCollectionByKana(String kana) async {}
}
