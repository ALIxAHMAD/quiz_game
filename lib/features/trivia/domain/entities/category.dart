// ignore_for_file: public_member_api_docs, sort_constructors_first
class Category {
  final String name;
  final int id;
  Category({
    required this.name,
    required this.id,
  });
}

class Categories {
  final List<Category> categories;
  Categories({
    required this.categories,
  });
}
