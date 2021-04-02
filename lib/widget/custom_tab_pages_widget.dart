import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

///
/// [Description]
/// This CustomTabPageView widget requires three parameters, the remaining four are optional.
///
/// [Example]
/// final List<String> _pageNames = [
///   'Customization',
///   'TheTabBar'
/// ];
///
/// final List<Widget> _pages = [
///   Customization(),
///   TheTabBar(),
/// ];
///
/// CustomTabPageView(
///   pages: _pages,
///   pageNum: _pages.length,
///   pageNames: _pageNames,
/// ),
///

class CustomTabPageView extends StatefulWidget {
  CustomTabPageView({
    @required this.pages,
    @required this.pageNum,
    @required this.pageNames,
  })  : this.titleStyle = TextStyle(fontSize: 30.0, color: Colors.black45),
        this.activeTitleStyle = TextStyle(fontSize: 30.0, color: Colors.black),
        this.tabTop = 10.0,
        this.tabLeft = 20.0 {
    assert(pages.length > 0);
    assert(pageNames.length > 0);
    assert(pages.length == pageNum);
    assert(pages.length == pageNames.length);
  }

  /// List of pages which will be showed with tab
  /// The number of this list should be same with pagesNum.
  final List<Widget> pages;

  /// List of pageNames which will be showed as title of each tab page
  /// The number of this list should be same with pagesNum.
  final List<String> pageNames;

  /// This parameter let know the number of pages
  /// and let users double check the parameters whether they use properly or not.
  /// The value of pageNum should be same with pages.length and pageNames.length
  final int pageNum;

  /// If users call Constructor with TextStyle in titleStyle, they change the tab title color.
  /// The default value of tab color is Colors.black45.
  final TextStyle titleStyle;

  /// This parameter is used to indicate the active tab title.
  /// If users call Constructor with TextStyle in activeTitleStyle,
  /// they change the active tab title color.
  /// The default value of tab color is Colors.black.
  final TextStyle activeTitleStyle;

  /// These two parameters is used for the point(x, y) indicating the starting position of tab titles.
  /// The default position is (20, 10)
  final double tabTop;
  final double tabLeft;

  @override
  _CustomTabPageViewState createState() => _CustomTabPageViewState();
}

class _CustomTabPageViewState extends State<CustomTabPageView> {
  //
  // PageController for CMBTabBar
  //
  PageController _pageController = PageController(initialPage: 0);

  //
  // Current page's indicator variable
  //
  double _currPagePosition = 0;

  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        // Page position for Current page's indicator
        // 0.0 ~ (N-1).0
        _currPagePosition = _pageController.page;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Stack(
        children: <Widget>[
          PageView(
            controller: _pageController,
            children: widget.pages,
          ),
          Positioned(
            left: widget.tabLeft,
            top: widget.tabTop,
            child: _buildTabTitle(),
          ),
          Positioned(
              top: widget.tabTop,
              child: _buildTabUnderLine(_currPagePosition, widget.pageNum)),
        ],
      ),
    );
  }

  //
  // Calculate each title's size
  //
  List<Size> _calTitleSize(List<String> titles, TextStyle style) {
    if (titles.length == 0 || null == style) {
      assert(null != "Input parameters are invalid");
    }

    List<Size> sizes = [];

    for (int i = 0; i < titles.length; i++) {
      final TextPainter textPainter = TextPainter(
          text: TextSpan(text: titles[i], style: style),
          maxLines: 1,
          textDirection: TextDirection.ltr)
        ..layout(minWidth: 0, maxWidth: double.infinity);

      sizes.add(textPainter.size);
    }

    if (0 == sizes.length) {
      assert(0 != sizes.length);
    }

    return sizes;
  }

  //
  // Drawing Tab titles
  //
  Widget _buildTabTitle() {
    List<Widget> titles = [];

    for (int i = 0; i < widget.pageNum; i++) {
      titles.add(TextButton(
        style: TextButton.styleFrom(primary: Colors.white),
        child: Text(
          widget.pageNames[i],
          style: (_currPagePosition.round() == i)
              ? widget.activeTitleStyle
              : widget.titleStyle,
        ),
        onPressed: () {
          _pageController.animateToPage(i,
              duration: Duration(milliseconds: 300), curve: Curves.ease);
        },
      ));
    }

    if (0 == titles.length) {
      assert(0 != titles.length);
    }

    return Row(
      children: titles,
    );
  }

  Widget _buildTabUnderLine(double pos, int num) {
    List<Size> sizes = _calTitleSize(widget.pageNames, widget.titleStyle);

    return CustomPaint(
        painter: CustomTabUnderLine(
            position: pos,
            number: num,
            sizes: sizes,
            top: widget.tabTop,
            left: widget.tabLeft));
  }
}

class CustomTabUnderLine extends CustomPainter {
  final double position;
  final int number;
  final List<Size> sizes;
  final double top;
  final double left;

  List<Offset> _offesets = [];
  double _underLineLeft;

  static const double _underLineHeight = 3;

  CustomTabUnderLine(
      {this.position, this.number, this.sizes, this.top, this.left}) {
    assert(0 != sizes.length);

    _underLineLeft = this.left + 10;

    int ret = _initOffsets();
    if (0 != ret) {
      assert(0 == ret);
    }
  }

  int _initOffsets() {
    double prevOffsetX = _underLineLeft;
    double prevWidth = 0.0;

    for (int i = 0; i < number; i++) {
      assert(0 != sizes[i].width);

      double currOffsetX = 0.0;
      double currOffsetY = 0.0;
      double currWidth = sizes[i].width;

      currOffsetX = prevOffsetX +
          prevWidth / 2 +
          currWidth / 2 +
          i * left;
      currOffsetY = sizes[i].height + top;

      _offesets.add(Offset(currOffsetX, currOffsetY));

      prevOffsetX = currOffsetX;
      prevWidth = currWidth;
    }

    if (0 == _offesets.length) {
      assert(0 != _offesets.length);
      return -1;
    }

    return 0;
  }

  @override
  void paint(Canvas canvas, Size size) {
    for (int i = 0; i < number; i++) {
      //
      // tab underline draw
      //
      canvas.drawRRect(
          RRect.fromRectAndRadius(
              Rect.fromCenter(
                  center: _offesets[i],
                  width: sizes[i].width,
                  height: _underLineHeight),
              Radius.circular(15)),
          Paint()
            ..color = Colors.black.withOpacity(0.5)
            ..style = PaintingStyle.fill);
    }

    //
    // current tab underline draw
    //
    int floorPos = position.floor(); // 내림
    int ceilPos = position.ceil();
    int roundPos = position.round(); // 반올림

    double currWidth = sizes[floorPos].width;
    double cursorX = 0.0;
    double cursorY = sizes[roundPos].height + top;

    if (0 != (position - floorPos)) {
      currWidth = (1 - (position - roundPos).abs()) * sizes[roundPos].width;
      cursorX = _offesets[floorPos].dx +
          (_offesets[ceilPos].dx - _offesets[floorPos].dx) *
              (position - floorPos);
    } else {
      cursorX = _offesets[roundPos].dx;
    }

    canvas.drawRRect(
        RRect.fromRectAndRadius(
            Rect.fromCenter(
                center: Offset(cursorX, cursorY),
                width: (cos(position.abs() * pi)) * currWidth,
                height: _underLineHeight),
            Radius.circular(15)),
        Paint()
          ..color = Colors.black
          ..style = PaintingStyle.fill);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}
