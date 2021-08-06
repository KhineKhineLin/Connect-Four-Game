import 'package:connect_four/core/bindings/main_bindings.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'screens/game_screen/game_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      initialBinding: MainBindings(),
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity
      ),
      initialRoute: '/',
      getPages: [
        GetPage(name: '/', page: ()=>GameScreen())
      ],
    );
  }
}

