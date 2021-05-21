import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/constants/translations_key.dart';
import 'package:coach_my_body/providers/record/record_date_model.dart';
import 'package:coach_my_body/routes.dart';
import 'package:coach_my_body/ui/record/record_sub_routines_detail.dart';
import 'package:coach_my_body/ui/record/routine_data.dart';
import 'package:coach_my_body/widgets/day_modal_bottom_sheet.dart';
import 'package:coach_my_body/widgets/custom_drop_down_widget.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

///
/// Daily Routines View
///
// ignore: must_be_immutable
class RecordSubDailyRoutines extends StatelessWidget {
  Size _size;

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          height: _size.width * 0.072,
        ),
        Padding(
          padding: EdgeInsets.only(left: _size.width * 0.0444),
          child: Consumer<SelectedDateViewModel>(builder: (_, selected, child) {
            var viewedDate = selected.getReturnedDate().month.toString() +
                COMMON_MONTH_TXT.tr() +
                COMMON_YEAR_MONTH_DIVIDER_TXT.tr() +
                selected.getReturnedDate().day.toString() +
                COMMON_DAY_TXT.tr();
            assert(viewedDate.isNotEmpty);

            return CustomDropDownWidget(
              label: viewedDate,
              onPressed: () {
                showModalBottomSheet(
                    backgroundColor: Colors.transparent,
                    isScrollControlled: true,
                    context: context,
                    builder: (_) => DayModalBottomSheet());
              },
            );
          }),
        ),
        Padding(
          padding: EdgeInsets.only(left: _size.width * 0.0555, top: 12),
          child: _buildDailyRoutinesTxt(routines: routines),
        ),
        SizedBox(
          height: _size.height * 0.26,
        ),
        Padding(
          padding: EdgeInsets.only(left: _size.width * 0.0444),
          child: SizedBox(
            height: _size.width * 0.3,
            child: DailyRoutinesView(routines: routines),
          ),
        ),
      ],
    );
  }

  Widget _buildDailyRoutinesTxt({@required List routines}) {
    String routinesNum = RECORD_SUB_ROUTINES_TODAY_PREFIX_TXT.tr() +
        ' ' +
        routines.length.toString();
    assert(routinesNum.isNotEmpty);

    return RichText(
      text: TextSpan(
        style: TextStyle(
            color: AppColors.cmb_grey[700], fontSize: _size.width * 0.0667),
        children: <TextSpan>[
          TextSpan(
              text: routinesNum, style: TextStyle(fontWeight: FontWeight.bold)),
          TextSpan(text: RECORD_SUB_ROUTINES_TODAY_SUFFIX_TXT.tr()),
        ],
      ),
    );
  }
}

class DailyRoutinesView extends StatelessWidget {
  DailyRoutinesView({@required List routines});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return routines.isEmpty
        ? _buildEmptyItem(context, size)
        : ListView.builder(
            shrinkWrap: false,
            scrollDirection: Axis.horizontal,
            itemCount: routines.length, // TODO: Server API
            itemBuilder: (BuildContext context, int index) =>
                RecordRoutineListItem(routine: routines[index]));
  }

  Widget _buildEmptyItem(BuildContext context, Size size) {
    return Container(
      width: size.width * 0.6,
      height: size.width * 0.35,
      child: Padding(
        padding: EdgeInsets.only(left: 8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              RECORD_SUB_ROUTINES_EMPTY_TXT,
              style: TextStyle(fontSize: 16.0),
            ).tr(),
            SizedBox(
              height: 12.0,
            ),
            Container(
              width: size.width * 0.331,
              height: size.width * 0.116,
              decoration: BoxDecoration(
                color: AppColors.cmb_blue,
                borderRadius: BorderRadius.all(Radius.circular(4.0)),
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pushNamed(Routes.write);
                },
                child: Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: AppColors.cmb_grey[0],
                      size: 14,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Text(RECORD_SUB_ROUTINES_WRITE_BTN_TXT,
                            style: TextStyle(
                                fontSize: 14.0, color: AppColors.cmb_grey[0]))
                        .tr(),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ignore: must_be_immutable
class RecordRoutineListItem extends StatelessWidget {
  RecordRoutineListItem({@required this.routine}) {
    assert(null != routine);
    assert(routine.name.isNotEmpty);
    assert(routine.date.isNotEmpty);
  }

  final RoutineData routine;

  double _width;

  @override
  Widget build(BuildContext context) {
    _width = MediaQuery.of(context).size.width;

    return Hero(
      tag: routine.date,
      child: Align(
        alignment: Alignment.topLeft,
        child: SizedBox(
          width: _width * 0.755,
          height: _width * 0.25,
          child: Card(
            elevation: 6,
            shape: RoundedRectangleBorder(
                borderRadius:
                    BorderRadius.vertical(bottom: Radius.circular(8.0))),
            child: InkWell(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) {
                  assert(null != routine);
                  return RecordDetailScreen(routine: routine);
                }));
              },
              child: _buildItem(),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildItem() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          width: _width * 0.1333,
          height: _width * 0.2555,
          child: ClipRRect(
            borderRadius: BorderRadius.horizontal(left: Radius.circular(8.0)),
            child: Image.asset(
              routine.image,
              fit: BoxFit.cover,
            ),
          ),
        ),
        Expanded(
          child: Center(
            child: Container(
              width: _width * 0.5555,
              height: _width * 0.1666,
              child: Stack(
                children: <Widget>[
                  Positioned(
                    left: 0,
                    top: 0,
                    child: SizedBox(
                      width: _width * 0.3777,
                      child: Text(
                        routine.name,
                        style: TextStyle(
                            color: AppColors.cmb_grey[600],
                            fontSize: _width * 0.0388,
                            fontWeight: FontWeight.w600),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ),
                  Positioned(
                    left: 0,
                    bottom: 0,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Icon(
                          Icons.mode_comment_outlined,
                          size: _width * 0.038,
                          color: AppColors.cmb_grey[400],
                        ),
                        Text(
                          routine.convertIsFeedbackToString(),
                          style: TextStyle(
                              color: AppColors.cmb_grey[400],
                              fontSize: _width * 0.0333,
                              fontWeight: FontWeight.w300),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        width: _width * 0.1777,
                        height: _width * 0.0555,
                        decoration: BoxDecoration(
                          color: AppColors.cmb_grey[100],
                          borderRadius: BorderRadius.all(Radius.circular(4.0)),
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          routine.convertMinToString(),
                          style: TextStyle(
                              color: AppColors.cmb_grey[700],
                              fontSize: _width * 0.0277),
                        ),
                      )),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
