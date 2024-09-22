import 'package:flutter/material.dart';
import 'package:portfolio_in_flutter/pages/home_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: "Portfolio",
        themeMode: ThemeMode.system,
        theme: ThemeData(),
        darkTheme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        home: const HomeScreen());
  }
}
