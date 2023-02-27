import 'package:flutter/material.dart';

import '../const.dart';
import '../widget/frame/main_frame.dart';

class MedMasterScreen extends StatelessWidget {
  const MedMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const MainFrame(
      title: '薬マスタ編集',
      titleDescription: '薬マスタを編集します。',
      children: [
        Text('マスタ検索', style: kTextH3),
        Text(
          '薬マスタを編集します。',
          style: kTextDescription,
        ),
        SizedBox(
          height: 12,
        ),
      ],
    );
  }
}
