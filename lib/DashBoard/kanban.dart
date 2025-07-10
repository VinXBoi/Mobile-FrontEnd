import 'package:activity_tracker/DashBoard/Newpage.dart';
import 'package:activity_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:percent_indicator/percent_indicator.dart';

class Kanban extends StatelessWidget {
  final String username;
  final DashboardProvider dashboard;
  int persentasecompleted = -1;
  int persentasenotcompleted = -1;

  Kanban({super.key, required this.username, required this.dashboard});

  final List<String> typeKanban = ['Not Started', 'In Progress', 'Completed'];
  final List<MaterialColor> colorKanban = [
    Colors.grey,
    Colors.blue,
    Colors.green,
  ];

  double itung(Map<String, List<TaskProvider>> statusTasks) {
    final totalTasks = statusTasks.values.fold(
      0,
      (tmp, list) => tmp + list.length,
    );
    if (totalTasks == 0) return 0.0;
    final completedTasks = statusTasks['Completed']?.length ?? 0;
    return completedTasks / totalTasks;
  }

  String isiTooltip(Map<String, List<TaskProvider>> statusTasks) {
    final totalTasks = statusTasks.values.fold(
      0,
      (sum, list) => sum + list.length,
    );
    if (totalTasks == 0) {
      return 'Tidak ada task';
    }

    final completedTasks = statusTasks['Completed']?.length ?? 0;
    final notCompletedTasks = totalTasks - completedTasks;

    final completedPercentage = (completedTasks / totalTasks) * 100;
    final notCompletedPercentage = (notCompletedTasks / totalTasks) * 100;

    return 'Completed: ${completedPercentage.toStringAsFixed(1)}%\n'
        'Not Completed: ${notCompletedPercentage.toStringAsFixed(1)}%';
  }

  @override
  Widget build(BuildContext context) {
    final userProvider = Provider.of<UserProvider>(context);
    final Map<String, List<TaskProvider>> statusTasks =
        userProvider.userDashboard[username]?[dashboard] ?? {};

    return Padding(
      padding: const EdgeInsets.all(0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.wb_sunny),
              SizedBox(width: 8),
              Text(
                "Progress Tracker",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              SizedBox(width: 15, child: Text("")),
              // const Spacer(),
              Tooltip(
                message: isiTooltip(statusTasks),
                child: CircularPercentIndicator(
                  radius: 18.0,
                  lineWidth: 6.0,
                  animation: true,
                  percent: itung(statusTasks).clamp(0.0, 1.0),
                  center: Text(
                    "${(itung(statusTasks) * 100).toStringAsFixed(0)}%",
                    style: TextStyle(fontSize: 10),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                  progressColor: Colors.blue,
                  backgroundColor: Colors.grey[300]!,
                ),
              ),
            ],
          ),
          const Divider(thickness: 1, height: 24),
          for (int i = 0; i < typeKanban.length; i++)
            progressCard(
              context,
              colorKanban[i],
              typeKanban[i],
              statusTasks[typeKanban[i]]?.length ?? 0,
              statusTasks[typeKanban[i]] ?? [],
            ),
        ],
      ),
    );
  }

  Widget progressCard(
    BuildContext context,
    MaterialColor mainColor,
    String type,
    int counter,
    List<TaskProvider> tasks,
  ) {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 16),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: mainColor[100],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade300),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(Icons.circle, size: 12, color: mainColor),
              const SizedBox(width: 6),
              Text(
                type,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const Spacer(),
              Text(
                counter.toString(),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black54,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          if (tasks.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: tasks.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      color: mainColor[50],
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey.shade300),
                    ),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 2,
                      vertical: 2,
                    ),
                    child: ListTile(
                      title: Text(tasks[index].title),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(tasks[index].dueDate),
                          const SizedBox(width: 8),
                          PopupMenuButton<String>(
                            icon: const Icon(Icons.more_vert),
                            onSelected: (newStatus) {
                              final userProvider = Provider.of<UserProvider>(
                                context,
                                listen: false,
                              );

                              if (type != newStatus) {
                                userProvider.editStatusTask(
                                  username,
                                  dashboard,
                                  tasks[index],
                                  type,
                                  newStatus,
                                );

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      'Task Berhasil Dipindahkan "$newStatus"',
                                    ),
                                    duration: const Duration(seconds: 2),
                                  ),
                                );
                              }
                            },
                            itemBuilder:
                                (context) => [
                                  if (type != 'Not Started')
                                    const PopupMenuItem(
                                      value: 'Not Started',
                                      child: Text('Move to Not Started'),
                                    ),
                                  if (type != 'In Progress')
                                    const PopupMenuItem(
                                      value: 'In Progress',
                                      child: Text('Move to In Progress'),
                                    ),
                                  if (type != 'Completed')
                                    const PopupMenuItem(
                                      value: 'Completed',
                                      child: Text('Move to Completed'),
                                    ),
                                ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: TextButton.icon(
              onPressed: () async {
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Newpage(status: type),
                  ),
                );
                if (result != null) {
                  final userProvider = Provider.of<UserProvider>(
                    context,
                    listen: false,
                  );
                  userProvider.addTask(
                    username,
                    dashboard,
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
              },
              icon: Icon(Icons.add, color: mainColor),
              label: Text('New Task', style: TextStyle(color: mainColor)),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 10,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
