import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/providers/write/write_navi_model.dart';
import 'package:coach_my_body/ui/write/write_photo.dart';
import 'package:coach_my_body/widgets/common_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class WriteSecondStepScreen extends StatelessWidget {
  const WriteSecondStepScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SvgPicture.asset(
              'assets/images/write/second_step_frame.svg', // TODO
              width: MediaQuery.of(context).size.width,
            ),
            _buildSelfFeedback(),
            DividerWidget(),
            _buildMyInbody(),
            DividerWidget(),
            _buildMyPhoto(context, MediaQuery.of(context).size),
            DividerWidget(),
            Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: 80,
                height: 44,
                margin: EdgeInsets.symmetric(vertical: 20, horizontal: 16),
                decoration: BoxDecoration(
                  color: AppColors.cmb_blue,
                  borderRadius: BorderRadius.all(Radius.circular(4.0)),
                ),
                child: TextButton(
                  onPressed: () {
                    Provider.of<WriteNaviViewModel>(context, listen: false)
                        .isFirstPage = true;
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      SvgPicture.asset(Assets.commNaviPrevIconPath),
                      SizedBox(width: 6),
                      Text(
                        COMMON_PREV_TXT,
                        style: TextStyle(
                            color: AppColors.cmb_grey[0],
                            fontWeight: FontWeight.w400),
                      ).tr(),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSelfFeedback() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '셀프 피드백',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Container(
            height: 120,
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            decoration: BoxDecoration(
                color: AppColors.cmb_grey[50],
                borderRadius: BorderRadius.all(Radius.circular(4)),
                border: Border.all(width: 1, color: AppColors.cmb_grey[100])),
            child: TextField(
              onTap: () {},
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: '오늘 운동 어떠셨나요? (500자 이내)',
                hintStyle:
                    TextStyle(fontSize: 16, color: AppColors.cmb_grey[200]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyInbody() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '마이 인바디',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: Container(
                  height: 54,
                  margin: const EdgeInsets.only(right: 8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: AppColors.cmb_grey[50],
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border:
                          Border.all(width: 1, color: AppColors.cmb_grey[100])),
                  child: Stack(
                    children: <Widget>[
                      Text(
                        '체중(kg)',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                      TextField(
                        onTap: () {},
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '0kg',
                          hintStyle: TextStyle(
                              fontSize: 16, color: AppColors.cmb_grey[200]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  height: 54,
                  margin: const EdgeInsets.only(right: 8.0),
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: AppColors.cmb_grey[50],
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border:
                          Border.all(width: 1, color: AppColors.cmb_grey[100])),
                  child: Stack(
                    children: <Widget>[
                      Text(
                        '골격근량(kg)',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                      TextField(
                        onTap: () {},
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '0kg',
                          hintStyle: TextStyle(
                              fontSize: 16, color: AppColors.cmb_grey[200]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Container(
                  width: 104,
                  height: 54,
                  padding: const EdgeInsets.all(8.0),
                  decoration: BoxDecoration(
                      color: AppColors.cmb_grey[50],
                      borderRadius: BorderRadius.all(Radius.circular(4)),
                      border:
                          Border.all(width: 1, color: AppColors.cmb_grey[100])),
                  child: Stack(
                    children: <Widget>[
                      Text(
                        '체지방량(kg)',
                        style: TextStyle(fontSize: 12),
                        textAlign: TextAlign.start,
                      ),
                      TextField(
                        onTap: () {},
                        textAlign: TextAlign.right,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: '0kg',
                          hintStyle: TextStyle(
                              fontSize: 16, color: AppColors.cmb_grey[200]),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMyPhoto(BuildContext context, Size size) {
    return Container(
      width: size.width,
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            '마이 눈바디',
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 4,
          ),
          Text(
            '최대 1장만 업로드 가능해요.',
            style: TextStyle(fontSize: 12, color: AppColors.cmb_grey[300]),
          ),
          SizedBox(
            height: 12,
          ),
          InkWell(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WritePhotoScreen()));
            },
            child: Container(
              width: 104,
              height: 104,
              padding: EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                color: AppColors.cmb_grey[50],
                borderRadius: BorderRadius.all(Radius.circular(4)),
              ),
              child: SvgPicture.asset(Assets.addBlueIconPath),
            ),
          ),
        ],
      ),
    );
  }
}
