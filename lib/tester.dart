// import 'package:flutter/material.dart';

// class Task {
//   final String title;
//   final IconData icon;
//   final Color color;

//   Task({required this.title, required this.icon, required this.color});
// }

// class IsiPage extends StatefulWidget {
//   const IsiPage({super.key});

//   @override
//   _IsiPageState createState() => _IsiPageState();
// }

// class _IsiPageState extends State<IsiPage> {
//   final TextEditingController commentController = TextEditingController();
//   final List<String> _comments = [];
//   final List<Task> tasks = [
//     Task(title: 'Finalize research topic', icon: Icons.flag, color: Colors.red),
//     Task(title: 'Draft and submit research proposal', icon: Icons.edit, color: Colors.orange),
//     Task(title: 'Begin and complete data collection', icon: Icons.bar_chart, color: Colors.blue),
//     Task(title: 'Write the first complete draft of the paper', icon: Icons.description, color: Colors.deepPurple),
//     Task(title: 'Revise the draft based on feedback', icon: Icons.feedback, color: Colors.green),
//     Task(title: 'Prepare the final draft of the paper', icon: Icons.file_copy, color: Colors.teal),
//     Task(title: 'Submit the research paper', icon: Icons.send, color: Colors.pink),
//   ];

//   void addComment(String comment) {
//     _comments.add(comment);
//   }

//   void addNewTask() {
//     setState(() {
//       tasks.add(Task(
//         title: 'New Task ${tasks.length + 1}',
//         icon: Icons.task,
//         color: Colors.grey,
//       ));
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Dashboard'),
//         backgroundColor: Colors.blue,
//         actions: [
//           IconButton(
//             icon: const Icon(Icons.share),
//             onPressed: () {},
//           ),
//         ],
//       ),
//       body: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Expanded(
//               child: ListView(
//                 children: [
//                   // Cover Image
//                   ClipRRect(
//                     borderRadius: BorderRadius.circular(12),
//                     child: Image.asset(
//                       'assets/tes.jpg',
//                       height: 180,
//                       width: double.infinity,
//                       fit: BoxFit.cover,
//                     ),
//                   ),
//                   const SizedBox(height: 16),

//                   // Title Row
//                   Row(
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: const [
//                       Icon(Icons.school, size: 40),
//                       SizedBox(width: 12),
//                       Expanded(
//                         child: Text(
//                           'Research Paper Planner',
//                           style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                         ),
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),

//                   TextField(
//                     controller: commentController,
//                     decoration: InputDecoration(
//                       hintText: 'Add a comment',
//                       filled: true,
//                       fillColor: Colors.grey[100],
//                       prefixIcon: const Icon(Icons.comment),
//                       border: OutlineInputBorder(
//                         borderRadius: BorderRadius.circular(8),
//                       ),
//                     ),
//                     onSubmitted: (value) {
//                       if (value.isNotEmpty) {
//                         addComment(value);
//                         commentController.clear();
//                       }
//                     },
//                   ),
//                   const SizedBox(height: 24),

//                   // Description
//                   const Text(
//                     'Current draft',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 8),
//                   const Text(
//                     'Use the page below as your working document.',
//                     style: TextStyle(fontSize: 14, color: Colors.grey),
//                   ),
//                   const SizedBox(height: 16),

//                   // Paper file tile
//                   Card(
//                     child: ListTile(
//                       leading: const Icon(Icons.insert_drive_file, color: Colors.green),
//                       title: const Text('Research Paper'),
//                       onTap: () {
//                         // Tambahkan logika untuk membuka file
//                       },
//                     ),
//                   ),
//                   const SizedBox(height: 24),

//                   // Plan Header
//                   const Text(
//                     'Plan',
//                     style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//                   ),
//                   const SizedBox(height: 4),
//                   const Text(
//                     'Break down your paper or thesis into milestones with target dates.',
//                   ),
//                   const SizedBox(height: 16),

//                   // Filter and Add Task Row
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Row(
//                         children: [
//                           const Icon(Icons.grid_view_outlined),
//                           const SizedBox(width: 10),
//                           DropdownButton<String>(
//                             value: 'All tasks',
//                             items: const [
//                               DropdownMenuItem(value: 'All tasks', child: Text('All')),
//                               DropdownMenuItem(value: 'Completed', child: Text('Completed')),
//                               DropdownMenuItem(value: 'Pending', child: Text('Pending')),
//                             ],
//                             onChanged: (value) {
//                               // Tambahkan logika untuk filter
//                             },
//                           ),
//                         ],
//                       ),
//                       Row(
//                         children: [
//                           IconButton(
//                             onPressed: () {
//                               // Tambahkan logika untuk tombol full screen
//                             },
//                             icon: const Icon(Icons.open_in_full),
//                           ),
//                           IconButton(
//                             onPressed: () {
//                               // Tambahkan logika untuk tombol more options
//                             },
//                             icon: const Icon(Icons.more_horiz),
//                           ),
//                           ElevatedButton.icon(
//                             onPressed: () {
//                               // Tambahkan logika untuk tombol tambah task
//                             },
//                             icon: const Icon(Icons.add),
//                             label: const Text('New'),
//                             style: ElevatedButton.styleFrom(
//                               backgroundColor: Colors.blue,
//                               shape: RoundedRectangleBorder(
//                                 borderRadius: BorderRadius.circular(8),
//                               ),
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                   const SizedBox(height: 16),

//                   // Task List
//                   ListView.builder(
//                     shrinkWrap: true,
//                     physics: const NeverScrollableScrollPhysics(),
//                     itemCount: tasks.length,
//                     itemBuilder: (context, index) {
//                       final task = tasks[index];
//                       return Card(
//                         child: ListTile(
//                           leading: Icon(task.icon, color: task.color),
//                           title: Text(task.title),
//                         ),
//                       );
//                     },
//                   ),
//                 ],
//               ),
//             ),
//             const SizedBox(height: 16),

//             // +New Page Button
//             ElevatedButton.icon(
//               onPressed: addNewTask,
//               icon: const Icon(Icons.add),
//               label: const Text('New Page'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.blue,
//                 shape: RoundedRectangleBorder(
//                   borderRadius: BorderRadius.circular(8),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }

// void addNewTask() {
//   showDialog(
//     context: context,
//     builder: (BuildContext context) {
//       final TextEditingController taskTitleController = TextEditingController();

//       return AlertDialog(
//         title: const Text('Add New Task'),
//         content: TextField(
//           controller: taskTitleController,
//           decoration: const InputDecoration(
//             hintText: 'Enter task title',
//           ),
//         ),
//         actions: [
//           TextButton(
//             onPressed: () {
//               Navigator.of(context).pop(); // Tutup dialog tanpa menambahkan tugas
//             },
//             child: const Text('Cancel'),
//           ),
//           TextButton(
//             onPressed: () {
//               final String taskTitle = taskTitleController.text.trim();
//               if (taskTitle.isNotEmpty) {
//                 setState(() {
//                   tasks.add(Task(title: taskTitle));
//                 });
//               }
//               Navigator.of(context).pop(); // Tutup dialog setelah menambahkan tugas
//             },
//             child: const Text('Add'),
//           ),
//         ],
//       );
//     },
//   );
// }
