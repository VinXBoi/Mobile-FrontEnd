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

  Map<String, Map<DashboardProvider,Map<String, List<TaskProvider>>>> userDashboard = {
    'admin' :  {
      DashboardProvider(title: 'IF-B CLASS', icon: Icons.edit) : {
        'Not Started' : [TaskProvider(title: 'Task 1'),],
        'In Progress' : [TaskProvider(title: 'Task 2'),],
        'Completed' : [TaskProvider(title: 'Task 3'),],
      }
    }
  };

  void addUser(String username, String password) {
    listUser.add(User(username: username, password: password));
    userDashboard[username] = {};
    notifyListeners();
  }

  void addDashboard(String username, DashboardProvider dashboard) {
    userDashboard[username] ??= {};
    userDashboard[username]![dashboard] = {
      'Not Started': [],
      'In Progress': [],
      'Completed': [],
    };
    notifyListeners();
  }

  void removeDashboard(String username, DashboardProvider dashboard) {
    userDashboard[username]?.remove(dashboard);
    notifyListeners();
  }

  void editDashboard(String username, DashboardProvider oldDashboard, DashboardProvider newDashboard) {
    final dashboards = userDashboard[username];
    if (dashboards != null && dashboards.containsKey(oldDashboard)) {
      final taskMap = dashboards[oldDashboard];
      dashboards.remove(oldDashboard);
      dashboards[newDashboard] = taskMap ?? {
        'Not Started': [],
        'In Progress': [],
        'Completed': [],
      };
      notifyListeners();
    }
  }

  void addTask(String username, DashboardProvider dashboard, String status, TaskProvider task) {
    userDashboard[username]?[dashboard]?[status]?.add(task);
    notifyListeners();
  }

  void editStatusTask(String username, DashboardProvider dashboard, TaskProvider task, String fromStatus, String toStatus) {
    if (userDashboard[username]?[dashboard]?[fromStatus]?.remove(task) ?? false) {
      userDashboard[username]?[dashboard]?[toStatus]?.add(task);
      notifyListeners();
    }
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

class ClassProvider {
  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
