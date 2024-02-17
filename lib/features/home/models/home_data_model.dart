import 'dart:convert';

class HomeDataModel {
  final int id;
  final String title;
  final String description;
  final String imageUrl;

  HomeDataModel(
      {required this.id,
      required this.title,
      required this.description,
      required this.imageUrl});

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'imageUrl': imageUrl,
    };
  }

  factory HomeDataModel.fromMap(Map<String, dynamic> map) {
    return HomeDataModel(
        id: map['id']?.toInt() ?? 0,
        title: map['title'] ?? '',
        description: map['description'] ?? '',
        imageUrl: map['image_url'] ?? '');
  }

  String toJson() => json.encode(toMap());

  factory HomeDataModel.fromJson(String source) =>
      HomeDataModel.fromMap(json.decode(source));
}
