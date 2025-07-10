import 'package:activity_tracker/DashBoard/DashBoard.dart';
import 'package:activity_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shimmer/shimmer.dart';

class HomeMainPage extends StatefulWidget {
  final String username;
  const HomeMainPage({super.key, required this.username});

  @override
  State<HomeMainPage> createState() => _HomeMainPageState();
}

class _HomeMainPageState extends State<HomeMainPage> {
  Map<DashboardProvider, Map<String, List<TaskProvider>>>? dashboards;
  bool loading = true;
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
    // TODO: implement initState
    final userProvider = Provider.of<UserProvider>(context, listen: false);
    dashboards = userProvider.userDashboard[widget.username];
    Future.delayed(Duration(seconds: 2), () {
      setState(() {
        loading = false;
      });
    });
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    final dashboardEntries = dashboards?.entries.toList();
    final theme = Theme.of(context);
    return SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
              child: Row(
                children: [Text("Dashboard", style: TextStyle(fontSize: 20))],
              ),
            ),
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
                      child: Expanded(
                        child:
                            loading
                                ? Expanded(
                                  child: Shimmer.fromColors(
                                    baseColor: Colors.grey,
                                    highlightColor: Colors.white,
                                    child: ListView.builder(
                                      controller: _scrollController,
                                      scrollDirection: Axis.horizontal,
                                      itemCount: 4,
                                      itemBuilder:
                                          (context, index) => Container(
                                            width: 160,
                                            margin: EdgeInsets.only(right: 12),
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                            ),
                                          ),
                                    ),
                                  ),
                                )
                                : ListView.builder(
                                  controller: _scrollController,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: cards.length,
                                  itemBuilder: (context, index) {
                                    final card = cards[index];
                                    return GestureDetector(
                                      onTap: () {
                                        // Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardPage()));
                                      },
                                      child: Container(
                                        width: 160,
                                        margin: EdgeInsets.only(right: 12),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                          image: DecorationImage(
                                            image: NetworkImage(
                                              card['imageUrl'],
                                            ),
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                        child: Stack(
                                          children: [
                                            // Gradient overlay
                                            Positioned.fill(
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(12),
                                                  gradient: LinearGradient(
                                                    begin: Alignment.topCenter,
                                                    end: Alignment.bottomCenter,
                                                    colors: [
                                                      Colors.transparent,
                                                      Colors.black.withOpacity(
                                                        0.7,
                                                      ),
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
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Icon(
                                                    card['icon'],
                                                    size: 20,
                                                    color: Colors.white,
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    card['title'],
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize: 13,
                                                    ),
                                                    maxLines: 2,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                ),
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
            Padding(
              padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
              child: Row(
                children: [Text("Private", style: TextStyle(fontSize: 20))],
              ),
            ),

            // List bawah (sliver list)
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    sliver: SliverGrid(
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 1,
                        mainAxisSpacing: 10,
                        mainAxisExtent: 60,
                      ),
                      delegate: SliverChildBuilderDelegate((context, index) {
                        final dashboardKey = dashboardEntries?[index].key;
                        // final dashboardValue = dashboardEntries?[index].value;

                        if (loading) {
                          return SizedBox(
                            width: 200.0,
                            height: 100.0,
                            child: Shimmer.fromColors(
                              baseColor: Colors.grey,
                              highlightColor: Colors.white,
                              child: SizedBox(
                                child:
                                    loading
                                        ? Container(
                                            width: 200,
                                            height: 100,
                                            decoration: BoxDecoration(
                                              color: Colors.grey[300],
                                              borderRadius: BorderRadius.circular(20), // Ini untuk rounded corner
                                            ),
                                          )
                                        : Text(
                                          'Private',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 40.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                              ),
                            ),
                          );

                          // Container(
                          //   decoration: BoxDecoration(
                          //     color: Colors.grey[300],
                          //     borderRadius: BorderRadius.circular(12),
                          //   ),
                          // );
                        }
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder:
                                    (context) => DashBoardPage(
                                      username: widget.username,
                                      dashboard: dashboardKey,
                                    ),
                              ),
                            );
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
                                ),
                              ],
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.arrow_right,
                                  color: theme.primaryColor,
                                ),
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
                                PopupMenuButton(
                                  icon: Icon(Icons.more_vert),
                                  onSelected: (value) {
                                    if (value == 'edit') {
                                      String editedTitle = dashboardKey.title;
                                      showDialog(
                                        context: context,
                                        builder: (context) {
                                          return AlertDialog(
                                            title: Text('Edit Dashboard'),
                                            content: TextField(
                                              controller: TextEditingController(
                                                text: dashboardKey.title,
                                              ),
                                              decoration: InputDecoration(
                                                labelText: 'New Title',
                                              ),
                                              onChanged:
                                                  (value) =>
                                                      editedTitle = value,
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed:
                                                    () =>
                                                        Navigator.pop(context),
                                                child: Text('Cancel'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  if (editedTitle.isNotEmpty) {
                                                    final userProvider =
                                                        Provider.of<
                                                          UserProvider
                                                        >(
                                                          context,
                                                          listen: false,
                                                        );
                                                    userProvider.editDashboard(
                                                      widget.username,
                                                      dashboardKey,
                                                      DashboardProvider(
                                                        
                                                        title: editedTitle,
                                                        icon: dashboardKey.icon,
                                                      ),
                                                    );
                                                    setState(() {
                                                      dashboards =
                                                          userProvider
                                                              .userDashboard[widget
                                                              .username];
                                                    });
                                                  }
                                                  Navigator.pop(context);
                                                },
                                                child: Text('Save'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    } else if (value == 'delete') {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Hapus Item'),
                                            content: Text(
                                              'Yakin ingin menghapus "${dashboardKey.title}"?',
                                            ),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Batal'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  final userProvider =
                                                      Provider.of<UserProvider>(
                                                        context,
                                                        listen: false,
                                                      );
                                                  userProvider.removeDashboard(
                                                    widget.username,
                                                    dashboardKey,
                                                  );
                                                  setState(() {
                                                    dashboards =
                                                        userProvider
                                                            .userDashboard[widget
                                                            .username];
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Hapus'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    }
                                  },
                                  itemBuilder:
                                      (BuildContext context) =>
                                          <PopupMenuEntry<String>>[
                                            PopupMenuItem<String>(
                                              value: 'edit',
                                              child: Text("Edit"),
                                            ),
                                            PopupMenuItem<String>(
                                              value: 'delete',
                                              child: Text("Hapus"),
                                            ),
                                          ],
                                ),
                              ],
                            ),
                          ),
                        );
                      }, childCount: dashboardEntries?.length),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  }
}