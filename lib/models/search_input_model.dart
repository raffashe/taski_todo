class SearchInputModel {
  String text;

  SearchInputModel({this.text = ''});

  void clearText() {
    text = '';
  }

  void updateText(String newText) {
    text = newText;
  }
}
