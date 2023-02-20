import 'package:flutter/material.dart';

import '../const.dart';
import '../entity/med_collection.dart';
import '../repository/med_collection_repository.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () async {
              // final Patient patient = Patient(
              //   patientId: 1,
              //   name: '山田太郎',
              //   katakana: 'ヤマダタロウ',
              //   updateAt: DateTime.now(),
              // );

              // await PatientRepository.put(patient);

              final medCollection = MedCollection(
                patientId: 1,
                medMasterId: 2,
                amount: 100,
                isCollected: false,
              );

              final repo = MedCollectionRepository();

              final id = await repo.put(medCollection);
              print(id);
            },
            child: const Text('put test'),
          ),
          ElevatedButton(
            onPressed: () async {
              // final List<Patient?> patients = await PatientRepository.getAll();
              // log.v('patients : $patients');

              final repo = MedCollectionRepository();

              final List<MedCollection?> medCollections = await repo.getAll();

              log.v('medCollections : $medCollections');
            },
            child: const Text('get test'),
          ),
        ],
      ),
    );
  }
}
