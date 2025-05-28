import 'package:flutter/material.dart';

class TambahDashboard extends StatefulWidget {
  const TambahDashboard({super.key});

  @override
  State<TambahDashboard> createState() => _TambahDashboardState();
}

class _TambahDashboardState extends State<TambahDashboard> {
  final TextEditingController _controller = TextEditingController();
  final TextEditingController _controller2 = TextEditingController();
  bool _showButton = false;

  @override

  void initState() {
    super.initState();
    _controller.addListener(() {
      // Update tampilan saat isi TextField berubah
      setState(() {
        _showButton = _controller.text.trim().isNotEmpty;
      });
    });
  }


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Private") ,
        leading: Icon(Icons.folder_open),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pop(context);
            }, 
            icon: Icon(Icons.cancel)
          ),

          if (_showButton) TextButton(
            onPressed: (){
              Navigator.pop(context, _controller.text.trim());
            }, 
            child: Text("Done")
          ),

          // IconButton(onPressed: (){}, icon: Icon(Icons.more_horiz)),

        ],

      ),
      body: Padding(
        padding: EdgeInsets.all(10), 
        child: Column(
          children: [

            Container(
              decoration: BoxDecoration(
                border: 
                  Border.all(
                    color: Colors.grey,
                    width: 2
                  ),
                  borderRadius: BorderRadius.circular(8)
                
              ),
              width: 500,
              height: 100,
              child: Center(
                child: IconButton(onPressed: (){}, icon: Icon(Icons.add)),
              ),
            ),

            TextField(
              controller: _controller,
              decoration: InputDecoration(
                // labelText: 'New Page',
                hintText: "New Page",
                border: InputBorder.none,

                // border:
              ),
            ),
            TextField(
              controller: _controller2,
              decoration: InputDecoration(
                // labelText: 'New Page',
                hintText: "Add description",
                border: InputBorder.none,
                // border:
              ),
            ),
          ],
        ),
      ),
    );
  }
}