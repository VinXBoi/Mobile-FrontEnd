import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // List untuk menyimpan judul dashboard
  List<String> dashboardTitles = ["Judul Dashboard 0", "Judul Dashboard 2"];

  // Fungsi untuk menambahkan dashboard baru
  void _addDashboard() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        String newTitle = ""; // Variabel untuk menyimpan input pengguna
        return AlertDialog(
          title: Text("nambahkan Dashboard Baru"),
          content: TextField(
            onChanged: (value) {
              newTitle = value; // Simpan input pengguna
            },
            decoration: InputDecoration(hintText: "Masukkan judul dashboard"),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text("Batal"),
            ),
            TextButton(
              onPressed: () {
                if (newTitle.isNotEmpty) {
                  setState(() {
                    dashboardTitles.add(newTitle); // Tambahkan judul baru ke list
                  });
                }
                Navigator.of(context).pop(); // Tutup dialog
              },
              child: Text("Tambah"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: 
        AppBar(
          backgroundColor: Colors.blue,
          toolbarHeight: 70,
          leadingWidth: 700,
          leading: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
          child: 
            Row(
              // mainAxisSize: MainAxisSize.min,
              // mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CircleAvatar(
                  radius: 23,
                  backgroundImage: AssetImage("assets/tes.jpg"),
                ),
                SizedBox(width: 8),
                Expanded(
                  child: Text(
                    "Teresia",
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
            ],
          ),
        ),
        actions: [
          Padding(
<<<<<<< Updated upstream
            padding: EdgeInsets.only(right:3),
            child: 
              Row(
                children: [
                  //Supaya gak overflow
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
                    // ),
                  )
                  
                ],
              ),
=======
            padding: EdgeInsets.only(left: 0, top: 8, right: 3, bottom: 8),
            child: Wrap(
              children: [
                Padding(
                  padding: EdgeInsets.only(right: 8),
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width * 0.35,
                    child: TextField(
                      decoration: InputDecoration(
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
                ),
                Padding(
                  padding: EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.000),
                  child: Center(
                    child: IconButton(
                      icon: Icon(Icons.search),
                      onPressed: () {},
                    ),
                  ),
                )
              ],
>>>>>>> Stashed changes
            ),
          ],
      ),
<<<<<<< Updated upstream

      //BODY
      body: 
        Padding(
          padding: EdgeInsets.only(right:10, left: 6),//BALIK
          child: 
            Column(
              children: [
                SizedBox(height: 10),
                Row(
                  children: [
                    // Padding(
                    //   padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
                      Row(
                        spacing: 10,
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
                      ),
                    // ),
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
                  itemCount: 10,
                  itemBuilder: (context, index) {
                    return 
                    Container(
                      
                      decoration: 
                        BoxDecoration(
                          border: Border.all(color: Colors.black, width:1),
                          image: 
                            DecorationImage(
                              image: 
                                AssetImage("assets/tes.jpg"),
                                opacity: 0.3,
                                fit: BoxFit.cover,
                            ),
                          borderRadius: 
                            BorderRadius.circular(8),
                          
                        ),
                        child: 
                          Padding(
                            padding: 
                              EdgeInsets.only(
                                left: MediaQuery.of(context).size.width*0.01,
                                right: MediaQuery.of(context).size.width*0.01,
                                top: MediaQuery.of(context).size.height*0.01,
                              ),
                            child: 

                              //BAGIAN JUDUL
                              Row( 
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SizedBox(
                                  //   child: 
                                      Text(
                                          "Judul Dashboard ${index + 1}",
                                          style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.width*0.035)
                                      ),
                                      Expanded(child: Text("")),
                                      IconButton(

                                          // padding: EdgeInsets.zero,
                                          // constraints: BoxConstraints(),
                                          
                                          icon: 
                                            SizedBox(
                                              // height: 0,
                                              child:
                                                Icon(
                                              Icons.menu,
                                              color: Colors.black,
                                              size: MediaQuery.of(context).size.width * 0.05,  
                                          ),
                                            ),
                                            
                                          onPressed: (){
                                          }, 
                                        ),
                                        
                                        IconButton(
                                          // constraints: BoxConstraints(),
                                          // padding: EdgeInsets.zero,
                                          onPressed: () {
                                          },
                                          icon: 
                                            Icon( Icons.add,
                                              color: Colors.black,
                                              size: MediaQuery.of(context).size.width * 0.05,  
                                          ),
                                        ),
                                  // ),
                                  
                                  // SizedBox(
                                  //   child: 
                                    // Row(
                                    //   crossAxisAlignment: CrossAxisAlignment.start,
                                    //   // mainAxisAlignment: MainAxisAlignment.start,
                                    //   children: [
                                        
                                    //   ],
                                    // ),
                                  // ),
                            ],
                          )
                        ),
                    );
                  },
=======
      body: Column(
        children: [
          SizedBox(height: 20),
          Row(
            children: [
              Padding(
                padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
                child: Row(
                  children: [
                    Chip(
                      label: const Text('Kategori'),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.grey.shade800,
                      ),
                    ),
                    SizedBox(width: 8),
                    Chip(
                      label: const Text('Favorit'),
                      avatar: CircleAvatar(
                        backgroundColor: Colors.grey.shade800,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height * 0.03,
                left: MediaQuery.of(context).size.width * 0.01,
              ),
              child: GridView.builder(
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 5,
>>>>>>> Stashed changes
                ),
                itemCount: dashboardTitles.length,
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/tes.jpg"),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Padding(
                      padding: EdgeInsets.only(
                        left: MediaQuery.of(context).size.width * 0.01,
                        right: MediaQuery.of(context).size.width * 0.01,
                        top: MediaQuery.of(context).size.height * 0.03,
                      ),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          SizedBox(
                            child: Text(
                              dashboardTitles[index],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: MediaQuery.of(context).size.width * 0.035,
                              ),
                            ),
                          ),
                          SizedBox(
                            child: Row(
                              children: [
                                IconButton(
                                  icon: Icon(
                                    Icons.menu,
                                    color: Colors.black,
                                    size: MediaQuery.of(context).size.width * 0.05,
                                  ),
                                  onPressed: () {},
                                ),
                                IconButton(
                                  onPressed: () {
                                    setState(() {
                                      dashboardTitles.removeAt(index); // Hapus dashboard yang dipilih    
                                      
                                    });
                                    Navigator.of(context).pop(); // Tutup dialog  
                                    
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    color: Colors.black,
                                    size: MediaQuery.of(context).size.width * 0.05,
                                  ),
                                )
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
        ],
      ),
          
          
        ),
        
      floatingActionButton: FloatingActionButton(
        onPressed: _addDashboard, // Panggil fungsi untuk menambah dashboard
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
    );
  }
}