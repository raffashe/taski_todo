import 'package:flutter_test/flutter_test.dart';
import 'package:taski_todo/data/viewmodel/search_input_viewmodel.dart';
import 'package:taski_todo/data/models/search_input_model.dart';

void main() {
  group('SearchInputViewModel Tests', () {
    late SearchInputViewModel searchInputViewModel;

    setUp(() {
      final searchInputModel = SearchInputModel();
      searchInputViewModel = SearchInputViewModel(searchInputModel);
    });

    test('should update text correctly', () {
      searchInputViewModel.updateText('New search text');

      expect(searchInputViewModel.text, 'New search text');
    });

    test('should clear text correctly', () {
      searchInputViewModel.updateText('Search text');
      searchInputViewModel.clearText();

      expect(searchInputViewModel.text, '');
    });
  });
}
