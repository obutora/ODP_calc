import 'package:flutter/material.dart';

import '../../const.dart';

class DescriptionList extends StatelessWidget {
  const DescriptionList({
    super.key,
    required this.descriptionList,
  });

  final List<String> descriptionList;

  @override
  Widget build(BuildContext context) {
    final descpripionList = descriptionList
        .map((e) => Text(
              '・$e',
              style: kTextDescription,
            ))
        .toList();

    return Padding(
      padding: const EdgeInsets.only(left: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: descpripionList,
      ),
    );
  }
}
