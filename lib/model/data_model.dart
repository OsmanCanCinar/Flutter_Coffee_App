class DataModel {
  String title;
  String description;
  List<String> ingredients;
  int id;

  DataModel({
    required this.title,
    required this.description,
    required this.ingredients,
    required this.id,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      title: json['title'],
      description: json['description'],
      ingredients: json['ingredients'],
      id: json['id'],
    );
  }
}
