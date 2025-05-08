import 'package:flutter/material.dart';

class Newpage extends StatefulWidget {
  const Newpage({super.key});

  @override
  State<Newpage> createState() => _NewpageState();
}

class _NewpageState extends State<Newpage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          // <- back button di kiri
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context); // kembali ke halaman sebelumnya
          },
        ),
        title: Text("New Page"),
        backgroundColor: Colors.blue[200],
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.drive_folder_upload_outlined),
          ),
          IconButton(onPressed: () {}, icon: Icon(Icons.message_outlined)),
          IconButton(onPressed: () {}, icon: Icon(Icons.more_horiz)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Done Row
            Text("New page"),
            Row(
              children: [
                Icon(Icons.check_box_outlined),
                Text("Done"),
                SizedBox(width: 50),
                Checkbox(value: false, onChanged: null),
              ],
            ),
            SizedBox(height: 20),

            // Due Date Row
            Row(
              children: [
                Icon(Icons.date_range),
                Text("Due Date"),
                SizedBox(width: 30),
                Text("Empty"),
              ],
            ),
            SizedBox(height: 20),

            // Priority Row
            Row(
              children: [
                Icon(Icons.format_list_bulleted_add),
                Text("Priority"),
                SizedBox(width: 43),
                Text("Empty"),
              ],
            ),
            SizedBox(height: 20),

            // add property row
            Row(children: [Icon(Icons.add), Text("Add a property")]),
            SizedBox(height: 20),

            Text("Comments", style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(height: 10),

            Row(
              children: [
                CircleAvatar(radius: 14, child: Icon(Icons.person, size: 14)),
                SizedBox(width: 10),
                Expanded(
                  child: TextFormField(
                    decoration: InputDecoration(
                      labelText: "Add a comment...",
                      labelStyle: TextStyle(color: Colors.grey),
                    ),
                  ),
                ),
              ],
            ),

            Divider(),
            SizedBox(height: 10),

            Row(
              children: [
                Text("Tap here to continue with an empty page, or "),
                Text(
                  "create a template",
                  style: TextStyle(
                    color: Colors.blue,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
