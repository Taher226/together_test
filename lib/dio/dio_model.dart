class ProductModel {
  int id;
  String title;
  double price;
  String description;
  String category;
  String image;
  Rating rating;

  ProductModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      title: json['title'],
      price: json['price'].toDouble(),
      description: json['description'],
      category: json['category'],
      image: json['image'],
      rating:
          json['rating'] != null
              ? Rating.fromJson(json['rating'])
              : Rating(count: 0, rate: 0.0),
    );
  }
}

class Rating {
  double rate;
  int count;

  Rating({required this.rate, required this.count});

  factory Rating.fromJson(Map<String, dynamic> json) {
    return Rating(
      rate:
          (json['rate'] is String)
              ? double.tryParse(json['rate']) ?? 0.0
              : (json['rate'] is int)
              ? (json['rate'] as int).toDouble()
              : (json['rate'] ?? 0.0).toDouble(),
      count:
          (json['count'] is String)
              ? int.tryParse(json['count']) ?? 0
              : json['count'] ?? 0,
    );
  }
}
