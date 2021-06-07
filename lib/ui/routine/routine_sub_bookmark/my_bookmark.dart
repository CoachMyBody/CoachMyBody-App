class MyBookMark {
  String imageUrl;
  String title;
  List<String> tags;
  bool isSelected;

  MyBookMark({this.imageUrl, this.title, this.tags, this.isSelected = false});

  void toggleChecked() {
    isSelected = !isSelected;
  }
}
