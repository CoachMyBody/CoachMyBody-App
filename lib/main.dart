import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/providers/record/record_date_model.dart';
import 'package:coach_my_body/routes.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:coach_my_body/constants/app_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await SystemChrome.setEnabledSystemUIOverlays(
      [SystemUiOverlay.bottom, SystemUiOverlay.top]);

  runApp(EasyLocalization(
    // 다국어 지원
    // 다국어 리소스 위치
    path: Assets.translationsDirPath,
    // 지원 언어
    supportedLocales: [
      Locale(TW_KO),
      Locale(TW_EN),
    ],
    // 기본 로케일을 한글로 설정
    fallbackLocale: Locale(TW_KO),
    child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    // (04/30) 가로 방향 미지원, 추후 지원 예정
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SelectedDateViewModel()),
      ],
      child: MaterialApp(
        // 다국어 지원
        // 로케일 delegate
        localizationsDelegates: context.localizationDelegates,
        // 지원하는 로케일
        supportedLocales: context.supportedLocales,
        // 설정된 로케일
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: tr(APP_NAME),
        initialRoute: Routes.root,
        routes: Routes.routes,
        theme: themeData,
      ),
    );
  }
}
