import 'package:flutter/material.dart';

import '../const.dart';
import '../widget/button/search_button.dart';
import '../widget/checkbox/search_checkbox_group.dart';
import '../widget/text/description_list.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: kGreen,
        title: const Text(
          '検索画面',
          style: kTextTitle,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Text('検索', style: kTextTitle),

            const SearchCheckBoxGroup(),

            const SizedBox(height: 12),

            const SearchButton(),
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
            const SizedBox(height: 16),

            const SizedBox(height: 28),

            Expanded(
                child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
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
                      Placeholder(fallbackHeight: 299),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('患者編集', style: kTextH3),
                      Text(
                        '現在の集薬状況のまとめ',
                        style: kTextDescription,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Placeholder(fallbackHeight: 299),
                    ],
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  flex: 1,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const [
                      Text('薬編集', style: kTextH3),
                      Text(
                        '現在の集薬状況のまとめ',
                        style: kTextDescription,
                      ),
                      SizedBox(
                        height: 12,
                      ),
                      Placeholder(fallbackHeight: 299),
                    ],
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
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
