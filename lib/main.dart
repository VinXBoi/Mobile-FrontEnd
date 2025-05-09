import 'package:activity_tracker/DashBoard/DashBoard.dart';
import 'package:activity_tracker/LoginPage/login.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MyApp(),
      )
  );
}

class UserProvider extends ChangeNotifier {
  List<User> listUser = [User(username: 'admin', password: 'admin')];

  void addUser(String username, String password) {
    listUser.add(User(username: username, password: password));
    notifyListeners();
  }
}

class User {
  String username, password;

  User({required this.username, required this.password});
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
      home: LoginPage(),
    );
  }
}
