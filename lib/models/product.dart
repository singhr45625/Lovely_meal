class Product {
  String imagePath;
  String title;
  String description;
  double rating;
  int comments;
  double price;
  int calories;
  String distance;
  String time;
  int quantity;

  Product({
    required this.imagePath,
    required this.title,
    required this.description,
    required this.rating,
    required this.comments,
    required this.price,
    required this.calories,
    required this.distance,
    required this.time,
    this.quantity = 1,
  });

  static Product copy(Product p) {
    return Product(
      imagePath: p.imagePath,
      title: p.title,
      description: p.description,
      rating: p.rating,
      comments: p.comments,
      price: p.price,
      calories: p.calories,
      distance: p.distance,
      time: p.time,
      quantity: p.quantity,
    );
  }
}
