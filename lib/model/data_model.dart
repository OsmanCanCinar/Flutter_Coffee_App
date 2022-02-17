class DataModel {
  String title;
  String description;
  int id;

  DataModel({
    required this.title,
    required this.description,
    required this.id,
  });

  factory DataModel.fromJson(Map<String, dynamic> json) {
    return DataModel(
      title: json['title'],
      description: json['description'],
      id: json['id'],
    );
  }
}
