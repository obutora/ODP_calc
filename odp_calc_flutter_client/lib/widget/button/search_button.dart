import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class SearchButton extends StatelessWidget {
  const SearchButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 570,
          child: TextField(
              cursorColor: kGreen,
              style: kTextSearchBox,
              decoration: InputDecoration(
                focusColor: kGreen,
                hintText: '患者名を入力してください',
                hintStyle: kTextSearchBox.copyWith(
                    color: kGreen, fontWeight: FontWeight.w400),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kGreen, width: 1.5),
                  borderRadius: BorderRadius.circular(8),
                ),
                fillColor: kGreen,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: kGreen, width: 3),
                  borderRadius: BorderRadius.circular(8),
                ),
              )),
        ),
        const SizedBox(width: 8),
        SizedBox(
          height: 60,
          child: ElevatedButton.icon(
            onPressed: () {},
            style: ElevatedButton.styleFrom(
              foregroundColor: kWhite,
              backgroundColor: kGreen,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            icon: const Icon(FluentIcons.search_48_regular, size: 28),
            label: Text(
              '検索',
              style: kTextSearchBox.copyWith(color: kWhite),
            ),
          ),
        ),
      ],
    );
  }
}
