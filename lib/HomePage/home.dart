<<<<<<< Updated upstream
// import 'package:flutter/material.dart';
=======
import 'package:flutter/material.dart';
import 'package:activity_tracker/DashBoard/DashBoard.dart';
import 'package:activity_tracker/HomePage/about.dart';
import 'package:activity_tracker/HomePage/setting.dart';
import 'package:activity_tracker/LoginPage/login.dart';
>>>>>>> Stashed changes

// class Homepage extends StatefulWidget {
//   const Homepage({super.key});

//   @override
//   State<Homepage> createState() => _HomepageState();
// }

<<<<<<< Updated upstream
// class _HomepageState extends State<Homepage> {
//   // List untuk menyimpan judul dashboard
//   List<String> dashboardTitles = ["Judul Dashboard 0", "Judul Dashboard 2"];
=======
class _HomePageState extends State<HomePage> {
  int ea = 0; // 0: Default, 1: NIM, 2: Nama, 3: Kelas
  // Example data for cards and items 
>>>>>>> Stashed changes

//   // Fungsi untuk menambahkan dashboard baru
//   void _addDashboard() {
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         String newTitle = ""; // Variabel untuk menyimpan input pengguna
//         return AlertDialog(
//           title: Text("nambahkan Dashboard Baru"),
//           content: TextField(
//             onChanged: (value) {
//               newTitle = value; // Simpan input pengguna
//             },
//             decoration: InputDecoration(hintText: "Masukkan judul dashboard"),
//           ),
//           actions: [
//             TextButton(
//               onPressed: () {
//                 Navigator.of(context).pop(); // Tutup dialog
//               },
//               child: Text("Batal"),
//             ),
//             TextButton(
//               onPressed: () {
//                 if (newTitle.isNotEmpty) {
//                   setState(() {
//                     dashboardTitles.add(newTitle); // Tambahkan judul baru ke list
//                   });
//                 }
//                 Navigator.of(context).pop(); // Tutup dialog
//               },
//               child: Text("Tambah"),
//             ),
//           ],
//         );
//       },
//     );
//   }

<<<<<<< Updated upstream
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: 
//         AppBar(
//           backgroundColor: Colors.blue,
//           toolbarHeight: 70,
//           leadingWidth: 700,
//           leading: Padding(
//           padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
//           child: 
//             Row(
//               // mainAxisSize: MainAxisSize.min,
//               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 CircleAvatar(
//                   radius: 23,
//                   backgroundImage: AssetImage("assets/tes.jpg"),
//                 ),
//                 SizedBox(width: 8),
//                 Expanded(
//                   child: Text(
//                     "Teresia",
//                     style: TextStyle(fontSize: 18, color: Colors.white),
//                   ),
//                 ),
//             ],
//           ),
//         ),
//         actions: [
//           Padding(
//             padding: EdgeInsets.only(right:3),
//             child: 
//               Row(
//                 children: [
//                   //Supaya gak overflow
//                   Container(
//                     width: 
//                       MediaQuery.of(context).size.width*0.35,
//                     height: 43,
//                         child: 
//                           TextField(
//                             maxLines: 1,//supaya cuma bisa ngisi satu bar
//                             decoration: 
//                               InputDecoration(
//                                 contentPadding: 
//                                   EdgeInsets.symmetric(vertical: 10, horizontal: 10),
//                                 enabledBorder: 
//                                   OutlineInputBorder(
//                                     borderRadius: BorderRadius.circular(90),
//                                     borderSide: BorderSide(color: Colors.blue)
//                                   ),
//                                 filled: true,
//                                 fillColor: Colors.white,
//                                 hintText: 'Pencarian',
//                               ),
//                           ),
//                   ),
//                   SizedBox(width:2),
//                   Padding(
//                     padding: EdgeInsets.only(right: 3), 
//                     child: 
//                       IconButton(
//                         icon: Icon(Icons.search),
//                         onPressed: () {},
//                       ),
//                     // ),
//                   )
                  
//                 ],
//               ),
//             ),
//           ],
//       ),
=======
  final List<Map<String, dynamic>> items = [
    {'icon': Icons.edit, 'title': 'Class Notes'},
    {'icon': Icons.group, 'title': 'Mikroskil Programming Class'},
    {'icon': Icons.school, 'title': 'Research Paper Planner'},
  ];
  
