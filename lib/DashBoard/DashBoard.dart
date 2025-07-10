import 'package:activity_tracker/DashBoard/NewPage.dart';
import 'package:activity_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:activity_tracker/DashBoard/kanban.dart';
import 'package:provider/provider.dart';

class DashBoardPage extends StatefulWidget {
  final DashboardProvider dashboard;
  final String username;
  const DashBoardPage({super.key, required this.username, required this.dashboard});

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final TextEditingController commentController = TextEditingController();
  final List<String> _comments = [];
  // final List<TaskProvider> TaskProviders = [
  //   TaskProvider(title: 'Finalize research topic'),
  //   TaskProvider(title: 'Draft and submit research proposal'),
  //   TaskProvider(title: 'Begin and complete data collection'),
  //   TaskProvider(title: 'Write the first complete draft of the paper'),
  //   TaskProvider(title: 'Revise the draft based on feedback'),
  //   TaskProvider(title: 'Prepare the final draft of the paper'),
  //   TaskProvider(title: 'Submit the research paper'),
  // ];

  void addComment(String comment) {
    _comments.add(comment);
  }

  // void addNewTask() {
  //   setState(() {
  //     tasks.add(Task(
  //       title: 'New Task ${tasks.length + 1}',
  //     ));
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final dashboardMap = userProvider.userDashboard[widget.username]?[widget.dashboard] ?? {};
    final dashboardTasks = [
      ...?dashboardMap['Not Started'],
      ...?dashboardMap['In Progress'],
      ...?dashboardMap['Completed'],
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
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
                    child: Image.network(
                      'https://th.bing.com/th/id/OIP.pezNdQ9kxCrHYXGm64KPaQHaEK?rs=1&pid=ImgDetMain',
                      height: 180,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 16),
                  const Divider(thickness: 1, height: 24),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(Icons.school, size: 40),
                      SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          widget.dashboard.title,
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
                  Kanban(username: widget.username, dashboard: widget.dashboard),
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
                              // addNewTask();
                            },
                            icon: const Icon(Icons.add),
                            label: const Text('New'),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
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
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal:21.0),
                    child: Row(children: [
                      Text("Name", style: TextStyle(fontWeight: FontWeight.bold),),
                      Expanded(child: Text("")),
                      
                      // SizedBox(width: MediaQuery.of(context).size.width*0.885,  height: 10),
                      Text("Due date", style: TextStyle(fontWeight: FontWeight.bold),),
                      SizedBox(
                        width: 8,
                        height: 1,
                      ),
                    ],),
                  ),

                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: dashboardTasks.length,
                    itemBuilder: (context, index) {
                      final task = dashboardTasks[index];
                      return Card(
                        child: ListTile(
                          title: Text(task.title),
                          trailing: Text(task.dueDate),
                        ),
                      );
                    },
                  ),
                  const SizedBox(height: 16),

                  ElevatedButton.icon(
                    onPressed: () async {
                      final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => Newpage(status: 'Not Started')));
                      if(result != null) {
                        final userProvider = Provider.of<UserProvider>(context, listen: false);
                        userProvider.addTask(widget.username, widget.dashboard, result['status'], TaskProvider(title: result['title'], dueDate: result['dueDate']));
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Task berhasil ditambahkan'),
                              duration: Duration(seconds: 4),
                            ),
                          );
                        });

                      }
                      setState(() {
                        
                      });
                    },
                    icon: const Icon(Icons.add),
                    label: const Text('New Page'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      foregroundColor: Colors.white,
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
                ],
              ),
            ),
            const SizedBox(height: 16),
          ],
        ),
      ),
      // floatingActionButton: FloatingActionButton(onPressed: (){
      //   Navigator.pushReplacement(context, 
      //     MaterialPageRoute(builder: (context) => Newpage())
      //   );
      // }, child: Icon(Icons.add),),
    );
  }
}