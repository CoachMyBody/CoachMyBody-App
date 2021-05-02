import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class Badge extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Center(child: Text(tr(BADGE))),
            actions: [
              IconButton(
                  icon: Icon(Icons.close),
                  onPressed: () {
                    Navigator.pop(context);
                  })
            ],
            elevation: 1.0),
        body: Center(
          child: Column(
            children: [
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 80.0),
                width: 179.0,
                height: 179.0,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    border:
                        Border.all(color: AppColors.cmb_grey[300], width: 1.0)),
                child: Icon(Icons.lock,
                    color: AppColors.cmb_grey[300], size: 36.0),
              ),
              SizedBox(height: 20.0),
              Text('?? 뱃지', style: TextStyle(color: AppColors.cmb_grey[400])),
              SizedBox(height: 12.0),
              Text('3일 연속으로 루틴을 기록해보세요!',
                  style: TextStyle(color: AppColors.cmb_grey[400])),
              Text('새로운 뱃지를 획득할 수 있어요.',
                  style: TextStyle(color: AppColors.cmb_grey[400]))
            ],
          ),
        ));
  }
}
