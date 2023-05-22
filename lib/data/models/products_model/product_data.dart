import 'package:provider_with_api/data/models/products_model/rating_data.dart';

class ProductsData {
  int id;
  String title;
  num price;
  String description;
  String category;
  String image;
  RatingData rating;

  ProductsData({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  factory ProductsData.fromJson(Map<String, dynamic> json) {
    return ProductsData(
      id: json["id"] ?? 0,
      title: json["title"] ?? '',
      price: json["price"],
      description: json["description"] ?? '',
      category: json["category"] ?? '',
      image: json["image"] ?? '',
      rating: RatingData.fromJson(json['rating'] ?? {}),
    );
  }

}
