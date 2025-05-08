import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  // State untuk masing-masing switch
  bool pushNotification = true;
  bool workspaceActivity = true;
  bool alwaysSendEmail = false;
  bool pageUpdates = true;
  bool workspaceDigest = true;
  bool slackNotifications = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold( // <-- jangan lupa background-nya
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
          Text("Notifications", style: TextStyle(color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold)),
          SizedBox(height: 20),
          buildSwitchItem("Mobile push notifications",
              "Receive push notifications on mentions and comments via your mobile app", pushNotification,
              (val) => setState(() => pushNotification = val)),
          buildSwitchItem("Activity in your workspace",
              "Receive emails when you get comments, mentions, page invites, reminders, access requests, and property changes", workspaceActivity,
              (val) => setState(() => workspaceActivity = val)),
          buildSwitchItem("Always send email notifications",
              "Receive emails about activity in your workspace, even when you're active on the app", alwaysSendEmail,
              (val) => setState(() => alwaysSendEmail = val)),
          buildSwitchItem("Page updates",
              "Receive email digests for changes to pages you're subscribed to", pageUpdates,
              (val) => setState(() => pageUpdates = val)),
          buildSwitchItem("Workspace digest",
              "Receive email digests of what's happening in your workspace", workspaceDigest,
              (val) => setState(() => workspaceDigest = val)),
          buildSwitchItem("Slack notifications",
              "Receive notifications in your Slack workspace when you're mentioned in a page, database property, or comment", slackNotifications,
              (val) => setState(() => slackNotifications = val)),
        ],
      ),
    );
  }

  Widget buildSwitchItem(String title, String subtitle, bool value, Function(bool) onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SwitchListTile(
          title: Text(title, style: TextStyle(color: Colors.black)),
          subtitle: Text(subtitle, style: TextStyle(color: Colors.grey[600], fontSize: 13)),
          value: value,
          onChanged: onChanged, // <-- interaktif sekarang
          activeColor: Colors.blue,
        ),
        Divider(color: Colors.grey[700]),
      ],
    );
  }
}
