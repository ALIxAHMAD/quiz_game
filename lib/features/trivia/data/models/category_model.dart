// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:quiz_game/features/trivia/domain/entities/category.dart';

class CategoryModel extends Equatable {
  final int id;
  final String name;
  const CategoryModel({
    required this.id,
    required this.name,
  });
  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json["id"],
      name: json["name"],
    );
  }

  @override
  List<Object?> get props => [id, name];
}

class CategoriesModel extends Equatable {
  final List<CategoryModel> categories;
  const CategoriesModel({
    required this.categories,
  });
  Categories toCategoriesEntity() {
    return Categories(
      categories: categories
          .map(
            (e) => Category(
              name: e.name,
              id: e.id,
            ),
          )
          .toList(),
    );
  }

  @override
  List<Object?> get props => [categories];
}
