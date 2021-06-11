import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/providers/record/record_noti_model.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class RecordNotificationScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => NotiStatusModel())
      ],
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(RECORD_NOTI_TITLE).tr(),
        ),
        body: Consumer<NotiStatusModel>(
          builder: (_, status, child) {
            if (true == status.IsEmpty()) {
              return RecordEmptyNotification();
            }

            return Text('not empty');
          },
        ),
      ),
    );
  }
}

class RecordEmptyNotification extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
            width: size.width * 0.6444,
            child: SvgPicture.asset(Assets.notiEmptySvgPath),
          ),
          SizedBox(
            height: size.width * 0.1111,
          ),
          Text(
            RECORD_NOTI_EMPTY_TXT,
            style: TextStyle(
                fontSize: size.width * 0.0444, color: AppColors.cmb_grey[700]),
          ).tr(),
          SizedBox(
            height: size.width * 0.1111,
          ),
        ],
      ),
    );
  }
}
