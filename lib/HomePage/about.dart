import 'package:flutter/material.dart';

class About extends StatefulWidget {
  const About({super.key});

  @override
  State<About> createState() => _AboutState();
}

class _AboutState extends State<About> {
  // void _showDialog() {
  //   if (_selectedDialog == 1) {
  //     // Dialog
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return Dialog(
  //           backgroundColor: Colors.blue[100],
  //           child: SizedBox(
  //             width: 150,
  //             height: 50,
  //             child: Center(
  //               child: Text(
  //                 "Dialog(150X50)",
  //                 style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
  //               ),
  //             ),
  //           ),
  //         );
  //       },
  //     );
  //   } else if (_selectedDialog == 2) {
  //     // AlertDialog
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return AlertDialog(
  //           backgroundColor: Colors.blue[100],
  //           title: const Text("Alert Dialog"),
  //           content: const Text("Ini adalah Alert Dialog."),
  //           actions: [
  //             TextButton(
  //               onPressed: () => Navigator.pop(context),
  //               child: const Text("OK"),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   } else if (_selectedDialog == 3) {
  //     // SimpleDialog
  //     showDialog(
  //       context: context,
  //       builder: (context) {
  //         return SimpleDialog(
  //           backgroundColor: Colors.blue[100],
  //           title: const Text("Simple Dialog"),
  //           children: [
  //             const Padding(
  //               padding: EdgeInsets.all(8.0),
  //               child: Text("Ini adalah Simple Dialog."),
  //             ),
  //             TextButton(
  //               onPressed: () => Navigator.pop(context),
  //               child: const Text("OK"),
  //             ),
  //           ],
  //         );
  //       },
  //     );
  //   }
  // }
  // int _selectedDialog = 1; // Default to Dialog
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon:  Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.pop(context),
        ),
        title:  Text("Tentang Aplikasi"),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding:  EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child:  Icon(
                  Icons.directions_run,
                  size: 50,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20),

              Text(
                "Activity Tracker Pro",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blueAccent,
                ),
              ),
              SizedBox(height: 5),

              Text(
                "Versi 1.0.0",
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),
              SizedBox(height: 30),

