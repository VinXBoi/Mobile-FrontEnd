import 'package:flutter/material.dart';

class Testing extends StatefulWidget {
  const Testing({super.key});

  @override
  State<Testing> createState() => _TestingState();
}

class _TestingState extends State<Testing> {
  final List<Map<String, dynamic>> Task = [
    {
      'task': 'Belajar Flutter',
      'date': '2025-05-08',
      'bacotan': 'ini nyoba aja',
      'status': true,
    },
    {
      'task': 'Kerjakan tugas kampus',
      'date': '2025-05-09',
      'bacotan': 'ini nyoba aja',
      'status': true,
    },
    {
      'task': 'Beli kebutuhan bulanan',
      'date': '2025-05-10',
      'bacotan': 'ini nyoba aja',
      'status': false,
    },
    {
      'task': 'Periksa email dosen pembimbing',
      'date': '2025-05-08',
      'bacotan': 'ini nyoba aja',
      'status': true,
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tes Table"),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: ConstrainedBox(
          constraints: BoxConstraints(minWidth: 800), // Paksa agar lebih lebar dari layar
          child: DataTable(
            columnSpacing: 24,
            columns: const [
              DataColumn(label: Text("Task")),
              DataColumn(label: Text("Date")),
              DataColumn(label: Text("Bacotan")),
              DataColumn(label: Text("Done")),
            ],
            rows: Task.map((item) {
              return DataRow(cells: [
                DataCell(Container(width: 200, child: Text(item['task']))),
                DataCell(Container(width: 150, child: Text(item['date']))),
                DataCell(Container(width: 200, child: Text(item['bacotan']))),
                DataCell(
                  Checkbox(
                    value: item['status'],
                    onChanged: (value) {
                      setState(() {
                        item['status'] = value!;
                      });
                    },
                  ),
                ),
              ]);
            }).toList(),
          ),
        ),
      ),
    );
  }
}
