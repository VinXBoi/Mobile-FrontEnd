<<<<<<< HEAD
import 'package:activity_tracker/DashBoard/kanban.dart';
import 'package:activity_tracker/HomePage/home.dart';
import 'package:activity_tracker/homepagebaru.dart';
=======
import 'package:activity_tracker/HomePage/home.dart';
>>>>>>> parent of 51df570 (Kanban Design)
import 'package:activity_tracker/LoginPage/login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Activity Tracker',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
<<<<<<< HEAD
      home: const HomePage2(),
=======
      home: const LoginPage(),
>>>>>>> parent of 51df570 (Kanban Design)
      // const LoginPage(),
    );
  }
}
