import 'package:activity_tracker/DashBoard/TambahDashboard.dart';
import 'package:activity_tracker/HomePage/about.dart';
import 'package:activity_tracker/HomePage/homeMain.dart';
import 'package:activity_tracker/HomePage/setting.dart';
import 'package:activity_tracker/LoginPage/login.dart';
import 'package:activity_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final String username;
  const HomePage({super.key, required this.username});
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<DashboardProvider, Map<String, List<TaskProvider>>>? dashboards;
  int _selectedRate = 0;
  int idx = 0;
  final List<Map<String, dynamic>> cards = [
    {
      'title': 'Class Notes',
      'icon': Icons.edit,
      'imageUrl': 'https://images.unsplash.com/photo-1588776814546-ec7ab9f64f5e',
    },
    {
      'title': 'Research Paper Planner',
      'icon': Icons.school,
      'imageUrl': 'https://images.unsplash.com/photo-1519389950473-47ba0277781c',
    },
    {
      'title': 'Group Meeting Notes',
      'icon': Icons.group,
      'imageUrl': 'https://images.unsplash.com/photo-1522075469751-3a6694fb2f61',
    },
    {
      'title': 'Final Project Draft',
      'icon': Icons.assignment,
      'imageUrl': 'https://images.unsplash.com/photo-1559027615-0281db1ee92b',
    },
  ];
  

  @override
  void initState() {
    super.initState();
    
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login Berhasil'),
          duration: Duration(seconds: 4),
        ),
      );
    });
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    dashboards = userProvider.userDashboard[widget.username];
    
  }

  @override
  Widget build(BuildContext context) {
    List<dynamic> body = [HomeMainPage(username: widget.username), Setting(username: widget.username), About()];

    return Scaffold(
      appBar: AppBar(
        // automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 1,
        titleSpacing: 0,
        title: 
        Padding(padding: EdgeInsets.all(10), 
        child: Row(
          children: [
            Icon(Icons.person),
            SizedBox(width: 10),
            Text(
              widget.username,
              style: TextStyle(fontSize: 18),
            ),
          ],
        )
        ,),
        
        actions: [
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            height: 43,
            child: TextField(
              maxLines: 1, //supaya cuma bisa ngisi satu bar
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 10,
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(90),
                  borderSide: BorderSide(color: Colors.blue),
                ),
                filled: true,
                fillColor: Colors.white,
                hintText: 'Pencarian',
              ),
            ),
          ),
          SizedBox(width: 2),
          Padding(
            padding: EdgeInsets.only(right: 3),
            child: IconButton(icon: Icon(Icons.search), onPressed: () {}),
          ),
          SizedBox(width: 10),
          // IconButton(
          //   icon: Icon(Icons.menu, color: Colors.black87),
          //   onPressed: () {},
          // )
          PopupMenuButton<String>(
            onSelected: (value) {
              if (value == 'logout') {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => LoginPage()),
                  (route) => false,
                );
              }
            },
            itemBuilder:
                (BuildContext context) => [
                  PopupMenuItem<String>(value: 'logout', child: Text('Logout')),
                ],
            icon: Icon(Icons.more_vert),
          ),
        ],
      ),

      body: body[idx],
      floatingActionButton: 
        FloatingActionButton(
          onPressed: () async {
            final result = await Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => TambahDashboard(username: widget.username,))
            );
            if (result != null) {
              final userProvider = Provider.of<UserProvider>(context, listen: false);
              userProvider.addDashboard(widget.username, result);
              setState(() {
                dashboards = userProvider.userDashboard[widget.username];
              });
            }
        }, 
          child: Icon(Icons.add),
          
        ),

      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndFloat,
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            UserAccountsDrawerHeader(
              accountName: Text(widget.username), 
              accountEmail: Text('${widget.username}@gmail.com'),
              currentAccountPicture: Icon(Icons.person),
            ),
            
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context);
                idx = 0;
                setState(() {
                  
                }); // Close drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context); 
                idx = 1;
                setState(() {
                  
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                // Aksi untuk email
                Navigator.pop(context); 
                setState(() {
                  idx = 2;
                });
              },
            ),
            ListTile(
              leading: Icon(Icons.star),
              title: Text('Rate Us'),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (context) {
                    int tempRate = _selectedRate;
                    return StatefulBuilder(
                      builder: (context, setStateDialog) {
                        return AlertDialog(
                          title: Text('Rate Us'),
                          content: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text('Silahkan kasih penilaian:'),
                              SizedBox(height: 10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(5, (index) {
                                  return IconButton(
                                    icon: Icon(
                                      index < tempRate ? Icons.star : Icons.star_border,
                                      color: Colors.amber,
                                    ),
                                    onPressed: () {
                                      setStateDialog(() {
                                        tempRate = index + 1;
                                      });
                                    },
                                  );
                                }),
                              ),
                            ],
                          ),
                          actions: [
                            TextButton(
                              onPressed: () {
                                setStateDialog(() {
                                  tempRate = 0; 
                                });
                                Navigator.pop(context); 
                              },
                              child: Text('Batal'),
                            ),
                            TextButton(
                              onPressed: () {
                                setState(() {
                                  _selectedRate = tempRate;
                                });
                                Navigator.pop(context);
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(content: Text('Terima kasih atas penilaian $_selectedRate untuk aplikasi kami!'), duration: Duration(seconds: 2)),
                                );
                                setState(() {
                                  _selectedRate = 0; 
                                });
                              },
                              child: Text('Kirim'),
                            ),
                          ],
                        );
                      },
                    );
                  },
           );})

          ],
        ),
      ),
      
    );
  }
}
