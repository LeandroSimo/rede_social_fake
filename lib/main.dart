import 'package:flutter/material.dart';
import 'base/screens/home.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ESIG',
      theme: ThemeData(
        appBarTheme: const AppBarTheme(elevation: 1, color: Colors.redAccent),
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(title: 'ESIG'),
    );
  }
}