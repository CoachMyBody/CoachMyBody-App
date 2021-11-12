import 'package:coach_my_body/constants/assets.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/widgets/cmb_widgets/models/cmb_dropdown_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

// ignore: must_be_immutable
class CMBDropDownWithSheetWidget extends StatefulWidget {
  CMBDropDownWithSheetWidget({@required this.label, this.width = 100, @required this.data});

  ///
  /// label is shown the data on CMBDropDownButton
  ///
  String label;
  final double width;

  ///
  /// data is for Sheet Widget
  ///
  final CMBDropDownSheetData data;

  @override
  _CMBDropDownWithSheetWidgetState createState() => _CMBDropDownWithSheetWidgetState();
}

class _CMBDropDownWithSheetWidgetState extends State<CMBDropDownWithSheetWidget> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return TextButton(
      style: TextButton.styleFrom(
          padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
          backgroundColor: AppColors.cmb_grey[100],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(60.0)),
          )),
      onPressed: () {
        showModalBottomSheet(
            backgroundColor: Colors.transparent,
            isScrollControlled: true,
            context: context,
            builder: (_) => widget.data.sheet).whenComplete(
            widget.data.whenCompleted
        );
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Text(
              widget.label,
              style: TextStyle(
                  fontSize: size.width * 0.038,
                  color: AppColors.cmb_grey[700],
                  fontWeight: FontWeight.w400),
            ),
            SizedBox(
              width: 4,
            ),
            SvgPicture.asset(Assets.commDropDownIconPath)
          ],
        ),
      ),
    );
  }
}
