// ignore_for_file: unrelated_type_equality_checks

import 'package:activity_tracker/DashBoard/NewPage.dart';
import 'package:activity_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:activity_tracker/DashBoard/kanban.dart';
import 'package:provider/provider.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class DashBoardPage extends StatefulWidget {
  final DashboardProvider dashboard;
  final String username;
  const DashBoardPage({
    super.key,
    required this.username,
    required this.dashboard,
  });

  @override
  _DashBoardPageState createState() => _DashBoardPageState();
}

class _DashBoardPageState extends State<DashBoardPage> {
  final TextEditingController commentController = TextEditingController();
  final List<String> _comments = [];

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
    final dashboardMap =
        userProvider.userDashboard[widget.username]?[widget.dashboard] ?? {};
    final dashboardTasks = [
      ...?dashboardMap['Not Started'],
      ...?dashboardMap['In Progress'],
      ...?dashboardMap['Completed'],
    ];
    final goalsProvider = Provider.of<GoalsProvider>(context);
    final goals = goalsProvider.getGoals(
      widget.username,
      widget.dashboard.title,
    );
    final totalGoals = goals.length;
    final completedGoals = goals.where((goal) => goal['done'] == true).length;
    final incompleteGoals = totalGoals - completedGoals;
    final progress = totalGoals == 0 ? 0.0 : completedGoals / totalGoals;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        actions: [IconButton(icon: const Icon(Icons.share), onPressed: () {})],
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
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
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
                  Kanban(
                    username: widget.username,
                    dashboard: widget.dashboard,
                  ),
                  const Divider(thickness: 1, height: 24),
                  Row(
                    children: [
                      Icon(Icons.star),
                      const SizedBox(width: 8),
                      const Text(
                        'Semester Goals',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Spacer(),
                      IconButton(
                        icon: Icon(Icons.add),
                        onPressed: () async {
                          final controller = TextEditingController();
                          bool isDisabled = true;

                          final result = await showDialog<String>(
                            context: context,
                            builder: (context) {
                              return StatefulBuilder(
                                builder: (context, setState) {
                                  return AlertDialog(
                                    title: Text('Add Goal'),
                                    content: TextField(
                                      controller: controller,
                                      decoration: InputDecoration(
                                        hintText: 'Goal name',
                                      ),
                                      onChanged: (value) {
                                        setState(() {
                                          isDisabled = value.trim().isEmpty;
                                        });
                                      },
                                    ),
                                    actions: [
                                      TextButton(
                                        onPressed: () => Navigator.pop(context),
                                        child: Text('Cancel'),
                                      ),
                                      ElevatedButton(
                                        onPressed:
                                            isDisabled
                                                ? null
                                                : () => Navigator.pop(
                                                  context,
                                                  controller.text,
                                                ),
                                        child: Text('Add'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                          );

                          if (result != null && result.isNotEmpty) {
                            goalsProvider.addGoal(
                              widget.username,
                              widget.dashboard.title,
                              result,
                            );
                          }
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Text(
                    incompleteGoals == 0
                        ? '🎉 All goals completed!'
                        : '$incompleteGoals goals remaining',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  LinearProgressIndicator(
                    value: progress,
                    minHeight: 8,
                    backgroundColor: Colors.grey[300],
                    color: Colors.green[500],
                  ),
                  SizedBox(height: 16),
                
                  ReorderableListView(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    onReorder: (oldIndex, newIndex) {
                      goalsProvider.reorderGoals(
                        widget.username,
                        widget.dashboard.title,
                        oldIndex,
                        newIndex,
                      );
                    },
                    children: [
                      for (int i = 0; i < goals.length; i++)
                        Card(
                          key: ValueKey(goals[i]),
                          elevation: 0.5,
                          color: goals[i]['done'] ? Colors.green[100] : null,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: ListTile(
                            leading: InkWell(
                              onTap: () {
                                goalsProvider.toggleGoalStatus(
                                  widget.username,
                                  widget.dashboard.title,
                                  i,
                                );
                              },
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Icon(
                                    Icons.track_changes,
                                    color: goals[i]['done'] ? Colors.green[800] : Colors.black54,
                                  ),
                                  const SizedBox(width: 4),
                                  StepProgressIndicator(
                                    totalSteps: 1,
                                    currentStep: goals[i]['done'] ? 1 : 0,
                                    size: 20,
                                    selectedColor: Colors.black,
                                    unselectedColor: Colors.grey,
                                    customStep: (index, color, _) => Container(
                                      color: color,
                                      child: Icon(
                                        color == Colors.black ? Icons.check : Icons.remove,
                                        color: color == Colors.black ? Colors.white : Colors.black45,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            title: Text(
                              goals[i]['title'],
                              style: TextStyle(
                                decoration: goals[i]['done']
                                    ? TextDecoration.lineThrough
                                    : TextDecoration.none,
                                color: goals[i]['done'] ? Colors.green[800] : Colors.black87,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            trailing: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                IconButton(
                                  icon: Icon(Icons.edit, size: 20),
                                  onPressed: () async {
                                    final controller = TextEditingController(
                                      text: goals[i]['title'],
                                    );
                                    String? result = await showDialog<String>(
                                      context: context,
                                      builder: (context) {
                                        bool isButtonEnabled =
                                            controller.text.trim().isNotEmpty;

                                        return StatefulBuilder(
                                          builder: (context, setState) {
                                            return AlertDialog(
                                              title: Text('Edit Goal'),
                                              content: TextField(
                                                controller: controller,
                                                decoration:
                                                    InputDecoration(hintText: 'Goal name'),
                                                onChanged: (value) {
                                                  setState(() {
                                                    isButtonEnabled =
                                                        value.trim().isNotEmpty;
                                                  });
                                                },
                                              ),
                                              actions: [
                                                TextButton(
                                                  onPressed: () => Navigator.pop(context),
                                                  child: Text('Cancel'),
                                                ),
                                                ElevatedButton(
                                                  onPressed: isButtonEnabled
                                                      ? () => Navigator.pop(
                                                            context,
                                                            controller.text,
                                                          )
                                                      : null,
                                                  child: Text('Save'),
                                                ),
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    );

                                    if (result != null && result.isNotEmpty) {
                                      goalsProvider.editGoal(
                                        widget.username,
                                        widget.dashboard.title,
                                        i,
                                        result,
                                      );
                                    }
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete, size: 20),
                                  onPressed: () => goalsProvider.removeGoal(
                                    widget.username,
                                    widget.dashboard.title,
                                    i,
                                  ),
                                ),
                              ],
                            ),
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
                      leading: const Icon(
                        Icons.insert_drive_file,
                        color: Colors.lightBlue,
                      ),
                      title: const Text('Research Paper'),
                      onTap: () {},
                    ),
                  ),
                  const SizedBox(height: 24),
                  const Divider(thickness: 1, height: 24),
                  const Text(
                    'List Tasks',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const Divider(thickness: 1, height: 24),
                  const SizedBox(height: 4),
                  const Text(
                    'Break down your tasks into milestones with target dates.',
                  ),
                  const SizedBox(height: 16),

                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          const Icon(Icons.grid_view_outlined),
                          const SizedBox(width: 10),
                          Text(
                            "All Tasks",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.open_in_full),
                          ),
                          IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.more_horiz),
                          ),
                          ElevatedButton.icon(
                            onPressed: () async {
                              final result = await Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder:
                                      (context) =>
                                          Newpage(status: 'Not Started'),
                                ),
                              );

                              if (result != null) {
                                final userProvider = Provider.of<UserProvider>(
                                  context,
                                  listen: false,
                                );
                                userProvider.addTask(
                                  widget.username,
                                  widget.dashboard,
                                  result['status'],
                                  TaskProvider(
                                    title: result['title'],
                                    dueDate: result['dueDate'],
                                  ),
                                );
                                WidgetsBinding.instance.addPostFrameCallback((
                                  _,
                                ) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        'Task berhasil ditambahkan',
                                      ),
                                      duration: Duration(seconds: 4),
                                    ),
                                  );
                                });
                              }
                              setState(() {});
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
                      final result = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => Newpage(status: 'Not Started'),
                        ),
                      );

                      if (result != null) {
                        final userProvider = Provider.of<UserProvider>(
                          context,
                          listen: false,
                        );
                        userProvider.addTask(
                          widget.username,
                          widget.dashboard,
                          result['status'],
                          TaskProvider(
                            title: result['title'],
                            dueDate: result['dueDate'],
                          ),
                        );
                        WidgetsBinding.instance.addPostFrameCallback((_) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text('Task berhasil ditambahkan'),
                              duration: Duration(seconds: 4),
                            ),
                          );
                        });
                      }
                      setState(() {});
                    },
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
