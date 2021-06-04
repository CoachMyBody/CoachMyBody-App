import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/models/routine_exercise_detail.dart';
import 'package:flutter/material.dart';

class RoutineCreateExerciseDetailPage extends StatefulWidget {
  const RoutineCreateExerciseDetailPage({Key key}) : super(key: key);

  @override
  _RoutineCreateExerciseDetailPageState createState() => _RoutineCreateExerciseDetailPageState();
}

class _RoutineCreateExerciseDetailPageState extends State<RoutineCreateExerciseDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('운동상세 선택', textAlign: TextAlign.center,),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.search),
            iconSize: 28,
          )
        ]
      ),
      body: SafeArea(
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 8),
          child: Column(
            children: [
              SizedBox(height: 16,),
              WholeExerciseTypeWidget(),
              SizedBox(height: 20,),
              ExerciseListWidget(),
              SizedBox(height: 80,)
            ],
          ),
        ),
      ),
      floatingActionButton: Container(
        padding: EdgeInsets.symmetric(horizontal: 8),
        height: 52,
        width: MediaQuery.of(context).size.width,
        child: FloatingActionButton(
          onPressed: () {},
          backgroundColor: AppColors.cmb_accent[100],
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(0))),
          child: Text(
            '루틴에 추가하기',
            style: TextStyle(
                color: Colors.white,
                fontSize: 14,
                fontWeight: FontWeight.w500
            ),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}

class WholeExerciseTypeWidget extends StatefulWidget {
  const WholeExerciseTypeWidget({Key key}) : super(key: key);

  @override
  _WholeExerciseTypeWidgetState createState() => _WholeExerciseTypeWidgetState();
}

class _WholeExerciseTypeWidgetState extends State<WholeExerciseTypeWidget> {
  final _typeList = <String>['전체', '전신', '상체', '하체'];
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8),
      height: MediaQuery.of(context).size.height * 28 / 640,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: _typeList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              print(_typeList[index] + ' 눌림');
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              height: 28,
              padding: EdgeInsets.fromLTRB(16, 5, 16, 3),
              margin: EdgeInsets.fromLTRB(0, 0, 8, 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.transparent,
                  width: 1
                ),
                color: _selectedIndex == index ? AppColors.cmb_grey[700] : AppColors.cmb_grey[50]
              ),
              child: Text(
                _typeList[index],
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: _selectedIndex == index ? Colors.white : AppColors.cmb_grey[700]
                ),
              ),
            )
          );
        }
      ),
    );
  }
}

class ExerciseListWidget extends StatefulWidget {
  const ExerciseListWidget({Key key}) : super(key: key);

  @override
  _ExerciseListWidgetState createState() => _ExerciseListWidgetState();
}

class _ExerciseListWidgetState extends State<ExerciseListWidget> {
  final List<AssetImage> _imageList = <AssetImage>[AssetImage('assets/images/routine_testimg_1.png'), AssetImage('assets/images/routine_testimg_2.png'),
    AssetImage('assets/images/routine_testimg_3.png'), AssetImage('assets/images/routine_testimg_4.png')];

  final List<RoutineExerciseDetail> _routineExerciseDetailLists = [
    RoutineExerciseDetail(
        'assets/images/routine_testimg_1.png',
        '데드리프트',
        '15회·4세트',
        ['#헬스, #전신']
    ),
    RoutineExerciseDetail(
        'assets/images/routine_testimg_2.png',
        '벤치프레스',
        '15회·4세트',
        ['#헬스, #전신']
    ),
    RoutineExerciseDetail(
        'assets/images/routine_testimg_3.png',
        '스쿼트',
        '15회·4세트',
        ['#헬스, #전신']
    ),
    RoutineExerciseDetail(
        'assets/images/routine_testimg_4.png',
        '턱걸이',
        '15회·4세트',
        ['#헬스, #전신']
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView.builder(
          itemCount: _routineExerciseDetailLists.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            var isSelected = false;

            return Container(
              padding: EdgeInsets.symmetric(horizontal: 8),
              margin: EdgeInsets.only(bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 88,
                    child: Row(
                      children: [
                        Container(
                          height: 88,
                          width: 88,
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
                            children: [
                              Text(_routineExerciseDetailLists[index].exerciseName),
                              SizedBox(height: 4,),
                              Text(_routineExerciseDetailLists[index].exerciseSet),
                              SizedBox(height: 8,)
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  IconButton(
                    icon: _routineExerciseDetailLists[index].isSelected ? Icon(Icons.remove_circle, color: AppColors.cmb_accent[100],) : Icon(Icons.add_circle),
                    iconSize: 30,
                    onPressed: () {
                      setState(() {
                        _routineExerciseDetailLists[index].isSelected = !_routineExerciseDetailLists[index].isSelected;
                      });
                    }
                  )
                ],
              ),
            );
          }
      ),
    );
  }
}
