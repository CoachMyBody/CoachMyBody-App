import 'package:coach_my_body/providers/sample.dart';
import 'package:coach_my_body/routes.dart';
import 'package:coach_my_body/ui/home/home.dart';
import 'package:coach_my_body/ui/navigation/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);
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
        initialRoute: Routes.tapPage,
        routes: Routes.routes,
      ),
    );
  }
}
