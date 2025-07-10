import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
// import 'snack'
// import 'package:activity_tracker/DashBoard/DashBoard.dart';

class Newpage extends StatefulWidget {
  final String status;
  final String? title;
  final String? dueDate;
  const Newpage({super.key, required this.status, this.title, this.dueDate});

  @override
  State<Newpage> createState() => _NewpageState();
}

class _NewpageState extends State<Newpage> {
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _noteController = TextEditingController();
  final TextEditingController _locationController = TextEditingController();

  int selectedTypeIndex = 2;
  DateTime? selectedDate;
  String? dueDate;
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

  @override
  void initState() {
    super.initState();

    selectedStatus = widget.status;

    // If editing an existing task
    if (widget.title != null) {
      _titleController.text = widget.title!;
    }

    if (widget.dueDate != null) {
      dueDate = widget.dueDate!;
      try {
        selectedDate = DateFormat('dd/MM/yyyy').parse(widget.dueDate!);
      } catch (e) {
        selectedDate = null;
      }
    }
  }

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
        dueDate = DateFormat('dd/MM/yyyy').format(selectedDate!);
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

  String ubahString(DateTime pilihan) {
    return "${pilihan.day}/${pilihan.month}/${pilihan.year}";
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
                      if (_titleController.text.isEmpty) {
                        showTopSnackBar(
                          Overlay.of(context),
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.redAccent,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: const [
                                  // Icon(Icons.warning, color: Colors.white),
                                  SizedBox(width: 12, height: 10),
                                  Expanded(
                                    child: Text(
                                      "Nama Task tidak boleh kosong",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                        return;
                      }
                      if (selectedDate == null) {
                        showTopSnackBar(
                          Overlay.of(context),
                          Material(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.redAccent,
                            child: Padding(
                              padding: const EdgeInsets.all(16),
                              child: Row(
                                children: const [
                                  // Icon(Icons.warning, color: Colors.white),
                                  SizedBox(width: 12, height: 10),
                                  Expanded(
                                    child: Text(
                                      "Due Date Tidak Boleh kosong",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                        return;
                      }

                      Navigator.pop(context, {
                        'status': selectedStatus,
                        'title': _titleController.text,
                        'dueDate': dueDate,
                      });
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
