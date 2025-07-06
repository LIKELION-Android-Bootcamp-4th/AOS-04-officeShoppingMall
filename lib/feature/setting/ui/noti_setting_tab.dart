import 'package:flutter/material.dart';

class NotiSettingTab extends StatefulWidget {
  NotiSettingTab({super.key, required this.controller});

  TabController controller;

  @override
  State<NotiSettingTab> createState() => _NotiSettingTabState();
}

class _NotiSettingTabState extends State<NotiSettingTab> {
  bool _noticeAlarm = true;
  bool _activityAlarm = false;
  bool _benefitAlarm = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SwitchListTile(
          title: Text('공지 알림'),
          value: _noticeAlarm,
          onChanged: (v) => setState(() => _noticeAlarm = v),
        ),
        SwitchListTile(
          title: Text('활동 알림'),
          value: _activityAlarm,
          onChanged: (v) => setState(() => _activityAlarm = v),
        ),
        SwitchListTile(
          title: Text('혜택 알림'),
          value: _benefitAlarm,
          onChanged: (v) => setState(() => _benefitAlarm = v),
        ),
      ],
    );
  }
}
