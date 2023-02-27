import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../const.dart';
import '../widget/frame/main_frame.dart';
import '../widget/text_field/search_input_field.dart';

class MedMasterScreen extends StatelessWidget {
  const MedMasterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MainFrame(
      title: '薬マスタ編集',
      titleDescription: '薬マスタを編集します。',
      children: [
        const Text('マスタ検索', style: kTextTitle),
        // const Text(
        //   'GS-1コード、または薬名を入力して検索します。（部分検索）',
        //   style: kTextDescription,
        // ),
        const SizedBox(
          height: 8,
        ),
        SearchInputField(
            onPressed: () {},
            onChanged: (e) {},
            hintText: 'GS-1コード、または医薬品名を入力してください。'),
        const SizedBox(
          height: 20,
        ),
        Container(
          decoration: BoxDecoration(
            color: kGreen,
            borderRadius: BorderRadius.circular(12),
          ),
          height: 380,
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: FutureBuilder(
              builder: (context, snapshot) {
                return GridView.builder(
                  itemCount: 20,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 12,
                    childAspectRatio: 4,
                  ),
                  itemBuilder: (context, index) {
                    return Container(
                      color: kWhite,
                      child: Text(index.toString()),
                    );
                  },
                );
              },
            ),
          ),
        ),

        const SizedBox(
          height: 20,
        ),
        SizedBox(
            width: double.infinity,
            height: 60,
            child: ElevatedButton.icon(
                icon: const Icon(FluentIcons.add_circle_32_regular, size: 28),
                style: ElevatedButton.styleFrom(
                  foregroundColor: kWhite,
                  backgroundColor: kBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {},
                label: Text('マスタを追加する',
                    style: kTextSearchBox.copyWith(color: kWhite))))
      ],
    );
  }
}
