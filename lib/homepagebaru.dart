import 'package:flutter/material.dart';

class HomePage2 extends StatefulWidget {
  const HomePage2({super.key});

  @override
  State<HomePage2> createState() => _HomePage2State();
}

class _HomePage2State extends State<HomePage2> {
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

  final List<Map<String, dynamic>> items = [
    {'icon': Icons.edit, 'title': 'Class Notes'},
    {'icon': Icons.group, 'title': 'Mikroskil Programming Class'},
    {'icon': Icons.school, 'title': 'Research Paper Planner'},
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
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue[100],
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
              "Teresia",
              style: TextStyle(fontSize: 18, color: Colors.black),
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
                          return Container(
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
                          final item = items[index];
                          return Container(
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
                                  onPressed: () {
                                    
                                  },
                                ),
                                IconButton(onPressed:(){}, icon:Icon(Icons.add, color: Colors.lightBlue), ),
                              ],
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
              IconButton(icon: Icon(Icons.home, color: Colors.blue), onPressed: () {}),
              IconButton(icon: Icon(Icons.note_alt_outlined, color: Colors.blue), onPressed: () {}),
              IconButton(icon: Icon(Icons.email, color: Colors.blue), onPressed: () {}),
            ],
          ),
        ),
      ),
    );
  }
}
