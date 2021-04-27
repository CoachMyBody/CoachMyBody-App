import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class RecordNotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RECORD_NOTI_TITLE).tr(),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.more_horiz_rounded), onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) {
              return RecordNotificationSettingsScreen();
            }));
          })
        ],
      ),
    );
  }
}

class RecordNotificationSettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(RECORD_NOTI_SETTINGS_TITLE).tr(),
      ),
    );
  }
}

