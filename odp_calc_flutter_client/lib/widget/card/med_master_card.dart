import 'package:fluentui_system_icons/fluentui_system_icons.dart';
import 'package:flutter/material.dart';

import '../../const.dart';

class MedMasterCard extends StatelessWidget {
  const MedMasterCard({
    super.key,
    required this.name,
    required this.onPressed,
  });

  final String name;
  final Function() onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kWhite,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Wrap(
                children: [
                  Text(
                    name,
                    style: kTextDescription.copyWith(color: kBlack),
                    overflow: TextOverflow.visible,
                  ),
                ],
              ),
            ),
            IconButton(
                onPressed: onPressed,
                icon: const Icon(
                  FluentIcons.document_edit_16_regular,
                  color: kOrange,
                  size: 28,
                ))
          ],
        ),
      ),
    );
  }
}
