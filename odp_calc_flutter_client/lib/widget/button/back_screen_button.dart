import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class BackScreenButton extends StatelessWidget {
  const BackScreenButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 24, top: 8, bottom: 8),
      child: ElevatedButton.icon(
          icon: const Icon(FluentIcons.arrow_hook_up_left_28_filled, size: 32),
          style: ElevatedButton.styleFrom(
            foregroundColor: kGreen,
            backgroundColor: kWhite,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
          onPressed: () => Navigator.pop(context), // NOTE:もどる
          label: Text('もどる', style: kTextSearchBox.copyWith(color: kGreen))),
    );
  }
}
