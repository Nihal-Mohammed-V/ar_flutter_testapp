import 'package:ar_flutter/screens/home_screen.dart';
import 'package:ar_flutter/utils/colors.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AR App',
      theme: ThemeData(
        scaffoldBackgroundColor: AColors.secondary,
        appBarTheme: AppBarTheme(
          backgroundColor: AColors.primaryVariant,
        ),
      ),
      home: MyHomePage(),
    );
  }
}
