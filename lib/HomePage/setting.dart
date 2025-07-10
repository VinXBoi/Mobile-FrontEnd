import 'package:activity_tracker/HomePage/about.dart';
import 'package:activity_tracker/HomePage/home.dart';
import 'package:activity_tracker/main.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Setting extends StatefulWidget {
  final String username;
  const Setting({super.key, required this.username});

  @override
  State<Setting> createState() => _SettingState();
}

bool isTaskNotificationEnabled = false;

Map<String, bool> taskCategories = {
  "Project Deadlines": true,
  "Team Meetings": true,
  "Task Reminders": true,
  "Progress Updates": true,
  "Feedback and Reviews": true,
};

enum NotificationTone { defaultTone, vibrateOnly, silent }

class _SettingState extends State<Setting> {
  // State untuk masing-masing switch
  bool pushNotification = true;
  bool workspaceActivity = true;
  bool alwaysSendEmail = false;
  bool pageUpdates = true;
  bool workspaceDigest = true;
  bool slackNotifications = false;
  int _selectedRate = 0;
  // State untuk nada notifikasi (radio)
  NotificationTone _tone = NotificationTone.defaultTone;

  String selectedSlackSetting = 'Light Mode';
  final List<String> slackOptions = ['Light Mode', 'Dark Mode'];
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    return ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            "Notifications",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Divider(),
          // SizedBox(height: 20),
          buildSwitchItem(
            "Mobile push notifications",
            "Receive push notifications on mentions and comments via your mobile app",
            pushNotification,
            (val) => setState(() => pushNotification = val),
          ),
          buildSwitchItem(
            "Activity in your workspace",
            "Receive emails when you get comments, mentions, page invites, reminders, access requests, and property changes",
            workspaceActivity,
            (val) => setState(() => workspaceActivity = val),
          ),
          buildSwitchItem(
            "Always send email notifications",
            "Receive emails about activity in your workspace, even when you're active on the app",
            alwaysSendEmail,
            (val) => setState(() => alwaysSendEmail = val),
          ),
          buildSwitchItem(
            "Page updates",
            "Receive email digests for changes to pages you're subscribed to",
            pageUpdates,
            (val) => setState(() => pageUpdates = val),
          ),
          buildSwitchItem(
            "Workspace digest",
            "Receive email digests of what's happening in your workspace",
            workspaceDigest,
            (val) => setState(() => workspaceDigest = val),
          ),
          buildDropdownItem(
            "Theme Mode",
            "Adjust Your System Theme Mode",
            selectedSlackSetting,
            slackOptions,
            (val) => setState(() {
              themeProvider.changeMode(val!);
              selectedSlackSetting = val;
            }),
          ),

          SizedBox(height: 15),
          Text(
            "Nada Notifikasi",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),

          SizedBox(height: 15),
          Column(
            children: [
              RadioListTile<NotificationTone>(
                title: const Text('Default'),
                value: NotificationTone.defaultTone,
                groupValue: _tone,
                onChanged: (NotificationTone? value) {
                  setState(() {
                    _tone = value!;
                  });
                },
              ),
              RadioListTile<NotificationTone>(
                title: const Text('Getar saja'),
                value: NotificationTone.vibrateOnly,
                groupValue: _tone,
                onChanged: (NotificationTone? value) {
                  setState(() {
                    _tone = value!;
                  });
                },
              ),
              RadioListTile<NotificationTone>(
                title: const Text('Senyap'),
                value: NotificationTone.silent,
                groupValue: _tone,
                onChanged: (NotificationTone? value) {
                  setState(() {
                    _tone = value!;
                  });
                },
              ),
            ],
          ),
          Divider(),
          SizedBox(height: 15),
          Text(
            "Tasks",
            style: TextStyle(
              color: Theme.of(context).textTheme.bodyLarge?.color,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Stay on top of your important tasks, meetings, and progress updates!",
          ),
          SwitchListTile(
            title: Text("Task Notifications"),
            value: isTaskNotificationEnabled,
            onChanged: (bool value) {
              setState(() {
                isTaskNotificationEnabled = value;
                if (!value) {
                  for (var key in taskCategories.keys) {
                    taskCategories[key] = true;
                  }
                }
              });
            },
          ),

          Divider(),
          SizedBox(height: 15),
          if (isTaskNotificationEnabled)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Topics",
                  style: TextStyle(
                    color: Theme.of(context).textTheme.bodyLarge?.color,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ...taskCategories.keys.map((topic) {
                  return CheckboxListTile(
                    title: Text(topic),
                    value: taskCategories[topic],
                    onChanged: (bool? value) {
                      setState(() {
                        taskCategories[topic] = value!;
                      });
                    },
                    controlAffinity: ListTileControlAffinity.leading,
                  );
                }).toList(),

                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Settings saved")),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: Text(
                        "Save",
                        style: TextStyle(
                          color: Theme.of(context).textTheme.bodyLarge?.color,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    OutlinedButton(
                      onPressed: () {
                        // Aksi saat Cancel ditekan
                        Navigator.pop(context);
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text("Changes discarded")),
                        );
                      },
                      style: OutlinedButton.styleFrom(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                          vertical: 12,
                        ),
                      ),
                      child: Text("Cancel"),
                    ),
                  ],
                ),
              ],
            ),
        ],
      );
  }

  Widget buildSwitchItem(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ],
                ),
              ),
              Switch(
                value: value,
                onChanged: onChanged,
                activeColor: Colors.blue,
              ),
            ],
          ),
        ),
        Divider(color: Colors.grey[400], thickness: 1, height: 8),
      ],
    );
  }

  Widget buildDropdownItem(
    String title,
    String subtitle,
    String currentValue,
    List<String> options,
    Function(String?) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(
                        color: Theme.of(context).textTheme.bodyLarge?.color,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      )),
                    SizedBox(height: 4),
                    Text(
                      subtitle,
                      style: TextStyle(color: Colors.grey[600], fontSize: 13),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 16),
              DropdownButton<String>(
                value: currentValue,
                onChanged: onChanged,
                items:
                    options.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
              ),
            ],
          ),
        ),
        Divider(color: Colors.grey[400], thickness: 1, height: 8),
      ],
    );
  }
}
