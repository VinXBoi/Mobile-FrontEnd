import 'package:flutter/material.dart';

class Newpage extends StatefulWidget {
  const Newpage({super.key});

  @override
  State<Newpage> createState() => _NewpageState();
}

class _NewpageState extends State<Newpage> {
  bool isDone = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.pop(context),
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
            // Title
            // Text(
            //   "New Page",
            //   style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            // ),
            // SizedBox(height: 8),
            // Divider(thickness: 2),

            // Done Row
            Row(
              children: [
                Icon(Icons.check_box_outlined),
                SizedBox(width: 8),
                Text("Done", style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(width: 29),
                Text(":", style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(width: 25),
                Checkbox(
                  value: isDone,
                  onChanged: (value) {
                    setState(() {
                      isDone = value!;
                    });
                  },
                  activeColor: Colors.blue,
                  checkColor: Colors.white,
                ),
              ],
            ),
            SizedBox(height: 20),

            // Due Date Row
            Row(
              children: [
                Icon(Icons.date_range),
                SizedBox(width: 8),
                Text(
                  "Due Date :",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
                SizedBox(width: 30),
                Text("Empty"),
              ],
            ),
            SizedBox(height: 20),

            // Tag Row with Chips
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(Icons.local_offer),
                SizedBox(width: 8),
                Text("Tag", style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(width: 38),
                Text(":", style: TextStyle(fontWeight: FontWeight.w600)),
                SizedBox(width: 20),
                Expanded(
                  child: Wrap(
                    spacing: 6,
                    children: const [
                      Chip(label: Text("#Coding")),
                      Chip(label: Text("#FrontEnd")),
                      Chip(label: Text("#AI")),
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),

            // Priority Row
            Row(
              children: [
                Icon(Icons.format_list_bulleted_add),
                SizedBox(width: 8),

                // Text "Priority"
                Text("Priority", style: TextStyle(fontWeight: FontWeight.w600)),

                // Spacer kecil
                SizedBox(width: 16),

                // Titik dua
                Text(":", style: TextStyle(fontWeight: FontWeight.w600)),

                // Spacer agar "Empty" geser ke kanan
                SizedBox(width: 43),

                Text("Empty"),
              ],
            ),

            SizedBox(height: 20),

            // Add Property Row
            Row(
              children: [
                Icon(Icons.add),
                SizedBox(width: 8),
                Text("Add a property"),
              ],
            ),
            SizedBox(height: 20),

            // Comments Section
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
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ],
            ),
            Divider(thickness: 2),
            SizedBox(height: 10),

            // Footer
            Row(
              children: [Text("Tap here to continue with an empty page, or ")],
            ),
            Row(
              children: [
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
