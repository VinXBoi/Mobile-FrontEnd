import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

bool isMarketingEnabled = false;

Map<String, bool> marketingTopics = {
  "Events and Resources": true,
  "Newsletters and Thought Leadership": true,
  "Product Education": true,
  "Product Updates": true,
  "User Research and Surveys": true,
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

  // State untuk nada notifikasi (radio)
  NotificationTone _tone = NotificationTone.defaultTone;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_rounded),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Setting"),
        centerTitle: true,
        backgroundColor: Colors.black,
        foregroundColor: Colors.white,
      ),
      body: ListView(
        padding: EdgeInsets.all(16.0),
        children: [
          Text(
            "Notifications",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(height: 20),
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
          buildSwitchItem(
            "Slack notifications",
            "Receive notifications in your Slack workspace when you're mentioned in a page, database property, or comment",
            slackNotifications,
            (val) => setState(() => slackNotifications = val),
          ),

          SizedBox(height: 30),
          Text(
            "Nada Notifikasi",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
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
          SizedBox(height: 30),
          Text(
            "Marketing",
            style: TextStyle(
              color: Colors.black,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            "Keep up to date with your favorite Notion news, events, and product releases!",
          ),
          SwitchListTile(
            title: Text("Marketing Communications"),
            value: isMarketingEnabled,
            onChanged: (bool value) {
              setState(() {
                isMarketingEnabled = value;
                if (!value) {
                  for (var key in marketingTopics.keys) {
                    marketingTopics[key] = true;
                  }
                }
              });
            },
          ),
          Divider(),
          SizedBox(height: 20),
          if (isMarketingEnabled)
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Topics", style: TextStyle(fontWeight: FontWeight.bold)),
                ...marketingTopics.keys.map((topic) {
                  return CheckboxListTile(
                    title: Text(topic),
                    value: marketingTopics[topic],
                    onChanged: (bool? value) {
                      setState(() {
                        marketingTopics[topic] = value!;
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
                        style: TextStyle(color: Colors.white),
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
      ),
    );
  }

  Widget buildSwitchItem(
    String title,
    String subtitle,
    bool value,
    Function(bool) onChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchListTile(
          title: Text(title, style: TextStyle(color: Colors.black)),
          subtitle: Text(
            subtitle,
            style: TextStyle(color: Colors.grey[600], fontSize: 13),
          ),
          value: value,
          onChanged: onChanged,
          activeColor: Colors.blue,
        ),
        Divider(
        color: Colors.grey[400],  // Lebih terang agar terlihat
        thickness: 1,
        height: 8,
      ),
      ],
    );
  }
}