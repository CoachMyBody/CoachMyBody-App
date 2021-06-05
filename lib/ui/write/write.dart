import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/providers/write/photo_assets_model.dart';
import 'package:coach_my_body/providers/write/write_data_provider.dart';
import 'package:coach_my_body/providers/write/write_navi_model.dart';
import 'package:coach_my_body/ui/write/write_first_step.dart';
import 'package:coach_my_body/ui/write/write_second_step.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class WriteScreen extends StatelessWidget {
  const WriteScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => WriteNaviViewModel()),
        ChangeNotifierProvider(create: (context) => MyRoutinesProvider()),
      ],
      child: Scaffold(
        appBar: _buildAppBar(context),
        body: WriteBodyWidget(),
      ),
    );
  }

  Widget _buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0.0,
      title: Text(
        WRITE_MAIN_TITLE,
        style: TextStyle(
            color: AppColors.cmb_grey[700], fontWeight: FontWeight.bold),
      ).tr(),
      actions: <Widget>[
        Center(
          child: InkWell(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(WRITE_BTN_CLOSE_TXT,
                      style: TextStyle(color: AppColors.cmb_grey[700]))
                  .tr(),
            ),
          ),
        ),
        Center(
          child: InkWell(
            onTap: () {}, // TODO
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                WRITE_BTN_SAVE_TXT,
                style: TextStyle(color: AppColors.cmb_grey[200]),
              ).tr(),
            ),
          ),
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }
}

class WriteBodyWidget extends StatelessWidget {
  const WriteBodyWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var writeNaviViewProvider =
        Provider.of<WriteNaviViewModel>(context, listen: true);
    return writeNaviViewProvider.isFirstPage
        ? WriteFirstStepScreen()
        : WriteSecondStepScreen();
  }
}
