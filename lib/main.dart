import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:sprint_3/song_ans_page.dart';
import 'package:sprint_3/song_ans_page2.dart';
import 'package:sprint_3/song_ans_page3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialRoute: '/1',
      getPages: [
        GetPage(name: '/1', page: () => const SongAns()),
        GetPage(
            name: '/2',
            page: () => const SongAns2(),
            transition: Transition.noTransition),
        GetPage(
            name: '/3',
            page: () => const SongAns3(),
            transition: Transition.noTransition),
      ],
      debugShowCheckedModeBanner: false,
      // home: SongAns(),
    );
  }
}
