import 'package:flutter/material.dart';

class IsiDashboard extends StatelessWidget {
  final List<Map<String, dynamic>> tasks = [
    {
      'title': 'Finalize research topic',
      'icon': Icons.flag,
      'color': Colors.red,
    },
    {
      'title': 'Draft and submit research proposal',
      'icon': Icons.edit,
      'color': Colors.orange,
    },
    {
      'title': 'Begin and complete data collection',
      'icon': Icons.bar_chart,
      'color': Colors.blue,
    },
    {
      'title': 'Write the first complete draft of the paper',
      'icon': Icons.description,
      'color': Colors.deepPurple,
    },
    {
      'title': 'Revise the draft based on feedback',
      'icon': Icons.feedback,
      'color': Colors.green,
    },
    {
      'title': 'Prepare the final draft of the paper',
      'icon': Icons.file_copy,
      'color': Colors.teal,
    },
    {
      'title': 'Submit the research paper',
      'icon': Icons.send,
      'color': Colors.pink,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cover image
            Image.network(
              'https://images.unsplash.com/photo-1517430816045-df4b7de11d1c',
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
            ),

            // Title
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Research Paper Planner',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),

            // Current Draft Section
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Current draft',
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w600)),
                  SizedBox(height: 4),
                  Text('Use the page below as your working document',
                      style: TextStyle(fontSize: 14, color: Colors.grey[700])),
                  SizedBox(height: 8),
                  Container(
                    padding: EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Row(
                      children: [
                        Icon(Icons.description, color: Colors.blue),
                        SizedBox(width: 10),
                        Text('Research Paper',
                            style: TextStyle(fontSize: 16)),
                      ],
                    ),
                  ),
                ],
              ),
            ),

            // Plan Section
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 24, 16, 8),
              child: Text('Plan',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600)),
            ),
            Column(
              children: tasks.map((task) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16.0, vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    child: ListTile(
                      leading: Icon(task['icon'], color: task['color']),
                      title: Text(task['title']),
                      trailing: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                        decoration: BoxDecoration(
                          color: Colors.grey[300],
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text('OPEN',
                            style:
                                TextStyle(fontSize: 12, color: Colors.black)),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            SizedBox(height: 30),
          ],
        ),
      ),
    );
  }
}
