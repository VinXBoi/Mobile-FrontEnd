<<<<<<< Updated upstream
import 'package:activity_tracker/LoginPage/login.dart';
=======
import 'package:activity_tracker/HomePage/home.dart';
// import 'package:activity_tracker/LoginPage/login.dart';
>>>>>>> Stashed changes
import 'package:flutter/material.dart';

void main() {
<<<<<<< Updated upstream
  runApp(const MyApp());
=======
  runApp(
    MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => UserProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
      ChangeNotifierProvider(create: (context) => GoalsProvider()),
    ],
    child: const MyApp(),)
  );
}

class ThemeProvider extends ChangeNotifier {
  bool isDarkMode = false;
  ThemeMode currentTheme() {
    return isDarkMode ? ThemeMode.dark : ThemeMode.light;
  }
  void changeMode() {
    isDarkMode = !isDarkMode;
    notifyListeners();
  }
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
  
>>>>>>> Stashed changes
}

class GoalsProvider extends ChangeNotifier {
  Map<String, Map<DashboardProvider, List<String>>> userGoals = {
    'admin': {
      DashboardProvider(title: 'IF-B CLASS', icon: Icons.edit): [
        'Goals 1',
        'Goals 2',
        'Goals 3',
      ]
    }
  };

  List<String> getGoals(String username, DashboardProvider dashboard) {
    return userGoals[username]?[dashboard] ?? [];
  }

  void addGoal(String username, DashboardProvider dashboard, String goal) {
    userGoals[username] ??= {};
    userGoals[username]![dashboard] ??= [];
    userGoals[username]![dashboard]!.add(goal);
    notifyListeners();
  }

  void editGoal(String username, DashboardProvider dashboard, int index, String newGoal) {
    userGoals[username]?[dashboard]?[index] = newGoal;
    notifyListeners();
  }

  void removeGoal(String username, DashboardProvider dashboard, int index) {
    userGoals[username]?[dashboard]?.removeAt(index);
    notifyListeners();
  }

  void reorderGoals(String username, DashboardProvider dashboard, int oldIndex, int newIndex) {
    final goals = userGoals[username]?[dashboard];
    if (goals != null) {
      if (newIndex > oldIndex) newIndex -= 1;
      final item = goals.removeAt(oldIndex);
      goals.insert(newIndex, item);
      notifyListeners();
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
      ),
      home: const LoginPage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // TRY THIS: Try changing the color here to a specific color (to
        // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
        // change color while the other colors stay the same.
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: Column(
          // Column is also a layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          //
          // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
          // action in the IDE, or press "p" in the console), to see the
          // wireframe for each widget.
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text('You have pushed the button this many times:'),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
