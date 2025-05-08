// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// // import 'package:flutter_application_1/Praktek/M03/pm03.dart';
// // import 'package:flutter_application_1/Praktek/M03/tm03.dart';
// // import 'package:flutter_application_1/Praktek/M04/kegiatan.dart';
// // import 'package:flutter_application_1/Praktek/M04/p04.dart';
// // import 'package:flutter_application_1/Praktek/M06/t06.dart';
// // import 'package:flutter_application_1/Praktek/M06/p06.dart';
// import 'package:flutter_application_1/Praktek/M07/p071.dart';
// import 'package:flutter_application_1/Praktek/M07/p072.dart';
// import 'package:flutter_application_1/Praktek/M07/p073.dart';

// class t07 extends StatefulWidget {
//   const t07({super.key});

//   @override
//   State<t07> createState() => _t07State();
// }

// class _t07State extends State<t07> {
//   List<Widget> listHalaman = [
//     // P071(),
//     // P072(),
//     // P073()
//   ];
//   Widget view = P071();
//   int n =0;
//   bool isLogin = true;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: view,
//       bottomNavigationBar: BottomNavigationBar(
//         onTap: (val){
//           print("Klik pada ${val}");
//           setState(() {
//             view = listHalaman[val];
//           });
//         },
//         items: [
//         BottomNavigationBarItem(
//           label: "Anggota_Action",
//           icon: Icon(Icons.group_outlined),),
//         BottomNavigationBarItem(
//           label: "FAB",
//           icon: Icon(Icons.abc),),
//         BottomNavigationBarItem(
//           label: "Tentang",
//           icon: Icon(Icons.person),),]
//       )

//       //drawer: Drawer(),
//     );
//   }
// }