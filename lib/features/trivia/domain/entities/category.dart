// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';

class Category extends Equatable {
  final String name;
  final int id;
  const Category({
    required this.name,
    required this.id,
  });

  @override
  List<Object?> get props => [name, id];
}

class Categories extends Equatable {
  final List<Category> categories;
  const Categories({
    required this.categories,
  });

  @override
  List<Object?> get props => [categories];
}