  final ScrollController _scrollController = ScrollController();
>>>>>>> Stashed changes

//       //BODY
//       body: 
//         Padding(
//           padding: EdgeInsets.only(right:10, left: 6),//BALIK
//           child: 
//             Column(
//               children: [
//                 SizedBox(height: 10),
//                 Row(
//                   children: [
//                     // Padding(
//                     //   padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
//                       Row(
//                         spacing: 10,
//                         children: [
//                           //INI KATEGORI
//                           Chip(
//                             label: const Text('Kategori'),
//                             avatar: CircleAvatar(
//                               backgroundColor: Colors.grey.shade800,
//                             ),
//                           ),
//                           Chip(
//                             label: const Text('Favorit'),
//                             avatar: CircleAvatar(
//                               backgroundColor: Colors.grey.shade800,
//                             ),
//                           ),
//                         ],
//                       ),
//                     // ),
//                   ],
//                 ),


<<<<<<< Updated upstream
//           //INI DASHBOARDNYA
//           Expanded(
//             child: 
//             Container(
//               padding: 
//                 EdgeInsets.only(
//                   top: MediaQuery.of(context).size.height*0.03, 
//                   left: MediaQuery.of(context).size.width*0.01,
//                 ), 
//               child: 
//                 GridView.builder(
//                   gridDelegate: 
//                     SliverGridDelegateWithFixedCrossAxisCount(
//                       crossAxisCount: 1,
//                       mainAxisSpacing: 10,
//                       crossAxisSpacing: 10,
//                       childAspectRatio: 5,
//                     ),
//                   itemCount: 10,
//                   itemBuilder: (context, index) {
//                     return 
//                     Container(
                      
//                       decoration: 
//                         BoxDecoration(
//                           border: Border.all(color: Colors.black, width:1),
//                           image: 
//                             DecorationImage(
//                               image: 
//                                 AssetImage("assets/tes.jpg"),
//                                 opacity: 0.3,
//                                 fit: BoxFit.cover,
//                             ),
//                           borderRadius: 
//                             BorderRadius.circular(8),
                          
//                         ),
//                         child: 
//                           Padding(
//                             padding: 
//                               EdgeInsets.only(
//                                 left: MediaQuery.of(context).size.width*0.01,
//                                 right: MediaQuery.of(context).size.width*0.01,
//                                 top: MediaQuery.of(context).size.height*0.01,
//                               ),
//                             child: 

//                               //BAGIAN JUDUL
//                               Row( 
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   // SizedBox(
//                                   //   child: 
//                                       Text(
//                                           "Judul Dashboard ${index + 1}",
//                                           style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.width*0.035)
//                                       ),
//                                       Expanded(child: Text("")),
//                                       IconButton(

//                                           // padding: EdgeInsets.zero,
//                                           // constraints: BoxConstraints(),
                                          
//                                           icon: 
//                                             SizedBox(
//                                               // height: 0,
//                                               child:
//                                                 Icon(
//                                               Icons.menu,
//                                               color: Colors.black,
//                                               size: MediaQuery.of(context).size.width * 0.05,  
//                                           ),
//                                             ),
                                            
//                                           onPressed: (){
//                                           }, 
//                                         ),
                                        
//                                         IconButton(
//                                           // constraints: BoxConstraints(),
//                                           // padding: EdgeInsets.zero,
//                                           onPressed: () {
//                                           },
//                                           icon: 
//                                             Icon( Icons.add,
//                                               color: Colors.black,
//                                               size: MediaQuery.of(context).size.width * 0.05,  
//                                           ),
//                                         ),
//                                   // ),
                                  
//                                   // SizedBox(
//                                   //   child: 
//                                     // Row(
//                                     //   crossAxisAlignment: CrossAxisAlignment.start,
//                                     //   // mainAxisAlignment: MainAxisAlignment.start,
//                                     //   children: [
                                        
//                                     //   ],
//                                     // ),
//                                   // ),
//                             ],
//                           )
//                         ),
//                     );
//                   },
//                 ),
//                 itemCount: dashboardTitles.length,
//                 itemBuilder: (context, index) {
//                   return Container(
//                     decoration: BoxDecoration(
//                       image: DecorationImage(
//                         image: AssetImage("assets/tes.jpg"),
//                         fit: BoxFit.cover,
//                       ),
//                       borderRadius: BorderRadius.circular(8),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.only(
//                         left: MediaQuery.of(context).size.width * 0.01,
//                         right: MediaQuery.of(context).size.width * 0.01,
//                         top: MediaQuery.of(context).size.height * 0.03,
//                       ),
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           SizedBox(
//                             child: Text(
//                               dashboardTitles[index],
//                               style: TextStyle(
//                                 color: Colors.black,
//                                 fontSize: MediaQuery.of(context).size.width * 0.035,
//                               ),
//                             ),
//                           ),
//                           SizedBox(
//                             child: Row(
//                               children: [
//                                 IconButton(
//                                   icon: Icon(
//                                     Icons.menu,
//                                     color: Colors.black,
//                                     size: MediaQuery.of(context).size.width * 0.05,
//                                   ),
//                                   onPressed: () {},
//                                 ),
//                                 IconButton(
//                                   onPressed: () {
//                                     setState(() {
//                                       dashboardTitles.removeAt(index); // Hapus dashboard yang dipilih    
                                      
//                                     });
//                                     Navigator.of(context).pop(); // Tutup dialog  
                                    
//                                   },
//                                   icon: Icon(
//                                     Icons.add,
//                                     color: Colors.black,
//                                     size: MediaQuery.of(context).size.width * 0.05,
//                                   ),
//                                 )
//                               ],
//                             ),
//                           ),
//                         ],
//                       ),
//                     ),
//                   );
//                 },
//               ),
//             ),
//           ),
//         ],
//       ),
          
          
//         ),
        
//       floatingActionButton: FloatingActionButton(
//         onPressed: _addDashboard, // Panggil fungsi untuk menambah dashboard
//         child: const Icon(Icons.add),
//       ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
//       bottomNavigationBar: BottomAppBar(
//         shape: CircularNotchedRectangle(),
//         child: Row(
//           mainAxisSize: MainAxisSize.max,
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: <Widget>[
//             IconButton(
//               icon: Icon(Icons.person),
//               onPressed: () {},
//             ),
//             IconButton(
//               icon: Icon(Icons.home),
//               onPressed: () {},
//             ),
//             IconButton(
//               onPressed: () {},
//               icon: Icon(Icons.note_alt_rounded),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
=======
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
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        elevation: 1,
        titleSpacing: 0,
        title: Padding(
          padding: EdgeInsets.all(10),
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
          ),
        ),
        actions: [
          Container(
            width: MediaQuery.of(context).size.width * 0.35,
            height: 43,
            child: TextField(
              maxLines: 1,
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
            child: IconButton(
              icon: Icon(Icons.search),
              onPressed: () {},
            ),
          ),
          SizedBox(width: 10),
        ],
      ),

      drawer: Drawer(
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(
                  "https://raw.githubusercontent.com/kurniawansHeru/gambar/refs/heads/main/231112494.jpg"
                ),
              ),
              accountName: Text(
                widget.username ?? "Nama User",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              accountEmail: Text("user@email.com"),
            ),
            
            // ListTile(
            //   leading: Icon(Icons.monitor, color: Colors.blue),
            //   title: Text("NIM"),
            //   selected: ea == 1,
            //   selectedTileColor: Colors.blue.withOpacity(0.1),
            //   onTap: () {
            //     setState(() {
            //       Navigator.pop(context);
            //       ea = 1;
            //       print("Selected: NIM - $ea");
            //     });
            //   },
            // ),
            
            // ListTile(
            //   leading: Icon(Icons.person, color: Colors.blue),
            //   title: Text("Nama"),
            //   selected: ea == 2,
            //   selectedTileColor: Colors.blue.withOpacity(0.1),
            //   onTap: () {
            //     setState(() {
            //       Navigator.pop(context);
            //       ea = 2;
            //       print("Selected: Nama - $ea");
            //     });
            //   },
            // ),
            
            // ListTile(
            //   leading: Icon(Icons.school, color: Colors.blue),
            //   title: Text("Kelas"),
            //   selected: ea == 3,
            //   selectedTileColor: Colors.blue.withOpacity(0.1),
            //   onTap: () {
            //     setState(() {
            //       Navigator.pop(context);
            //       ea = 3;
            //       print("Selected: Kelas - $ea");
            //     });
            //   },
            // ),
            
            // Divider(),
            
            ListTile(
              leading: Icon(Icons.settings, color: Colors.grey[600]),
              title: Text("Settings"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Setting()),
                );
              },
            ),

            ListTile(
              leading: Icon(Icons.info, color: Colors.grey[600]),
              title: Text("About"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => About()),
                );

                // showDialog(
                //   context: context,
                //   builder: (BuildContext context) {
                //     return AlertDialog(
                //       title: Text('About'),
                //       content: Text('Aplikasi ini dibuat untuk membantu Anda mengelola aktivitas Anda.'),
                //       actions: [
                //         TextButton(
                //           onPressed: () => Navigator.of(context).pop(),
                //           child: Text('OK'),
                //         ),
                //       ],
                //     );
                //   },
                // );
              },
            ),
            
            ListTile(
              leading: Icon(Icons.logout, color: Colors.red),
              title: Text("Logout"),
              onTap: () {
                Navigator.pop(context);
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text('Logout'),
                      content: Text('Apakah Anda yakin ingin logout?'),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.of(context).pop(),
                          child: Text('Batal'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pushAndRemoveUntil(
                              MaterialPageRoute(builder: (context) => LoginPage()),
                              (Route<dynamic> route) => false,
                            );
                          },
                          child: Text('Logout'),
                        ),
                      ],
                    );
                  },
                );
              },
            ),
            
            Spacer(),
            
            Padding(
              padding: EdgeInsets.all(16),
              child: Text(
                "Version 1.0.0",
                style: TextStyle(
                  color: Colors.grey[600],
                  fontSize: 12,
                ),
              ),
            ),
          ],
        ),
      ),

      body: SafeArea(
        child: Column(
          children: [
            // if (ea > 0)
            //   Container(
            //     width: double.infinity,
            //     padding: EdgeInsets.all(16),
            //     margin: EdgeInsets.all(10),
            //     decoration: BoxDecoration(
            //       color: Colors.blue.withOpacity(0.1),
            //       borderRadius: BorderRadius.circular(8),
            //       border: Border.all(color: Colors.blue.withOpacity(0.3)),
            //     ),
            //     child: Text(
            //       style: TextStyle(
            //         fontSize: 16,
            //         fontWeight: FontWeight.w500,
            //         color: Colors.blue[800],
            //       ),
            //     ),
            //   ),
            
            Padding(
              padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
              child: Row(
                children: [
                  Text(
                    "Dashboard",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),
            
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DashBoardPage()),
                              );
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
                            ),
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
            
            Padding(
              padding: EdgeInsets.only(left: 10, top: 5, bottom: 5),
              child: Row(
                children: [
                  Text(
                    "Private",
                    style: TextStyle(fontSize: 20),
                  ),
                ],
              ),
            ),

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
                          final item = items[index];
                          return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => DashBoardPage()),
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
                                  )
                                ],
                              ),
                              child: Row(
                                children: [
                                  Icon(Icons.arrow_right, color: theme.primaryColor),
                                  SizedBox(width: 10),
                                  Icon(item['icon'], color: Colors.black),
                                  SizedBox(width: 12),
                                  Expanded(
                                    child: Text(
                                      item['title'],
                                      style: TextStyle(
                                        color: Colors.black87,
                                        fontSize: 15,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(Icons.more_vert, color: Colors.grey[800]),
                                    onPressed: () {},
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.add, color: Colors.lightBlue),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      showDialog(
                                        context: context,
                                        builder: (BuildContext context) {
                                          return AlertDialog(
                                            title: Text('Hapus Item'),
                                            content: Text('Yakin ingin menghapus "${items[index]['title']}"?'),
                                            actions: [
                                              TextButton(
                                                onPressed: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Batal'),
                                              ),
                                              TextButton(
                                                onPressed: () {
                                                  setState(() {
                                                    items.removeAt(index);
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: Text('Hapus'),
                                              ),
                                            ],
                                          );
                                        },
                                      );
                                    },
                                    icon: Icon(Icons.delete, color: Colors.grey[800]),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        childCount: items.length,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            cards.add({
              'title': 'Class Notes',
              'icon': Icons.edit,
              'imageUrl': 'https://images.unsplash.com/photo-1588776814546-ec7ab9f64f5e',
            });
            items.add({
              'icon': Icons.edit,
              'title': '${items.length + 1}',
            });
          });
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
              IconButton(
                icon: Icon(Icons.settings, color: Colors.blue),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => Setting()),
                  );
                },
              ),
              IconButton(
                icon: Icon(Icons.home, color: Colors.blue),
                onPressed: () {},
              ),
              IconButton(
                icon: Icon(Icons.email, color: Colors.blue),
                onPressed: () {},
              ),
            ],
          ),
        ),
      ),
    );
  }

//   String _getSelectedContent() {
//     switch (ea) {
//       case 1:
//         return "Menampilkan informasi NIM";
//       case 2:
//         return "Menampilkan informasi Nama: ${widget.username}";
//       case 3:
//         return "Menampilkan informasi Kelas";
//       default:
//         return "";
//     }
//   }
}
>>>>>>> Stashed changes
