import 'dart:convert';

import 'package:quiz_game/features/trivia/data/models/category_model.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  const tCategoriesModel = CategoriesModel(categories: [
    CategoryModel(id: 9, name: "Test name"),
    CategoryModel(id: 10, name: "Test name"),
  ]);

  test("category model from json", () async {
    // arrange
    final Map<String, dynamic> jsonMap =
        json.decode(fixture('trivia_category.json'));
    // act
    final result = (jsonMap['trivia_categories'] as List)
        .map((e) => CategoryModel.fromJson(e));
    final categoriesResult = CategoriesModel(categories: [...result]);
    // assert
    expect(categoriesResult, tCategoriesModel);
  });
}
