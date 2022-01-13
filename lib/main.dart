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
        appBarTheme:  AppBarTheme(elevation: 1, color: Colors.orange.shade300),
        primarySwatch: Colors.orange,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: const HomePage(title: 'ESIG'),
    );
  }
}