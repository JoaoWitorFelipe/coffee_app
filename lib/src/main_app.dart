import 'package:coffee_app/src/pages/home_page.dart';
import 'package:flutter/material.dart';

class MainApp extends StatelessWidget {
  const MainApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: CustomMaterialColor.colors,
        fontFamily: 'Roboto',
      ),
      home: HomePage(),
    );
  }
}

class CustomMaterialColor {
  static final MaterialColor colors = const MaterialColor(
    0xFF613D2B,
    {
      50: Color(0xFFFAF7F3),
      100: Color(0xFF98867D),
      200: Color(0xFFDBB699),
      300: Color(0xFFCFA374),
      400: Color(0xFF907056),
      500: Color(0xFF613D2B),
      600: Color(0xFF170C08),
      700: Color(0xFF000000),
      800: Color(0xFF000000),
      900: Color(0xFF000000)
    },
  );
}
