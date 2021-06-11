import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/models/routine_exercise_detail.dart';
import 'package:flutter/material.dart';

class RoutineSubMyroutinesDetailList extends StatefulWidget {
  final String text;
  final Function route;

  const RoutineSubMyroutinesDetailList({Key key, @required this.text, @required this.route}) : super(key: key);

  @override
  _RoutineSubMyroutinesDetailListState createState() => _RoutineSubMyroutinesDetailListState();
}

class _RoutineSubMyroutinesDetailListState extends State<RoutineSubMyroutinesDetailList> {
  final List<RoutineExerciseDetail> _routineExerciseDetailLists = [
    RoutineExerciseDetail(
        'assets/images/routine_testimg_1.png',
        '데드리프트',
        '15회·4세트',
        ['#헬스, #전신']
    ),
    RoutineExerciseDetail(
        'assets/images/routine_testimg_3.png',
        '스쿼트',
        '15회·4세트',
        ['#헬스, #전신']
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: _routineExerciseDetailLists.length,
        shrinkWrap: true,
        itemBuilder: (context, index) {
          var isSelected = false;

          return Container(
            padding: EdgeInsets.symmetric(horizontal: 16),
            margin: EdgeInsets.only(bottom: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 88,
                  child: Row(
                    children: [
                      Container(
                        height: 75,
                        width: 75,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(_routineExerciseDetailLists[index].imageURL),
                                fit: BoxFit.fill
                            ),
                            borderRadius: BorderRadius.all(Radius.circular(8))
                        ),
                      ),
                      SizedBox(width: 12,),
                      Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(_routineExerciseDetailLists[index].exerciseName, style: TextStyle(color: AppColors.cmb_grey[400], fontSize: 12, fontWeight: FontWeight.w400),),
                            SizedBox(height: 4,),
                            Text(_routineExerciseDetailLists[index].exerciseSet, style: TextStyle(color: AppColors.cmb_grey[700], fontSize: 16, fontWeight: FontWeight.w400),),
                            SizedBox(height: 8,)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                Text(
                  '수정',
                  style: TextStyle(
                      fontSize: 14,
                      color: AppColors.cmb_grey[700],
                      fontWeight: FontWeight.w400
                  ),
                )
              ],
            ),
          );
        }
    );
  }
}




class MyExercise {
  int index;
  String imageUrl;
  String name;
  int full_count;
  int full_set;
  String hashtag;

  MyExercise(
      {this.index,
      this.imageUrl,
      this.name,
      this.full_count,
      this.full_set,
      this.hashtag});
}

List myExerciseList = [
  MyExercise(
      index: 0,
      imageUrl: 'assets/images/routine_testimg_4.png',
      name: '데드리프트',
      full_count: 15,
      full_set: 4,
      hashtag: '#헬스 #전신'),
];
