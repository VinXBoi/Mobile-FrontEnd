import 'package:flutter/material.dart';
import 'package:activity_tracker/DashBoard/kanban.dart';

class Task {
  final String title;

  Task({required this.title});
}

class DashBoardPage extends StatefulWidget {
  const DashBoardPage({super.key});

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final TextEditingController commentController = TextEditingController();
  final List<String> _comments = [];
  final List<Task> tasks = [
    Task(title: 'Finalize research topic'),
    Task(title: 'Draft and submit research proposal'),
    Task(title: 'Begin and complete data collection'),
    Task(title: 'Write the first complete draft of the paper'),
    Task(title: 'Revise the draft based on feedback'),
    Task(title: 'Prepare the final draft of the paper'),
    Task(title: 'Submit the research paper'),
  ];

  void addComment(String comment) {
    _comments.add(comment);
  }

  void addNewTask() {
    setState(() {
      tasks.add(Task(
        title: 'New Task ${tasks.length + 1}',
      ));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.blue,
        actions: [
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Expanded(
              child: ListView(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      'assets/tes.jpg',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(thickness: 1, height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: const [
                      Icon(Icons.school, size: 40),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Research Paper Planner',
                          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const Divider(thickness: 1, height: 24),
                  const SizedBox(height: 16),

                  TextField(
                    controller: commentController,
                    decoration: InputDecoration(
                      hintText: 'Add a comment',
                      filled: true,
                      fillColor: Colors.grey[100],
                      prefixIcon: const Icon(Icons.comment),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    onSubmitted: (value) {
                      if (value.isNotEmpty) {
                        addComment(value);
                        commentController.clear();
                      }
                    },
                  ),
                  const SizedBox(height: 24),
                  const Divider(thickness: 1, height: 24),
                  Kanban(),
                  const Divider(thickness: 1, height: 24),
                  Row(spacing: 10,children: [
                    Icon(Icons.star),
                    const Text(
                        'Semester Goals',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                  ],),
                  const Divider(thickness: 1, height: 24),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Card(
                        elevation: 0.5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const ListTile(
                          leading: Icon(Icons.track_changes, color: Colors.black54),
                          title: Text('Goals 1'),
                        ),
                      ),

                      const SizedBox(height: 4),

                      Card(
                        elevation: 0.5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const ListTile(
                          leading: Icon(Icons.track_changes, color: Colors.black54),
                          title: Text('Goals 2'),
                        ),
                      ),

                      const SizedBox(height: 4),

                      Card(
                        elevation: 0.5,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const ListTile(
                          leading: Icon(Icons.track_changes, color: Colors.black54),
                          title: Text('Goals 3'),
                        ),
                      ),
                    ],
                  ),
                  const Divider(thickness: 1, height: 24),
                  const Text(
                    'Current draft',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 1, height: 24),
                  const SizedBox(height: 8),
                  const Text(
                    'Use the page below as your working document.',
                    style: TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                  const SizedBox(height: 16),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.insert_drive_file, color: Colors.green),
                      title: const Text('Research Paper'),
                      onTap: () {
                      },
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Divider(thickness: 1, height: 24),
                  const Text(
                    'Plan',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 1, height: 24),
                  const SizedBox(height: 4),
                  const Text(
                    'Break down your paper or thesis into milestones with target dates.',
                  ),
                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.grid_view_outlined),
                          const SizedBox(width: 10),
                          DropdownButton<String>(
                            value: 'All tasks',
                            items: const [
                              DropdownMenuItem(value: 'All tasks', child: Text('All')),
                              DropdownMenuItem(value: 'Completed', child: Text('Completed')),
                              DropdownMenuItem(value: 'Pending', child: Text('Pending')),
                            ],
                            onChanged: (value) {
                            },
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {
                            },
                            icon: const Icon(Icons.open_in_full),
                          ),
                          IconButton(
                            onPressed: () {
                            },
                            icon: const Icon(Icons.more_horiz),
                          ),
                          ElevatedButton.icon(
                            onPressed: () {
                              addNewTask();
                            },
                            icon: const Icon(Icons.add),
                            label: const Text('New'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 16),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: tasks.length,
                    itemBuilder: (context, index) {
                      final task = tasks[index];
                      return Card(
                        child: ListTile(
                          title: Text(task.title),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  ElevatedButton.icon(
                  onPressed: addNewTask,
                  icon: const Icon(Icons.add),
                  label: const Text('New Page'),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),

                const SizedBox(height: 16),
                const Divider(thickness: 1, height: 24),
                const Text( 
                  'Quick Add',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const Divider(thickness: 1, height: 24),
                const SizedBox(height: 4),
            //     Column(
            //     children: [
            //       Row(
            //         children: [
            //           ElevatedButton.icon(
            //             onPressed: () {
            //             },
            //             icon: const Icon(Icons.add),
            //             label: const Text('Quick Add Task'),
            //             style: ElevatedButton.styleFrom(
            //               backgroundColor: Colors.blue,
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(8),
            //               ),
            //             ),
            //           ),
            //           Expanded(child: Text(''),),
            //           ElevatedButton.icon(
            //             onPressed: () {
            //             },
            //             icon: const Icon(Icons.add),
            //             label: const Text('Quick Add Event'),
            //             style: ElevatedButton.styleFrom(
            //               backgroundColor: Colors.blue,
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(8),
            //               ),
            //             ),
            //           ),
            //         ],

            //       ),
            //       SizedBox(height: 20),
            //       Row(
            //         children: [
            //           ElevatedButton.icon(
            //             onPressed: () {
            //             },
            //             icon: const Icon(Icons.add),
            //             label: const Text('Quick Add Task'),
            //             style: ElevatedButton.styleFrom(
            //               backgroundColor: Colors.blue,
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(8),
            //               ),
            //             ),
            //           ),
            //           const Expanded(child: Text(''),),
            //           ElevatedButton.icon(
            //             onPressed: () {
            //             },
            //             icon: const Icon(Icons.add),
            //             label: const Text('Quick Add Event'),
            //             style: ElevatedButton.styleFrom(
            //               backgroundColor: Colors.blue,
            //               shape: RoundedRectangleBorder(
            //                 borderRadius: BorderRadius.circular(8),
            //               ),
            //             ),
            //           ),
            //         ],
                    
            //       ),

            //     // const Text("Quick Add"),
            //   ],
            // )

                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}