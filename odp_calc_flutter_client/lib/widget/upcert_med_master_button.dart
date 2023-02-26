import 'dart:convert';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import '../const.dart';
import '../repository/med_master_repository.dart';
import '../usecase/med_master_usecase.dart';

class InitMedMaster extends StatefulWidget {
  const InitMedMaster({
    super.key,
  });

  @override
  State<InitMedMaster> createState() => _InitMedMasterState();
}

class _InitMedMasterState extends State<InitMedMaster> {
  Widget textWidget = const Text('init MedMaster');

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () async {
          final pick = await FilePicker.platform.pickFiles();

          if (pick != null) {
            setState(() {
              textWidget = const Padding(
                padding: EdgeInsets.all(8.0),
                child: CircularProgressIndicator(
                  color: kWhite,
                ),
              );
            });

            final path = pick.files.single.path;
            final file = File(path!);

            // final fileString = await rootBundle.lo;
            final fileString = await file.readAsString();
            final json = jsonDecode(fileString);

            final medMasterList = MedMasterUsecase.createListFromJson(json);

            final repo = MedMasterRepository();
            await repo.upsert(medMasterList);
          }

          setState(() {
            textWidget = const Text('upcert MedMaster');
          });
        },
        child: textWidget);
  }
}
