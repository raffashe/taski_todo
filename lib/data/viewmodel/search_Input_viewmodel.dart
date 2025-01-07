import 'package:flutter/material.dart';
import '../models/search_input_model.dart';

class SearchInputViewModel extends ChangeNotifier {
  final SearchInputModel _model;

  SearchInputViewModel(this._model);

  String get text => _model.text;

  void updateText(String newText) {
    _model.updateText(newText);
    notifyListeners();
  }

  void clearText() {
    _model.clearText();
    notifyListeners();
  }
}
