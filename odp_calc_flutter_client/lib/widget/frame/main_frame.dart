import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../const.dart';
import '../button/back_screen_button.dart';

class MainFrame extends StatelessWidget {
  const MainFrame({
    super.key,
    required this.title,
    required this.titleDescription,
    required this.children,
  });

  final String title;
  final String titleDescription;
  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    final path = GoRouterState.of(context).path;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: kGreen,
        automaticallyImplyLeading: false, // 先頭に表示される戻るボタンを廃止

        title: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Text(
              title,
              style: kTextTitle,
            ),
            const SizedBox(width: 8),
            Padding(
              padding: const EdgeInsets.only(bottom: 8.0),
              child: Text(
                titleDescription,
                style: kTextDescription,
              ),
            )
          ],
        ),
        actions: path != '/' ? [const BackScreenButton()] : [],
      ),
      backgroundColor: kWhite,
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: children,
        ),
      ),
    );
  }
}
