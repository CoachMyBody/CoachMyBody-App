import 'package:coach_my_body/ui/navigation/bottomNavigationBar.dart';
import 'package:coach_my_body/widget/sampleWidget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title : Text('HomeScreen')
      ),
      body: Center(
        child: SampleWidget(
          // children: SampleWidget()
        ),
      ),
      bottomNavigationBar: BtnNavigationBar(),
    );
  }
}
