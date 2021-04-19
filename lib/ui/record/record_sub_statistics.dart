import 'package:coach_my_body/constants/colors.dart';
import 'package:coach_my_body/widgets/custom_tab_pages_widget.dart';
import 'package:flutter/material.dart';

class RecordSubStatisticsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
          color: AppColors.cmb_grey[0],
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  // TODO: Dropdown button
                  '인바디 변화',
                  style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
                ),
              ),
              _buildInbodyTab(),
            ],
          )),
    );
  }

  Widget _buildInbodyTab() {
    return DefaultTabController(
      length: 1,
      initialIndex: 0,
      child: Container(
        padding: EdgeInsets.all(5.0),
        child: Column(
          children: <Widget>[
            CustomTabWidget(
              pages: [
                CMBPages(
                  page: Text('1234'),
                  pageName: '체중',
                ),
                CMBPages(
                  page: Text('134'),
                  pageName: '골격근량',
                ),
                CMBPages(
                  page: Text('12345678'),
                  pageName: '체지방량',
                ),
              ],
              pageNum: 3,
              height: 200.0,
            ),
          ],
        ),
      ),
    );
  }
}
