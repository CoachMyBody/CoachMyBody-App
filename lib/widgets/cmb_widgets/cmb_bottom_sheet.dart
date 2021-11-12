import 'package:coach_my_body/widgets/cmb_widgets/models/cmb_dropdown_model.dart';
import 'package:coach_my_body/constants/colors.dart';
import 'package:flutter/material.dart';

class CMBBottomSheet extends StatelessWidget {
  const CMBBottomSheet(
      {Key key,
      this.bHandle = true,
      this.bBottomButton = true,
      this.buttonData,
      this.child})
      : super(key: key);

  final bool bHandle;
  final bool bBottomButton;
  final Widget child;

  final CMBBottomSheetButtonData buttonData;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(16.0),
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        color: AppColors.cmb_grey[0],
        borderRadius: const BorderRadius.all(Radius.circular(8.0)),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          if (true == bHandle) _buildHandle(context),
          if (null != child) child,
          if (true == bBottomButton)
            CMBBottomSheetButton(
              data: (null != buttonData)
                  ? buttonData
                  : CMBBottomSheetButtonData(),
            ),
        ],
      ),
    );
  }

  Widget _buildHandle(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.25,
      child: Container(
        margin: const EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        child: Container(
          height: 5.0,
          decoration: BoxDecoration(
            color: AppColors.cmb_grey[100],
            borderRadius: const BorderRadius.all(Radius.circular(2.5)),
          ),
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class CMBBottomSheetButton extends StatelessWidget {
  CMBBottomSheetButton({this.data});

  final CMBBottomSheetButtonData data;

  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.all(16.0),
      width: _width * 0.911,
      height: _width * 0.144,
      decoration: BoxDecoration(
        color: data.isEnable ? AppColors.cmb_blue : AppColors.cmb_grey[200],
        borderRadius: const BorderRadius.all(Radius.circular(4.0)),
      ),
      child: TextButton(
        onPressed: false == data.isEnable || null == data.onPressed
            ? null
            : data.onPressed,
        child: Text(
          data.label,
          style: TextStyle(color: AppColors.cmb_grey[0]),
        ),
      ),
    );
  }
}
