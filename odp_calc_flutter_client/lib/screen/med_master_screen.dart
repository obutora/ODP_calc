import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../const.dart';
import '../provider/form/input/search_med_master_input_state_provider.dart';
import '../provider/medmaster/search_med_master_provider.dart';
import '../widget/card/med_master_card.dart';
import '../widget/frame/main_frame.dart';
import '../widget/text_field/search_input_field.dart';

class MedMasterScreen extends ConsumerWidget {
  const MedMasterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // final searchWord = ref.watch(searchMedMasterInputStateProvider);
    final searchedMedMaster = ref.watch(searhMedMasterProvider);

    return MainFrame(
      title: '薬マスタ編集',
      titleDescription: '薬マスタを編集します。',
      children: [
        const Text('マスタ検索', style: kTextTitle),
        const SizedBox(
          height: 8,
        ),
        SearchInputField(
            onPressed: () {},
            onChanged: (e) {
              // StateProvider に入力された文字列を入れる
              ref.read(searchMedMasterInputStateProvider.notifier).state = e;
            },
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
          child: searchedMedMaster.when(
            data: (medMasterList) {
              return Padding(
                padding: const EdgeInsets.all(12.0),
                child: GridView.builder(
                  itemCount: medMasterList.length,
                  physics: const ScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 8,
                    childAspectRatio: 4,
                  ),
                  itemBuilder: (context, index) {
                    final master = medMasterList[index];
                    return MedMasterCard(
                      // TODO: NEED TO CHANGE - Handle data
                      name: master!.name!,
                      onPressed: () {},
                    );
                  },
                ),
              );
            },
            error: (err, stack) => Container(
              color: kGreen,
              child: Center(
                child: Text(
                  err.toString(),
                  style: kTextSearchBox,
                ),
              ),
            ),
            loading: () => const CircularProgressIndicator(),
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
