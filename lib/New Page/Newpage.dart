import 'package:flutter/material.dart';
import 'package:activity_tracker/DashBoard/DashBoard.dart';

class Newpage extends StatefulWidget {
  const Newpage({super.key});

  @override
  State<Newpage> createState() => _NewpageState();
}

class _NewpageState extends State<Newpage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  int selectedTypeIndex = 2;
  DateTime? selectedDate;
  TimeOfDay? startTime;
  TimeOfDay? endTime;
  int selectedColorIndex = 0;
  bool reminderOn = false;

  final List<Color> colors = [
    Colors.blue,
    Colors.purple,
    Colors.green,
    Colors.pink,
    Colors.orange,
    Colors.grey,
  ];
  final List<String> types = ["Event", "Meet", "Tasks"];
  
  String? selectedStatus;
  final List<String> statusList = ['Completed', 'In Progress', 'Not Started'];

  Future<void> pickDate() async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2100),
    );
    if (picked != null) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  Future<void> pickTime({required bool isStart}) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (picked != null) {
      setState(() {
        if (isStart) {
          startTime = picked;
        } else {
          endTime = picked;
        }
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("New Task"),
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () => Navigator.pop(context),
        ),
      ),

      body: SingleChildScrollView(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Title
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            SizedBox(height: 16),

            // Type
            Row(
              children: List.generate(types.length, (index) {
                return Padding(
                  padding: const EdgeInsets.only(right: 8),
                  child: ChoiceChip(
                    label: Text(types[index]),
                    selected: selectedTypeIndex == index,
                    onSelected: (_) {
                      setState(() {
                        selectedTypeIndex = index;
                      });
                    },
                  ),
                );
              }),
            ),
            SizedBox(height: 16),

            // Date Picker
            Row(
              children: [
                Icon(Icons.calendar_today, size: 20),
                SizedBox(width: 8),
                Text(
                  selectedDate == null
                      ? 'Pick a Date'
                      : '${selectedDate!.day}/${selectedDate!.month}/${selectedDate!.year}',
                ),
                Spacer(),
                TextButton(onPressed: pickDate, child: Text("Select")),
              ],
            ),
            SizedBox(height: 16),

            // Time Picker
            Row(
              children: [
                Icon(Icons.access_time, size: 20),
                SizedBox(width: 8),
                Text(startTime == null ? "Start" : startTime!.format(context)),
                Icon(Icons.arrow_right_alt),
                Text(endTime == null ? "End" : endTime!.format(context)),
                Spacer(),
                TextButton(
                  onPressed: () => pickTime(isStart: true),
                  child: Text("Start"),
                ),
                TextButton(
                  onPressed: () => pickTime(isStart: false),
                  child: Text("End"),
                ),
              ],
            ),
            SizedBox(height: 16),
            DropdownButtonFormField<String>(
              value: selectedStatus,
              decoration: InputDecoration(
                labelText: "Status",
                border: OutlineInputBorder(),
              ),
              items:
                  statusList.map((status) {
                    return DropdownMenuItem(value: status, child: Text(status));
                  }).toList(),
              onChanged: (value) {
                setState(() {
                  selectedStatus = value!;
                });
              },
            ),
            SizedBox(height: 16),

            // Note
            TextField(
              controller: _noteController,
              decoration: InputDecoration(labelText: "Note (Description)"),
            ),
            SizedBox(height: 16),

            // Location
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: "Location"),
            ),
            SizedBox(height: 16),

            // Color Picker
            Text("Colors"),
            SizedBox(height: 8),
            Row(
              children: List.generate(colors.length, (index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedColorIndex = index;
                    });
                  },
                  child: Container(
                    margin: EdgeInsets.only(right: 10),
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      color: colors[index],
                      shape: BoxShape.circle,
                      border:
                          selectedColorIndex == index
                              ? Border.all(color: Colors.black, width: 2)
                              : null,
                    ),
                  ),
                );
              }),
            ),
            SizedBox(height: 16),

            // Reminder Switch
            SwitchListTile(
              value: reminderOn,
              onChanged: (val) {
                setState(() {
                  reminderOn = val;
                });
              },
              title: Text("Set Reminder"),
            ),
            SizedBox(height: 16),

            // Save/Cancel
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(
                    onPressed: () => Navigator.pop(context),
                    child: Text("Cancel"),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      print("Saved: ${_titleController.text}");
                      // You can pass the data here
                    },
                    child: Text("Save"),
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
