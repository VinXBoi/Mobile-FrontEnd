import 'package:activity_tracker/DashBoard/DashBoard.dart';
import 'package:activity_tracker/HomePage/setting.dart';
import 'package:activity_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final username;
  const HomePage({super.key, required this.username});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Map<DashboardProvider, List<TaskProvider>>? dashboards;

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

  final ScrollController _scrollController = ScrollController();

  void _scrollLeft() {
    _scrollController.animateTo(
      _scrollController.offset - 180,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

  void _scrollRight() {
    _scrollController.animateTo(
      _scrollController.offset + 180,
      duration: Duration(milliseconds: 300),
      curve: Curves.ease,
    );
  }

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
    final theme = Theme.of(context);
    final dashboardEntries = dashboards?.entries.toList();
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 1,
        titleSpacing: 0,
        title: 
        Padding(padding: EdgeInsets.all(10), 
        child: Row(
          children: [
            CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage("assets/tes.jpg"),
            ),
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
            width: 
              MediaQuery.of(context).size.width*0.35,
            height: 43,
                child: 
                  TextField(
                    maxLines: 1,//supaya cuma bisa ngisi satu bar
                    decoration: 
                      InputDecoration(
                        contentPadding: 
                          EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                        enabledBorder: 
                          OutlineInputBorder(
                            borderRadius: BorderRadius.circular(90),
                            borderSide: BorderSide(color: Colors.blue)
                          ),
                        filled: true,
                        fillColor: Colors.white,
                        hintText: 'Pencarian',
                      ),
                  ),
          ),
          SizedBox(width:2),
          Padding(
            padding: EdgeInsets.only(right: 3), 
            child: 
              IconButton(
                icon: Icon(Icons.search),
                onPressed: () {},
              ),
          ),
          SizedBox(width: 10,),
          // IconButton(
          //   icon: Icon(Icons.menu, color: Colors.black87),
          //   onPressed: () {},
          // )
        ],
      ),

      body: SafeArea(
        child: Column(
          children: [
            Padding(padding: EdgeInsets.only(left: 10, top: 5, bottom: 5), 
              child:  Row(
                children: [
                    Text(
                      "Dashboard", 
                      style: TextStyle( fontSize: 20 ),
                    ),
                  ],
              )
            ,),
            // Scrollable Card with Arrows
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back_ios_new, size: 18),
                    onPressed: _scrollLeft,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 120,
                      child: ListView.builder(
                        controller: _scrollController,
                        scrollDirection: Axis.horizontal,
                        itemCount: cards.length,
                        itemBuilder: (context, index) {
                          final card = cards[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardPage()));
                            },
                            child: Container(
                              width: 160,
                              margin: EdgeInsets.only(right: 12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: NetworkImage(card['imageUrl']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Stack(
                                children: [
                                  // Gradient overlay
                                  Positioned.fill(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                        gradient: LinearGradient(
                                          begin: Alignment.topCenter,
                                          end: Alignment.bottomCenter,
                                          colors: [
                                            Colors.transparent,
                                            Colors.black.withOpacity(0.7),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  // Title and icon
                                  Positioned(
                                    left: 12,
                                    bottom: 12,
                                    right: 12,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Icon(card['icon'], size: 20, color: Colors.white),
                                        SizedBox(height: 4),
                                        Text(
                                          card['title'],
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          );
                          
                        },
                      ),
                    ),
                  ),
                  IconButton(
                    icon: Icon(Icons.arrow_forward_ios, size: 18),
                    onPressed: _scrollRight,
                  ),
                ],
              ),
            ),
            Padding(padding: EdgeInsets.only(left: 10, top: 5, bottom: 5), 
              child:  Row(
                children: [
                    Text(
                      "Private", 
                      style: TextStyle( fontSize: 20 ),
                    ),
                  ],
              )
            ,),

            // List bawah (sliver list)
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 60,
                      ),
                      delegate: SliverChildBuilderDelegate(
                        (context, index) {
                          final dashboardKey = dashboardEntries?[index].key;
                          final dashboardValue = dashboardEntries?[index].value;
                          
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardPage()));
                            },
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 16),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.shade300,
                                    blurRadius: 6,
                                    offset: Offset(0, 2),
                                  )
                                ],
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_right, color: theme.primaryColor),
                                  SizedBox(width: 10),
                                  Icon(dashboardKey?.icon, color: Colors.black),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      dashboardKey!.title,
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.more_vert, color: Colors.grey[800]),
                                    onPressed: () {
                                      
                                    },
                                  ),
                                  IconButton(onPressed:(){}, icon:Icon(Icons.add, color: Colors.lightBlue), ),
                                  IconButton(onPressed:(){
                                    showDialog(context: context, 
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text('Hapus Item'),
                                          content: Text('Yakin ingin menghapus "${dashboardKey.title}"?'),
                                          actions: [
                                            TextButton(
                                              onPressed: () {
                                                Navigator.of(context).pop(); // Tutup dialog
                                              },
                                              child: Text('Batal'),
                                            ),
                                            TextButton(
                                              onPressed: () {
                                                setState(() {
                                                  
                                                });
                                                Navigator.of(context).pop(); // Tutup dialog
                                              },
                                              child: Text('Hapus'),
                                            ),
                                          ],
                                        );
                                      }
                                    );
                                  }, icon:Icon(Icons.delete, color: Colors.grey[800]), ),
                                ],
                              ),
                            )
                          );
                          
                        },
                        childCount: dashboardEntries?.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(onPressed: () async {
        final result = await showDialog<DashboardProvider>(
          context: context,
          builder: (context) {
            String title = '';
            return AlertDialog(
              title: Text('Add New Dashboard'),
              content: TextField(
                decoration: InputDecoration(labelText: 'Dashboard Title'),
                onChanged: (value) => title = value,
              ),
              actions: [
                TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
                TextButton(
                  onPressed: () {
                    if (title.isNotEmpty) {
                      Navigator.pop(context, DashboardProvider(title: title, icon: Icons.edit));
                    } 
                  },
                  child: Text('Add'),
                ),
              ],
            );
          },
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

      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: CircularNotchedRectangle(),
        elevation: 5,
        notchMargin: 6,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(icon: Icon(Icons.settings, color: Colors.blue), onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Setting()));
              }),
              IconButton(icon: Icon(Icons.home, color: Colors.blue), onPressed: () {}),
              IconButton(icon: Icon(Icons.email, color: Colors.blue), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
