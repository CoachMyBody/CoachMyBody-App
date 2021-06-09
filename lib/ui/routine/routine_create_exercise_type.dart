import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/ui/routine/routine_create_exercise_detail.dart';
import 'package:flutter/material.dart';

String exerciseName;

class RoutineCreateExerciseTypePage extends StatefulWidget {
  const RoutineCreateExerciseTypePage({Key key}) : super(key: key);

  @override
  _RoutineCreateExerciseTypePageState createState() => _RoutineCreateExerciseTypePageState();
}

class _RoutineCreateExerciseTypePageState extends State<RoutineCreateExerciseTypePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('운동종목 선택', textAlign: TextAlign.center,),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => RoutineCreateExerciseDetailPage(exerciseName: exerciseName))
              );
            },
            child: Text(
              '다음',
              style: TextStyle(
                color: AppColors.cmb_accent[100],
                fontWeight: FontWeight.w400
              ),
            ),
          ),
        ]
      ),
      body: SafeArea(
        child: SelectExerciseTypeWidget()
      ),
    );
  }
}

class SelectExerciseTypeWidget extends StatefulWidget {
  const SelectExerciseTypeWidget({Key key}) : super(key: key);

  @override
  _SelectExerciseTypeWidgetState createState() => _SelectExerciseTypeWidgetState();
}

class _SelectExerciseTypeWidgetState extends State<SelectExerciseTypeWidget> {
  final List<String> _typeNameList = <String>['헬스', '필라테스', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE', 'NONE'];
  final List<AssetImage> _imageList = <AssetImage>[AssetImage('assets/images/routine_testimg_1.png'), AssetImage('assets/images/routine_testimg_2.png'),
    AssetImage('assets/images/routine_testimg_3.png'), AssetImage('assets/images/routine_testimg_4.png')];

  int _selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(height: 4,),
          Expanded(
            child: GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: MediaQuery.of(context).size.width /
                    (MediaQuery.of(context).size.height / 2.5),
                mainAxisSpacing: 16.0,
                crossAxisSpacing: 8.0,
              ),
              itemCount: 8,
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: () {
                    setState(() {
                      _selectedIndex = index;
                      exerciseName = _typeNameList[index];
                    });
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: _imageList[index % 4],
                        fit: BoxFit.cover,
                        colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.8), BlendMode.dstATop),
                      ),
                      borderRadius: BorderRadius.circular(8)
                    ),
                    child: Stack(
                      children: [
                        _selectedIndex == index
                          ? Align(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: AppColors.cmb_accent[100].withOpacity(0.8),
                            ),
                          )
                        )
                          : Container(),
                        _selectedIndex == index
                          ? Align(
                          alignment: Alignment.topRight,
                          child: Padding(
                            padding: EdgeInsets.all(8),
                            child: Icon(
                              Icons.check_circle,
                              color: Colors.white,
                            ),
                          ),
                        )
                          : Container(),
                        Align(
                          alignment: Alignment.center,
                          child: Text(
                            _typeNameList[index],
                            style: TextStyle(
                                color: AppColors.cmb_grey[0],
                                fontWeight: FontWeight.w500,
                                fontSize: 18
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              }
            )
          )
        ],
      ),
    );
  }
}

