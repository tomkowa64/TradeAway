class Product {
  final num id;
  final String name;
  final String description;
  final num price;
  final num discount;
  final String seller;
  final List<dynamic> categories;
  final num units;
  final String state;

  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.price,
    required this.discount,
    required this.seller,
    required this.categories,
    required this.units,
    required this.state
  });
}