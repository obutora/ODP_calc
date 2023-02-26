import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:window_size/window_size.dart';

import 'repository/isar.dart';
import 'screen/home_screen.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  setWindowTitle('ODP Calc');
  setWindowFrame(const Rect.fromLTWH(0, 0, 1028, 768));
  setWindowMinSize(const Size(1028, 768));

  // final info = await getCurrentScreen();

  //isar
  await IsarRepository.init();

  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ODP calc',
      theme: ThemeData(
        fontFamily: 'NotoSansJP',
        primarySwatch: Colors.blue,
      ),
      home: const HomeScreen(),
    );
  }
}
