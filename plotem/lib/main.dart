import 'package:flutter/material.dart';
import 'package:plotem/ui/pages/all_pages.dart';
import 'package:plotem/ui/pages/login_page.dart';
import 'package:plotem/ui/pages/manager/all_manager.dart';

import 'utils/const.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final empy = "";
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Plotem',
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => AllPage(),
        '/homemanager': (context) => AllManager(),
        '/login': (context) => LoginPage(),
      },
      home: empy.isEmpty ? LoginPage() : AllPage(),
      theme: ThemeData(
        unselectedWidgetColor: frontColor,
        checkboxTheme: CheckboxThemeData(
          fillColor: MaterialStateProperty.all(Colors.grey.withOpacity(.2)),
          checkColor: MaterialStateProperty.all(myprimarColor),
        ),
      ),
    );
  }
}
