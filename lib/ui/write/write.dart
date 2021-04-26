import 'package:flutter/material.dart';
import 'package:flutter_time_picker_spinner/flutter_time_picker_spinner.dart';

// ignore: must_be_immutable
class WriteScreen extends StatefulWidget {
  List<Container> items;

  WriteScreen() {
    items = List<Container>.generate(100, (index) {
      return boxItem(index);
    });
  }

  var _checkvalue = false;

  boxItem(int index) {
    return Container(
        height: 100,
        width: 100,
        margin: EdgeInsets.symmetric(horizontal: 3),
        decoration: BoxDecoration(
            borderRadius: new BorderRadius.circular(10.0),
            color: (index % 3 == 0)
                ? Colors.red
                : (index % 3 == 1)
                    ? Colors.blue
                    : Colors.orange),
        alignment: Alignment(0, 0),
        child: GestureDetector(
          onTap: () {
            print(
              "운동루틴 $index",
            );
          },
          child: Column(
            children: [
              Container(
                alignment: Alignment.topRight,
                child: Checkbox(
                  value: _checkvalue,
                  onChanged: (value) => {print('hi')},
                ),
              ),
              Text(
                "운동루틴 $index",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
        ));
  }

  @override
  _WriteScreenState createState() => _WriteScreenState();
}

class _WriteScreenState extends State<WriteScreen> {
  var _dateTime = DateTime.now();
  var _routineCheck = false;

  TextEditingController selfFeedbackController = TextEditingController();

  @override
  void dispose() {
    selfFeedbackController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
  }

  void _showDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // return object of type Dialog
        return AlertDialog(
          title: new Text("Alert Dialog title"),
          content: new Text("Alert Dialog body"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Close"),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        );
      },
    );
  }

  Color getColor() {
    if (!_routineCheck) {
      return Colors.black26;
    } else {
      return Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          '기록하기',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        actions: <Widget>[
          Padding(
              padding: EdgeInsets.only(top: 22, bottom: 20, right: 20),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Text('닫기',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    )),
              )),
          Padding(
              padding:
                  EdgeInsets.only(top: 22, bottom: 20, right: 20, left: 20),
              child: GestureDetector(
                onTap: () {},
                child: Text('저장',
                    style: TextStyle(
                        color: getColor(), fontWeight: FontWeight.bold)),
              )),
        ],
        automaticallyImplyLeading: false,
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
            padding: EdgeInsets.only(left: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // 운동루틴
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      child: Text(
                        '운동루틴',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.only(top: 30, bottom: 10),
                    ),
                    Container(
                      height: 100,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        // shrinkWrap: false,
                        itemCount: widget.items.length,
                        itemBuilder: (context, index) {
                          return widget.items[index];
                        },
                      ),
                    )
                  ],
                ),
                // 운동시간
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      child: Text(
                        '운동시간',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.only(top: 30, bottom: 10),
                    ),
                    Container(
                        margin: EdgeInsets.only(right: 10),
                        decoration: BoxDecoration(
                            borderRadius: new BorderRadius.circular(10.0),
                            color: Colors.black12),
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              _routineCheck = !_routineCheck;
                            });
                            _showDialog();
                          },
                          child: SizedBox(
                            height: 82,
                            width: 500,
                            child: Text('시간\t\t분'),
                          ),
                        )
                        // TimePickerSpinner(
                        //   // is24HourMode: false,
                        //   normalTextStyle:
                        //       TextStyle(fontSize: 24, color: Colors.black26),
                        //   highlightedTextStyle: TextStyle(
                        //       fontSize: 24,
                        //       color: Colors.black26,
                        //       fontWeight: FontWeight.bold),
                        //   spacing: 20,
                        //   itemHeight: 50,
                        //   isForce2Digits: true,
                        //   onTimeChange: (time) {
                        //     setState(() {
                        //       _dateTime = time;
                        //     });
                        //     print(_dateTime);
                        //   },
                        // ),
                        ),
                  ],
                ),
                // 셀프 피드백
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      child: Text(
                        '셀프 피드백',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.only(top: 30, bottom: 10),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 10),
                      decoration: BoxDecoration(
                          borderRadius: new BorderRadius.circular(10.0),
                          color: Colors.black12),
                      child: SizedBox(
                        height: 120,
                        width: 500,
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          child: TextFormField(
                            scrollPadding: EdgeInsets.symmetric(horizontal: 10),
                            // textInputAction: TextInputAction.newline,
                            keyboardType: TextInputType.multiline,
                            controller: selfFeedbackController,
                            maxLines: 7,
                            validator: (value) {
                              if (value.length >= 500) {
                                return '500자 이내로 입력해주세요.';
                              } else {
                                return null;
                              }
                            },
                            decoration: InputDecoration(
                              border: InputBorder.none,
                              hintText: '오늘 운동 어땠나요? (500자 이내)',
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                // 인바디 기록
                Column(
                  children: [
                    Padding(
                      child: Text(
                        '인바디 기록',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.only(top: 30),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 5),
                      child: ElevatedButton(
                        style: TextButton.styleFrom(
                          primary: Colors.white,
                          minimumSize: Size(91, 42),
                          backgroundColor: Colors.black54,
                          padding: EdgeInsets.symmetric(horizontal: 16.0),
                          shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(5.0)),
                          ),
                        ),
                        onPressed: () {},
                        child: Text('추가하기'),
                      ),
                    )
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      child: Text(
                        '눈바디 기록',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      ),
                      padding: EdgeInsets.only(top: 30, bottom: 10),
                    ),
                    Row(
                      children: [
                        Container(
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                                borderRadius: new BorderRadius.circular(10.0),
                                color: Colors.black12),
                            child: GestureDetector(
                              onTap: () {
                                _showDialog();
                              },
                              child: Container(
                                height: 104,
                                width: 104,
                                child: Center(
                                  child: Text(
                                    '+',
                                    style: TextStyle(fontSize: 30),
                                  ),
                                ),
                              ),
                            )),
                      ],
                    ),
                  ],
                )
              ],
            )),
      ),
    );
  }
}
