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
  Map<String, Map<DashboardProvider,List<TaskProvider>>> userDashboard = {
    'admin' :  {
      DashboardProvider(title: 'Class Notes', icon: Icons.edit) : [
        TaskProvider(title: 'Default Task 1'),
        TaskProvider(title: 'Default Task 2'),
      ] 
    }
  };
  void addUser(String username, String password) {
    listUser.add(User(username: username, password: password));
    userDashboard[username] = {};
    notifyListeners();
  }

  void addDashboard(String username, DashboardProvider dashboard) {
    userDashboard[username]![dashboard] = [];
    notifyListeners();
  }

  void addTask(String username, DashboardProvider dashboard, TaskProvider task) {
    userDashboard[username]![dashboard]!.add(task);
    notifyListeners();
  }
}

class User {
  String username, password;
  User({required this.username, required this.password});
}

class DashboardProvider {
  String title; 
  dynamic icon;
  DashboardProvider({required this.title, required this.icon});
}

class TaskProvider {
  String title;
  TaskProvider({required this.title});  
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
