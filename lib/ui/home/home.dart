import 'package:easy_localization/easy_localization.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/ui/navigation/bottomNavigationBar.dart';
import 'package:coach_my_body/widgets/sampleWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text(HOME_MAIN_TITLE).tr(),
      ),
      body: Center(
        child: SampleWidget(
          // children: SampleWidget()
        ),
      ),
    );
  }
}
