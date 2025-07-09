import 'package:activity_tracker/DashBoard/Newpage.dart';
import 'package:activity_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Kanban extends StatelessWidget {
  final String username;
  final DashboardProvider dashboard;

  Kanban({
    super.key,
    required this.username,
    required this.dashboard,
  });

  final List<String> typeKanban = ['Not Started', 'In Progress', 'Completed'];
  final List<MaterialColor> colorKanban = [Colors.grey, Colors.blue, Colors.green];

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
            children: const [
              Icon(Icons.wb_sunny),
              SizedBox(width: 8),
              Text(
                "Progress Tracker",
                style: TextStyle(fontWeight: FontWeight.bold),
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
                    padding:
                        const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Text(tasks[index].title),
                  ),
                );
              },
            ),
          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: TextButton.icon(
              onPressed: () async {
                final result = await Navigator.push(context, MaterialPageRoute(builder: (context) => Newpage(status: type)));
                if(result != null) {
                  final userProvider = Provider.of<UserProvider>(context, listen: false);
                  userProvider.addTask(username, dashboard, result['status'], TaskProvider(title: result['title'],));
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
              label: Text(
                'New Task',
                style: TextStyle(color: mainColor),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }
}