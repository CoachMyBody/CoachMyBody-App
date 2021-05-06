import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/textstyles.dart';
import 'package:coach_my_body/providers/home/home_search_model.dart';
import 'package:coach_my_body/ui/home/home_main_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../routes.dart';
import 'home_detail_cmb_recommend.dart';
import 'home_detail_popular_routine.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => SearchViewModel()),
      ],
      child: HomeMainPage()
    );
  }
}
