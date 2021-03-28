import 'package:coach_my_body/providers/sample.dart';
import 'package:coach_my_body/routes.dart';
import 'package:coach_my_body/ui/home/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(
          value: Sample(
            id: 'sampleId', 
          description: 'sampleDesc'
        ),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo2',
        home: HomeScreen(),
        routes: Routes.routes,
      ),
    );
  }
}
