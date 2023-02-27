import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../const.dart';
import '../style/search_input_decoration.dart';

class SearchInputField extends StatelessWidget {
  const SearchInputField({
    super.key,
    required this.onPressed,
    required this.onChanged,
    required this.hintText,
  });

  final Function() onPressed;
  final Function(String) onChanged;
  final String hintText;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 570,
          child: TextField(
            cursorColor: kGreen,
            style: kTextSearchBox,
            decoration: searchInputDecoration(
              hintText: hintText,
            ),
            onChanged: onChanged,
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          height: 60,
          child: ElevatedButton.icon(
            onPressed: onPressed,
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
