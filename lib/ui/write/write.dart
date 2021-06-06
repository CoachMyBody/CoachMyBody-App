import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/providers/write/write_data_provider.dart';
import 'package:coach_my_body/providers/write/write_view_model.dart';
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
        ChangeNotifierProvider(
            create: (context) => WriteRoutineSettingOpened()),
      ],
      child: Scaffold(
        appBar: WriteAppBarWidget(),
        body: WriteBodyWidget(),
      ),
    );
  }
}

class WriteAppBarWidget extends StatelessWidget with PreferredSizeWidget {
  const WriteAppBarWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var writeDataProvider =
        Provider.of<WriteDataProvider>(context, listen: true);

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
              writeDataProvider.clean();
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
            onTap: writeDataProvider.isRequiredDataFull
                ? () {
                    writeDataProvider.recordToServer();
                    writeDataProvider.clean();
                    Navigator.of(context).pop();
                  }
                : null,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                WRITE_BTN_SAVE_TXT,
                style: TextStyle(
                    color: writeDataProvider.isRequiredDataFull
                        ? AppColors.cmb_blue
                        : AppColors.cmb_grey[200]),
              ).tr(),
            ),
          ),
        ),
      ],
      automaticallyImplyLeading: false,
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}

class WriteBodyWidget extends StatelessWidget {
  WriteBodyWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var writeNaviViewProvider =
        Provider.of<WriteNaviViewModel>(context, listen: true);
    return writeNaviViewProvider.isFirstPage
        ? WriteFirstStepScreen()
        : WriteSecondStepScreen();
  }
}