              Card(
                elevation: 3,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding:  EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        "Aplikasi Activity Tracker membantu Anda memonitor dan menganalisis aktivitas harian dengan mudah.",
                        style: TextStyle(
                          fontSize: 16,
                          height: 1.5,
                          color: Colors.grey[800],
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 15),

                      Text(
                        "Fitur Utama:",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 10),
                      Column(
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              foregroundColor: Colors.black,
                              alignment: Alignment.centerLeft,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: Colors.blue[100],
                                  title: const Text("Fitur: Lacak Progres Aktivitas"),
                                  content: const Text("Fitur ini memungkinkan Anda melacak progres aktivitas harian secara real-time."),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Tutup"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Row(
                              children: const [
                                Icon(Icons.timeline, color: Colors.blueAccent),
                                SizedBox(width: 15),
                                Expanded(
                                  child: Text("Lacak progres aktivitas", style: TextStyle(fontSize: 15)),
                                ),
                              ],
                            ),
                          ),

                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              foregroundColor: Colors.black,
                              alignment: Alignment.centerLeft,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: Colors.blue[100],
                                  title: const Text("Fitur: Analisis Statistik"),
                                  content: const Text("Analisis aktivitas Anda secara mendalam menggunakan grafik dan data statistik."),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Tutup"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Row(
                              children: const [
                                Icon(Icons.insights, color: Colors.blueAccent),
                                SizedBox(width: 15),
                                Expanded(
                                  child: Text("Analisis statistik", style: TextStyle(fontSize: 15)),
                                ),
                              ],
                            ),
                          ),

                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              foregroundColor: Colors.black,
                              alignment: Alignment.centerLeft,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: Colors.blue[100],
                                  title: const Text("Fitur: Pengingat Harian"),
                                  content: const Text("Fitur ini akan mengingatkan Anda secara rutin untuk tetap aktif dan produktif."),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Tutup"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Row(
                              children: const [
                                Icon(Icons.notifications, color: Colors.blueAccent),
                                SizedBox(width: 15),
                                Expanded(
                                  child: Text("Pengingat harian", style: TextStyle(fontSize: 15)),
                                ),
                              ],
                            ),
                          ),

                          TextButton(
                            style: TextButton.styleFrom(
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              foregroundColor: Colors.black,
                              alignment: Alignment.centerLeft,
                            ),
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  backgroundColor: Colors.blue[100],
                                  title: const Text("Fitur: Sinkronisasi Cloud"),
                                  content: const Text("Simpan dan akses data aktivitas Anda dari berbagai perangkat dengan sinkronisasi cloud."),
                                  actions: [
                                    TextButton(
                                      onPressed: () => Navigator.pop(context),
                                      child: const Text("Tutup"),
                                    ),
                                  ],
                                ),
                              );
                            },
                            child: Row(
                              children: const [
                                Icon(Icons.cloud, color: Colors.blueAccent),
                                SizedBox(width: 15),
                                Expanded(
                                  child: Text("Sinkronisasi cloud", style: TextStyle(fontSize: 15)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      )


                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                      //   child: Row(
                      //     children: [
                      //       IconButton(
                      //         icon: const Icon(Icons.timeline, color: Colors.blueAccent),
                      //         onPressed: () {
                      //           showDialog(
                      //             context: context,
                      //             builder: (context) {
                      //               return AlertDialog(
                      //                 backgroundColor: Colors.blue[100],
                      //                 title: const Text("Fitur: Lacak Progres Aktivitas"),
                      //                 content: const Text("Fitur ini memungkinkan Anda melacak progres aktivitas harian secara real-time."),
                      //                 actions: [
                      //                   TextButton(
                      //                     onPressed: () => Navigator.pop(context),
                      //                     child: const Text("Tutup"),
                      //                   ),
                      //                 ],
                      //               );
                      //             },
                      //           );
                      //         },
                      //       ),
                      //       const SizedBox(width: 15),
                      //       const Expanded(
                      //         child: Text(
                      //           "Lacak progres aktivitas",
                      //           style: TextStyle(fontSize: 15),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding:  EdgeInsets.symmetric(vertical: 8.0),
                      //   child: Row(
                      //     children: [
                      //       Icon(Icons.insights, color: Colors.blueAccent),
                      //       SizedBox(width: 15),
                      //       Expanded(
                      //         child: TextButton(
                      //           onPressed: () {
                      //             showDialog(
                      //               context: context,
                      //               builder: (context) {
                      //                 return AlertDialog(
                      //                   backgroundColor: Colors.blue[100],
                      //                   title:  Text("Fitur: Analisis Statistik"),
                      //                   content:  Text("Analisis aktivitas Anda secara mendalam menggunakan grafik dan data statistik."),
                      //                   actions: [
                      //                     TextButton(
                      //                       onPressed: () => Navigator.pop(context),
                      //                       child:  Text("Tutup"),
                      //                     ),
                      //                   ],
                      //                 );
                      //               },
                      //             );
                      //           },
                      //           child:  Text(
                      //             "Analisis statistik",
                      //             style: TextStyle(fontSize: 15, color: Colors.blueAccent),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding:  EdgeInsets.symmetric(vertical: 8.0),
                      //   child: Row(
                      //     children: [
                      //       Icon(Icons.notifications, color: Colors.blueAccent),
                      //       SizedBox(width: 15),
                      //       Expanded(
                      //         child: TextButton(
                      //           onPressed: () {
                      //             showDialog(
                      //               context: context,
                      //               builder: (context) {
                      //                 return AlertDialog(
                      //                   backgroundColor: Colors.blue[100],
                      //                   title:  Text("Fitur: Pengingat Harian"),
                      //                   content:  Text("Fitur ini akan mengingatkan Anda secara rutin untuk tetap aktif dan produktif."),
                      //                   actions: [
                      //                     TextButton(
                      //                       onPressed: () => Navigator.pop(context),
                      //                       child:  Text("Tutup"),
                      //                     ),
                      //                   ],
                      //                 );
                      //               },
                      //             );
                      //           },
                      //           child:  Text(
                      //             "Pengingat harian",
                      //             style: TextStyle(fontSize: 15, color: Colors.blueAccent),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding:  EdgeInsets.symmetric(vertical: 8.0),
                      //   child: Row(
                      //     children: [
                      //       Icon(Icons.cloud, color: Colors.blueAccent),
                      //       SizedBox(width: 15),
                      //       Expanded(
                      //         child: TextButton(
                      //           onPressed: () {
                      //             showDialog(
                      //               context: context,
                      //               builder: (context) {
                      //                 return AlertDialog(
                      //                   backgroundColor: Colors.blue[100],
                      //                   title:  Text("Fitur: Sinkronisasi Cloud"),
                      //                   content:  Text("Simpan dan akses data aktivitas Anda dari berbagai perangkat dengan sinkronisasi cloud."),
                      //                   actions: [
                      //                     TextButton(
                      //                       onPressed: () => Navigator.pop(context),
                      //                       child:  Text("Tutup"),
                      //                     ),
                      //                   ],
                      //                 );
                      //               },
                      //             );
                      //           },
                      //           child:  Text(
                      //             "Sinkronisasi cloud",
                      //             style: TextStyle(fontSize: 15, color: Colors.blueAccent),
                      //           ),
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      // Padding(
                      //   padding:  EdgeInsets.symmetric(vertical: 8.0),
                      //   child: Row(
                      //     children: [
                      //        Icon(Icons.timeline, color: Colors.blueAccent),
                      //        SizedBox(width: 15),
                      //        Expanded(

                      //         child: Text(
                      //           "Lacak progres aktivitas", 
                      //           style: TextStyle(fontSize: 15)
                      //         ),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding:  EdgeInsets.symmetric(vertical: 8.0),
                      //   child: Row(
                      //     children: [
                      //        Icon(Icons.insights, color: Colors.blueAccent),
                      //        SizedBox(width: 15),
                      //        Expanded(
                      //         child: Text("Analisis statistik", style: TextStyle(fontSize: 15)),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding:  EdgeInsets.symmetric(vertical: 8.0),
                      //   child: Row(
                      //     children: [
                      //        Icon(Icons.notifications, color: Colors.blueAccent),
                      //       const SizedBox(width: 15),
                      //       const Expanded(
                              
                      //         child: Text("Pengingat harian", style: TextStyle(fontSize: 15)),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                      // Padding(
                      //   padding: const EdgeInsets.symmetric(vertical: 8.0),
                      //   child: Row(
                      //     children: [
                      //       const Icon(Icons.cloud, color: Colors.blueAccent),
                      //       const SizedBox(width: 15),
                      //       const Expanded(
                      //         child: Text("Sinkronisasi cloud", style: TextStyle(fontSize: 15)),
                      //       ),
                      //     ],
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),

              const Text(
                "Tim Pengembang",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 15),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueAccent.withOpacity(0.2),
                          border: Border.all(color: Colors.blueAccent, width: 2),
                        ),
                        child: const Icon(Icons.person, size: 40, color: Colors.blueAccent),
                      ),
                      const SizedBox(height: 8),
                      const Text("Alvin Dinata", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("231111420", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueAccent.withOpacity(0.2),
                          border: Border.all(color: Colors.blueAccent, width: 2),
                        ),
                        child: const Icon(Icons.person, size: 40, color: Colors.blueAccent),
                      ),
                      const SizedBox(height: 8),
                      const Text("Vera Nataria", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("231110030", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueAccent.withOpacity(0.2),
                          border: Border.all(color: Colors.blueAccent, width: 2),
                        ),
                        child: const Icon(Icons.person, size: 40, color: Colors.blueAccent),
                      ),
                      const SizedBox(height: 8),
                      const Text("Teresia Hana Agatha Siburian", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("231112494", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        width: 70,
                        height: 70,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.blueAccent.withOpacity(0.2),
                          border: Border.all(color: Colors.blueAccent, width: 2),
                        ),
                        child: const Icon(Icons.person, size: 40, color: Colors.blueAccent),
                      ),
                      const SizedBox(height: 8),
                      const Text("Wilmer Tanton", style: TextStyle(fontWeight: FontWeight.bold)),
                      Text("231112849", style: TextStyle(fontSize: 12, color: Colors.grey[600])),
                    ],
                  ),

                ],
              ),
              const SizedBox(height: 30),

              Card(
                color: Colors.blueAccent.withOpacity(0.1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      const Text(
                        "Butuh Bantuan?",
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Text(
                        "Hubungi kami melalui:",
                        style: TextStyle(
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(height: 15),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.email, size: 20, color: Colors.blueAccent),
                            SizedBox(width: 10),
                            Text("support@activitytracker.com", style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.phone, size: 20, color: Colors.blueAccent),
                            SizedBox(width: 10),
                            Text("0812 3456 7890", style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Icon(Icons.language, size: 20, color: Colors.blueAccent),
                            SizedBox(width: 10),
                            Text("www.activitytracker.com", style: TextStyle(fontSize: 15)),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),

              Text(
                "© 2025 Activity Tracker Pro. All rights reserved.",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.grey[500],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
