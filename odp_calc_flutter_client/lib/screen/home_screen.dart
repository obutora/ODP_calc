import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

import '../const.dart';
import '../widget/checkbox/search_checkbox_group.dart';
import '../widget/frame/main_frame.dart';
import '../widget/text/description_list.dart';
import '../widget/text_field/search_input_field.dart';
import '../widget/upcert_med_master_button.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainFrame(
      title: 'ホーム',
      titleDescription: '集薬データを検索したり、マスタを編集できます。',
      children: [
        const SearchCheckBoxGroup(),
        const SizedBox(height: 12),
        SearchInputField(
          hintText: '患者名を入力してください',
          onChanged: (value) {
            // print(value);
          },
          onPressed: () {
            // print('tap search button');
          },
        ),
        const Padding(
          padding: EdgeInsets.only(top: 8),
          child: DescriptionList(
            descriptionList: [
              '患者バーコードを読むと、集薬登録や処方払い出し登録が行えます。',
              '患者名を直接入れて検索することも可能です。',
              '薬の名称を入れると、その薬を含む患者リストで表示できます。'
            ],
          ),
        ),
        const SizedBox(height: 28),
        Expanded(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // NOTE: 左のグリッド
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text('ステータス', style: kTextH3),
                    Text(
                      '現在の集薬状況のまとめ',
                      style: kTextDescription,
                    ),
                    SizedBox(
                      height: 12,
                    ),
                    Flexible(
                      child: SizedBox(
                        height: 399,
                        child: UpcertMedMasterButton(),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // NOTE: 中央のグリッド
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('患者編集', style: kTextH3),
                    const Text(
                      '患者マスタの確認と編集ができます。',
                      style: kTextDescription,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                        height: 200,
                        child: Center(
                            child:
                                Lottie.asset('assets/animation/patient.json'))),
                    const SizedBox(height: 16),
                    Center(
                      child: SizedBox(
                        width: 280,
                        height: 64,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            // backgroundColor: kGreen,
                            side: const BorderSide(color: kGreen, width: 3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            Navigator.pushNamed(context, '/med_master');
                          },
                          child: Text(
                            '患者マスタ編集',
                            style: kTextH4.copyWith(
                                color: kGreen, letterSpacing: 2),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(width: 12),
              // NOTE: 右のグリッド
              Expanded(
                flex: 1,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('薬編集', style: kTextH3),
                    const Text(
                      '薬マスタの確認と編集ができます。',
                      style: kTextDescription,
                    ),
                    const SizedBox(
                      height: 12,
                    ),
                    SizedBox(
                        height: 200,
                        child: Center(
                            child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Lottie.asset('assets/animation/medicine.json'),
                        ))),
                    const SizedBox(height: 16),
                    Center(
                      child: SizedBox(
                        width: 280,
                        height: 64,
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            // backgroundColor: kGreen,
                            side: const BorderSide(color: kBlue, width: 3),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            context.push('/medMaster');
                          },
                          child: Text(
                            '薬マスタ編集',
                            style: kTextH4.copyWith(
                                color: kBlue, letterSpacing: 2),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}





// class HomeScreen extends StatelessWidget {
//   const HomeScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SingleChildScrollView(
//         child: Column(
//           children: [
//             ElevatedButton(
//               onPressed: () async {
//                 // final Patient patient = Patient(
//                 //   patientId: 1,
//                 //   name: '山田太郎',
//                 //   katakana: 'ヤマダタロウ',
//                 //   updateAt: DateTime.now(),
//                 // );

//                 // await PatientRepository.put(patient);

//                 // final medCollection = MedCollection(
//                 //   patientId: 1,
//                 //   medMasterId: 2,
//                 //   amount: 100,
//                 //   isCollected: false,
//                 // );

//                 // final repo = MedCollectionRepository();

//                 // final id = await repo.put(medCollection);
//                 // print(id);

//                 final medMaster = MedMaster(
//                     name: "アムロジピン", unit: "錠", yjCode: "1124001X1022");
//                 await MedMasterRepository().put(medMaster);
//               },
//               child: const Text('put test'),
//             ),
//             ElevatedButton(
//               onPressed: () async {
//                 // final List<Patient?> patients = await PatientRepository.getAll();
//                 // log.v('patients : $patients');

//                 final repo = MedCollectionRepository();

//                 final List<MedCollection?> medCollections = await repo.getAll();

//                 log.v('medCollections : $medCollections');
//               },
//               child: const Text('get test'),
//             ),
//             const InitMedMaster(),
//             const ShowPdf()
//           ],
//         ),
//       ),
//     );
//   }
// }
