import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/providers/write/write_data_provider.dart';
import 'package:coach_my_body/providers/write/write_view_model.dart';
import 'package:coach_my_body/ui/write/write_second_step_photo.dart';
import 'package:coach_my_body/widgets/common_widgets.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

class WriteSecondStepScreen extends StatelessWidget {
  WriteSecondStepScreen({Key key}) : super(key: key);

  final _inbodyWeightCntrl = TextEditingController();
  final _inbodySmmCntrl = TextEditingController();
  final _inbodyBfmCntrl = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var writeDataProvider =
        Provider.of<WriteDataProvider>(context, listen: true);
    var inbodyDataProvider = Provider.of<InbodyDataProvider>(context, listen: true);
    var nunbodyDataProvider = Provider.of<NunbodyDataProvider>(context, listen: true);

    _inbodyWeightCntrl.addListener(() {
      if (true == _inbodyWeightCntrl.text.isEmpty) {
        return;
      }
      inbodyDataProvider.weight = int.parse(_inbodyWeightCntrl.text);
    });

    if (null != inbodyDataProvider.getWeight && 0 != inbodyDataProvider.getWeight) {
      _inbodyWeightCntrl.text = inbodyDataProvider.getWeight.toString();
    }

    _inbodySmmCntrl.addListener(() {
      if (true == _inbodySmmCntrl.text.isEmpty) {
        return;
      }
      inbodyDataProvider.smm = int.parse(_inbodySmmCntrl.text);
    });

    if (null != inbodyDataProvider.getSmm && 0 != inbodyDataProvider.getSmm) {
      _inbodySmmCntrl.text = inbodyDataProvider.getSmm.toString();
    }

    _inbodyBfmCntrl.addListener(() {
      if (true == _inbodyBfmCntrl.text.isEmpty) {
        return;
      }
      inbodyDataProvider.bfm = int.parse(_inbodyBfmCntrl.text);
    });

    if (null != inbodyDataProvider.getBfm && 0 != inbodyDataProvider.getBfm) {
      _inbodyBfmCntrl.text = inbodyDataProvider.getBfm.toString();
    }

    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SvgPicture.asset(
                'assets/images/write/second_step_frame.svg', // TODO
                width: MediaQuery.of(context).size.width,
              ),
              _buildSelfFeedbackWidget(),
              DividerWidget(),
              _buildMyInbodyWidget(),
              DividerWidget(),
              _buildMyPhotoWidget(context, MediaQuery.of(context).size),
              DividerWidget(),
              FlatNaviButton(
                bSelected: true,
                bShowNext: false,
                callback: () {
                  Provider.of<WriteNaviViewModel>(context, listen: false)
                      .isFirstPage = true;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSelfFeedbackWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            RECORD_SUB_STATISTICS_SELF_FEEDBACK_TXT,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ).tr(),
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
                hintText: tr(WRITE_SECOND_STEP_FEEDBACK_HINT),
                hintStyle:
                    TextStyle(fontSize: 16, color: AppColors.cmb_grey[200]),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildMyInbodyWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 20,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            RECORD_SUB_STATISTICS_MYINBODY_TXT,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ).tr(),
          SizedBox(
            height: 8,
          ),
          Row(
            children: <Widget>[
              OutlinedTextField(
                  label: tr(WRITE_SECOND_STEP_WEIGHT_TXT),
                  hint: tr(WRITE_SECOND_STEP_WEIGHT_HINT),
                  controller: _inbodyWeightCntrl),
              SizedBox(
                width: 8.0,
              ),
              OutlinedTextField(
                  label: tr(WRITE_SECOND_STEP_SMM_TXT),
                  hint: tr(WRITE_SECOND_STEP_SMM_HINT),
                  controller: _inbodySmmCntrl),
              SizedBox(
                width: 8.0,
              ),
              OutlinedTextField(
                  label: tr(WRITE_SECOND_STEP_PBF_TXT),
                  hint: tr(WRITE_SECOND_STEP_PBF_HINT),
                  controller: _inbodyBfmCntrl),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildMyPhotoWidget(BuildContext context, Size size) {
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
            RECORD_SUB_STATISTICS_MYPHOTOS_TXT,
            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          ).tr(),
          SizedBox(
            height: 4,
          ),
          Text(
            WRITE_SECOND_STEP_MYPHOTOS_DESC,
            style: TextStyle(fontSize: 12, color: AppColors.cmb_grey[300]),
          ).tr(),
          SizedBox(
            height: 12,
          ),
          PlusDataContainer(
            callback: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => WritePhotoScreen()));
            },
            label: tr(WRITE_SECOND_STEP_ADD_PHOTO),
          ),
        ],
      ),
    );
  }
}
