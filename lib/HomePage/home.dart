import 'package:flutter/material.dart';
<<<<<<< Updated upstream
=======
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
>>>>>>> Stashed changes

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

<<<<<<< Updated upstream
class _HomepageState extends State<Homepage> {
=======
class _HomePageState extends State<HomePage> {
  int _selectedRate = 0;
  final PageController _pageController = PageController(viewportFraction: 0.3);

  Map<DashboardProvider, Map<String, List<TaskProvider>>>? dashboards;

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

  // void _scrollLeft() {
  //   _scrollController.animateTo(
  //     _scrollController.offset - 180,
  //     duration: Duration(milliseconds: 300),
  //     curve: Curves.ease,
  //   );
  // }
  

  // void _scrollRight() {
  //   _scrollController.animateTo(
  //     _scrollController.offset + 180,
  //     duration: Duration(milliseconds: 300),
  //     curve: Curves.ease,
  //   );
  // }

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
  void dispose() {
    _scrollController.dispose();
    _pageController.dispose();
    super.dispose();
  }

>>>>>>> Stashed changes
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        toolbarHeight: 70,
        leadingWidth: 700,
        leading: Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/tes.jpg"),
              ),
              SizedBox(width: 8),
              Expanded(
                child: Text(
                  "Nama Akun Teresia",
                  style: TextStyle(fontSize: 16, color: Colors.black),
                ),
              ),
            ],
          ),
        ),

        //APPBAR KANAN
        actions: [
          Padding(
            padding: EdgeInsets.only(left: 0, top: 8, right: 10, bottom: 8),
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.only(right:8),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width*0.35,
                    child: TextField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(),
                        hintText: 'Pencarian',
                      ),
                    ),
                  ),
                ),

                Padding(padding: EdgeInsets.only(right: 20), 
                  child: 
                    Center(
                    child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ),
                )
                
              ],
            ),
          ),
        ],
      ),

      //BODY
      body: Column(
        children: [
          
          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
                child: Wrap(
                  spacing: 8,
                  children: [
                    //INI KATEGORI
                    Chip(
                      label: const Text('Kategori'),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.grey.shade800,
                      ),
                    ),
                    Chip(
                      label: const Text('Favorit'),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.grey.shade800,
                      ),
                    ),
                  ],
<<<<<<< Updated upstream
                ),
              ),
            ],
          ),


          //INI DASHBOARDNYA
          


          
          Expanded(
            child: 
            Container(
              padding: 
                EdgeInsets.only(
                  top: MediaQuery.of(context).size.height*0.03, 
                  left: MediaQuery.of(context).size.width*0.01,
                  right: MediaQuery.of(context).size.width*0.010,
                                // bottom: MediaQuery.of(context).size.height*0.1
              ), 
              child: 
                GridView.builder(
                  gridDelegate: 
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                      mainAxisSpacing: 10,
                      crossAxisSpacing: 10,
                      childAspectRatio: 5,
                    ),
                  itemCount: 2,
                  itemBuilder: (context, index) {
                    return Container(
                      decoration: 
                        BoxDecoration(
                          image: 
                            DecorationImage(
                              image: 
                                AssetImage("assets/tes.jpg"),
                                fit: BoxFit.cover,
                            ),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: 
                          Padding(
                            padding: 
                            EdgeInsets.only(
                              left: MediaQuery.of(context).size.width*0.01,
                              right: MediaQuery.of(context).size.width*0.01,
                              top: MediaQuery.of(context).size.height*0.03,
                              
                            ),
                            child: 
                              Row( 
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                    child: 
                                      Text(
                                        // size:20,
                                          "Judul Dashboard ${index + 1}",
                                          style: TextStyle(color: Colors.red, fontSize: MediaQuery.of(context).size.width*0.020)
=======
              )
            ,),
            // Scrollable Card with Arrows
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 140,

                    // width: MediaQuery.of(context).size.width * 0.8,
                    // width: MediaQuery.of(context).size.width * 0.5,
                    // width: double.infinity,
                    child: PageView.builder(
                      controller: _pageController,
                      itemCount: cards.length,
                      itemBuilder: (context, index) {
                        final card = cards[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              width: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                  image: NetworkImage(card['imageUrl']),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              child: Stack(
                                children: [
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
>>>>>>> Stashed changes
                                      ),
                                  ),
<<<<<<< Updated upstream
                                  
                                  SizedBox(
                                    child: Row(
=======
                                  Positioned(
                                    left: 12,
                                    bottom: 12,
                                    right: 12,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
>>>>>>> Stashed changes
                                      children: [
                                        IconButton(
                                          icon: 
                                            Icon(
                                              Icons.menu,
                                              color: Colors.red,
                                              size: MediaQuery.of(context).size.width * 0.03,  
                                          ),
                                          onPressed: (){
                                          }, 
                                        ),
                                        
                                        IconButton(
                                          onPressed: () {
                                          },
                                          icon: 
                                            Icon( Icons.add,
                                              color: Colors.red,
                                              size: MediaQuery.of(context).size.width * 0.03,  
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
<<<<<<< Updated upstream
                            ],
                          )
                        ),
                    );
                  },
                ),
            ),
)
=======
                                ],
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(height: 8),
                  Center(
                    child: SmoothPageIndicator(
                      controller: _pageController,
                      count: cards.length,
                      effect: ExpandingDotsEffect(
                        dotHeight: 8,
                        dotWidth: 8,
                        activeDotColor: Colors.blue,
                        dotColor: Colors.grey.shade300,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            //   child: Row(
            //     children: [
            //       IconButton(
            //         icon: Icon(Icons.arrow_back_ios_new, size: 18),
            //         onPressed: _scrollLeft,
            //       ),
            //       Expanded(
            //         child: SizedBox(
            //           height: 120,
            //           child: ListView.builder(
            //             controller: _scrollController,
            //             scrollDirection: Axis.horizontal,
            //             itemCount: cards.length,
            //             itemBuilder: (context, index) {
            //               final card = cards[index];
            //               return GestureDetector(
            //                 onTap: () {
            //                   // Navigator.push(context, MaterialPageRoute(builder: (context) => DashBoardPage()));
            //                 },
            //                 child: Container(
            //                   width: 160,
            //                   margin: EdgeInsets.only(right: 12),
            //                   decoration: BoxDecoration(
            //                     borderRadius: BorderRadius.circular(12),
            //                     image: DecorationImage(
            //                       image: NetworkImage(card['imageUrl']),
            //                       fit: BoxFit.cover,
            //                     ),
            //                   ),
            //                   child: Stack(
            //                     children: [
            //                       // Gradient overlay
            //                       Positioned.fill(
            //                         child: Container(
            //                           decoration: BoxDecoration(
            //                             borderRadius: BorderRadius.circular(12),
            //                             gradient: LinearGradient(
            //                               begin: Alignment.topCenter,
            //                               end: Alignment.bottomCenter,
            //                               colors: [
            //                                 Colors.transparent,
            //                                 Colors.black.withOpacity(0.7),
            //                               ],
            //                             ),
            //                           ),
            //                         ),
            //                       ),
            //                       // Title and icon
            //                       Positioned(
            //                         left: 12,
            //                         bottom: 12,
            //                         right: 12,
            //                         child: Column(
            //                           crossAxisAlignment: CrossAxisAlignment.start,
            //                           children: [
            //                             Icon(card['icon'], size: 20, color: Colors.white),
            //                             SizedBox(height: 4),
            //                             Text(
            //                               card['title'],
            //                               style: TextStyle(
            //                                 color: Colors.white,
            //                                 fontWeight: FontWeight.bold,
            //                                 fontSize: 13,
            //                               ),
            //                               maxLines: 2,
            //                               overflow: TextOverflow.ellipsis,
            //                             ),
            //                           ],
            //                         ),
            //                       ),
            //                     ],
            //                   ),
            //                 )
            //               );
                          
            //             },
            //           ),
            //         ),
            //       ),
            //       IconButton(
            //         icon: Icon(Icons.arrow_forward_ios, size: 18),
            //         onPressed: _scrollRight,
            //       ),
            //     ],
            //   ),
            // ),
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
>>>>>>> Stashed changes


        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.deepPurple,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {},
            ),
            IconButton(
              icon: Icon(Icons.home),
              onPressed: () {},
            ),
            IconButton(
              onPressed: () {},
              icon: Icon(Icons.note_alt_rounded),
            ),
          ],
        ),
      ),
<<<<<<< Updated upstream
=======
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

            // if (result != null && result is String && result.trim().isNotEmpty) {
            //   setState(() {
            //     cards.add({
            //       'title': result.trim(),
            //       'icon': Icons.new_label,
            //       'imageUrl': 'https://images.unsplash.com/photo-1588776814546-ec7ab9f64f5e',

            //     });

            //     items.add({
            //       'title': result.trim(),
            //       'icon': Icons.new_label,});
            //   });
            // }
            //   {
            //     'title': 'Class Notes',
            //     'icon': Icons.edit,
            //     'imageUrl': 'https://images.unsplash.com/photo-1588776814546-ec7ab9f64f5e',
            //   },
            // );
            // items.add(
            //   {'icon': Icons.edit, 'title': '${items.length + 1}'},
            // );
          // });
        }, 
          child: Icon(Icons.add),
          
        ),

      // floatingActionButton: FloatingActionButton(onPressed: () async {
      //   final result = await showDialog<DashboardProvider>(
      //     context: context,
      //     builder: (context) {
      //       String title = '';
      //       return AlertDialog(
      //         title: Text('Add New Dashboard'),
      //         content: TextField(
      //           decoration: InputDecoration(labelText: 'Dashboard Title'),
      //           onChanged: (value) => title = value,
      //         ),
      //         actions: [
      //           TextButton(onPressed: () => Navigator.pop(context), child: Text('Cancel')),
      //           TextButton(
      //             onPressed: () {
      //               if (title.isNotEmpty) {
      //                 Navigator.pop(context, DashboardProvider(title: title, icon: Icons.edit));
      //               } 
      //             },
      //             child: Text('Add'),
      //           ),
      //         ],
      //       );
      //     },
      //   );
      //   if (result != null) {
      //     final userProvider = Provider.of<UserProvider>(context, listen: false);
      //     userProvider.addDashboard(widget.username, result);
      //     setState(() {
      //       dashboards = userProvider.userDashboard[widget.username];
      //     });
      //   }
      // }, 
      //   child: Icon(Icons.add),
      // ),
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
            // DrawerHeader(
            //   decoration: BoxDecoration(color: Colors.blue),
            //   child: Text('Menu', style: TextStyle(color: Colors.white, fontSize: 24)),
            // ),
            ListTile(
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: () {
                Navigator.pop(context); 
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text('Settings'),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => About()));
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
                );
                // Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
              },
            ),
          ],
        ),
      ),
      // bottomNavigationBar: BottomAppBar(
      //   color: Colors.white,
      //   shape: CircularNotchedRectangle(),
      //   elevation: 5,
      //   notchMargin: 6,
      //   child: Padding(
      //     padding: const EdgeInsets.symmetric(horizontal: 20),
      //     child: Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         IconButton(icon: Icon(Icons.settings, color: Colors.blue), onPressed: () {
      //           Navigator.push(context, MaterialPageRoute(builder: (context) => Setting()));
      //         }),
      //         IconButton(icon: Icon(Icons.home, color: Colors.blue), onPressed: () {}),
      //         IconButton(icon: Icon(Icons.email, color: Colors.blue), onPressed: () {}),
      //       ],
      //     ),
      //   ),
      // ),
>>>>>>> Stashed changes
    );
  }
}