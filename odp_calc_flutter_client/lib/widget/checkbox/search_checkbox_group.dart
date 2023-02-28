import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../const.dart';
import '../../provider/form/checkbox/search_checkbox_provider.dart';

class SearchCheckBoxGroup extends ConsumerWidget {
  const SearchCheckBoxGroup({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchCheckBox = ref.watch(searchCheckBoxProvider);

    return Row(children: [
      Row(
        children: [
          SearchCheckBox(
            isSelected: searchCheckBox == SearchCheckBoxState.patientName
                ? true
                : false,
            onChanged: () {
              ref.read(searchCheckBoxProvider.notifier).state =
                  SearchCheckBoxState.patientName;
            },
          ),
          const SizedBox(width: 8),
          const Text(
            '患者名で検索',
            style: kTextSearchBox,
          ),
        ],
      ),
      const SizedBox(width: 28),
      Row(
        children: [
          // Checkbox(
          //     value: searchCheckBox == SearchCheckBox.medName ? true : false,
          //     onChanged: (_) {
          //       ref.read(searchCheckBoxProvider.notifier).state =
          //           SearchCheckBox.medName;
          //     }),
          SearchCheckBox(
            isSelected:
                searchCheckBox == SearchCheckBoxState.medName ? true : false,
            onChanged: () {
              ref.read(searchCheckBoxProvider.notifier).state =
                  SearchCheckBoxState.medName;
            },
          ),
          const SizedBox(width: 8),
          const Text(
            '薬名で検索',
            style: kTextSearchBox,
          ),
        ],
      ),
    ]);
  }
}

class SearchCheckBox extends StatelessWidget {
  const SearchCheckBox({
    super.key,
    required this.onChanged,
    required this.isSelected,
  });

  final Function onChanged;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return Transform.scale(
      scale: 1.4,
      child: Checkbox(
          activeColor: kGreen,
          shape: const CircleBorder(),
          value: isSelected,
          onChanged: (_) {
            onChanged();
          }),
    );
  }
}
