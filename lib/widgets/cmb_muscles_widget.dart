import 'package:coach_my_body/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AnteriorMuscles extends StatelessWidget {
  const AnteriorMuscles({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Stack(
        children: <Widget>[
          SvgPicture.asset(
            Assets.musclesAntImgPath,
            width: size.width * 0.246,
          ),
          SvgPicture.asset(
            Assets.activePecMajorImgPath,
            width: size.width * 0.246,
          ),
          SvgPicture.asset(
            Assets.activeDeltoidImgPath,
            width: size.width * 0.246,
          ),
          SvgPicture.asset(
            Assets.activeQuadFemorisImgPath,
            width: size.width * 0.246,
          )
        ],
      ),
    );
  }
}

class PosteriorMuscles extends StatelessWidget {
  const PosteriorMuscles({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
      child: Stack(
        children: <Widget>[
          SvgPicture.asset(
            Assets.musclesPostImgPath,
            width: size.width * 0.246,
          ),
        ],
      ),
    );
  }
}
