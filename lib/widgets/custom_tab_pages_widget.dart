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

class CustomTabPageView extends StatelessWidget {
  CustomTabPageView({
    @required this.title,
    @required this.pages,
    @required this.pageNum,
    @required this.pageNames,
  })  : this.titleTextStyle = TextStyle(color: Colors.black),
        this.titleBackgroundColor = Colors.white,
        this.labelColor = Colors.black,
        this.indicatorColor = Colors.black {
    assert(null != title && "" != title);
    assert(pages.length > 0);
    assert(pageNames.length > 0);
    assert(pages.length == pageNum);
    assert(pages.length == pageNames.length);
  }

  /// Title of tab page
  final String title;

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

  /// If users call Constructor with TextStyle in titleStyle,
  /// they change the tab title color.
  /// The default value of tab color is Colors.black.
  final TextStyle titleTextStyle;

  /// This parameter is used to set the AppBar background color.
  /// The default value is Colors.white.
  final Color titleBackgroundColor;

  /// Calling Constructor with Color in labelColor,
  /// it can be changed the label text color.
  /// The default value of tab color is Colors.black.
  final Color labelColor;

  /// This parameter is used to set the active tab indicator.
  /// If users call Constructor with Color in indicatorColor, they change the active indicator's color.
  /// The default value of color is Colors.black.
  final Color indicatorColor;

  List<Tab> _buildTabTitleList() {
    List<Tab> tabTitle = [];

    for (int i = 0; i < pageNum; i++) {
      assert(null != pageNames[i] && "" != pageNames[i]);
      tabTitle.add(Tab(text: pageNames[i]));
    }

    if (0 == tabTitle.length) {
      assert(0 != tabTitle.length);
    }
    return tabTitle;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: pageNum,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          backgroundColor: titleBackgroundColor,
          elevation: 0.3,
          title: Text(
            title,
            style: titleTextStyle,
          ),
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(30.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: TabBar(
                isScrollable: true,
                indicatorColor: indicatorColor,
                labelColor: labelColor,
                tabs: _buildTabTitleList(),
              ),
            ),
          ),
        ),
        body: TabBarView(
          children: pages,
          physics: NeverScrollableScrollPhysics(),
        ),
      ),
    );
  }
}
