import 'package:flutter/material.dart';

class Kanban extends StatefulWidget {
  const Kanban({super.key});

  @override
  State<Kanban> createState() => _KanbanState();
}

class KanbanTask {
  String name;

  KanbanTask({required this.name});
}

class _KanbanState extends State<Kanban> {
  List<String> typeKanban = ['Not Started', 'In Progress', 'Completed'];
  Map<String, List<KanbanTask>> KanbanTaskList = {
    'Not Started' : [
      KanbanTask(name: 'T1')
    ],
    'In Progress' : [
      KanbanTask(name: 'T2')
    ],
    'Completed' : [
      KanbanTask(name: 'T3'),
      KanbanTask(name: 'T4')
    ],
  };
  late List<int> counterKanban = typeKanban.map((key) => KanbanTaskList[key]?.length ?? 0 ).toList();
  List<MaterialColor> colorKanban = [Colors.grey, Colors.blue, Colors.green];
  @override

  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              spacing: 10,
              children: [
                Icon(Icons.wb_sunny),
                Text("Progress Tracker", style: TextStyle(fontWeight: FontWeight.bold ),),
              ],
            ),
            const Divider(thickness: 1, height: 24),
            
            progressCard(colorKanban[0], typeKanban[0], counterKanban[0], KanbanTaskList['Not Started']),
            progressCard(colorKanban[1], typeKanban[1], counterKanban[1], KanbanTaskList['In Progress']),
            progressCard(colorKanban[2], typeKanban[2], counterKanban[2], KanbanTaskList['Completed']),
            
          ],
        ),
    );
  }

  Widget progressCard(MaterialColor mainColor, String type, int counter, List<KanbanTask>? dataKanban) {
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
          if (dataKanban != null && dataKanban.isNotEmpty)
            ListView.builder(
              shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: dataKanban.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 4),
                  child: Container(
                    decoration: BoxDecoration(
                      color: mainColor[50],
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.grey.shade300)
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(dataKanban[index].name),
                        ],
                      ) 
                  )
                  
                );
              },
            ),

          const SizedBox(height: 16),
          SizedBox(
            width: double.infinity,
            child: TextButton.icon(
              onPressed: () {
                // Tambahkan aksi
              },
              icon: Icon(Icons.add, color: mainColor),
              label: Text(
                'New Page',
                style: TextStyle(color: mainColor),
              ),
              style: TextButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                  side: BorderSide(color: Colors.grey.shade300),
                ),
                padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
              ),
            ),
          ),
        ],
      ),
    );
  }

}