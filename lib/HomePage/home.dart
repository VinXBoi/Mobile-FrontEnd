import 'package:flutter/material.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        toolbarHeight: 70,
        leadingWidth: 700,
        leading: Padding(
          padding: EdgeInsets.only(left: MediaQuery.of(context).size.width * 0.01),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              CircleAvatar(
                radius: 20,
                backgroundImage: AssetImage("assets/ayangCylus.jpg"),
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
                    return DecoratedBox(
                      decoration: 
                        BoxDecoration(
                          image: 
                            DecorationImage(
                              image: 
                                AssetImage("assets/ayangCylus.jpg"),
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
                                      ),
                                  ),
                                  
                                  SizedBox(
                                    child: Row(
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
                            ],
                          )
                        ),
                    );
                  },
                ),
            ),
)


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
    );
  }
}