import 'package:flutter/material.dart';
import 'package:home_page/address.dart';
// import 'package:home_page/home.dart';
import 'package:home_page/login.dart';

import 'musicplayer.dart';
// import 'package:home_page/musicplayer.dart';

// import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      // home: Scaffold(
      //   body: PageView(controller: controller, children: [
      //     // Home(),
      //     MusicPlayer(control: controller),

      //     Login(
      //       control: controller,
      //     ),
      //     AddressTab(control: controller)
      //   ]),
      // )
      home: Login(),
    );
  }
}
