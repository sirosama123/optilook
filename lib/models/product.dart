class Product {
  final int id;
  final String name;
  final String description;
  final double price;
  final String regularPrice;
  final String salePrice;
  final List<dynamic> images;
  final List<dynamic> attributes;
  final List<dynamic> variations;
  final List<dynamic> related;
  final String description2;
  var yoast_head_json;

  Product( {
    required this.id, 
    required this.name, 
    required this.description, 
    required this.price,
    required this.regularPrice,
    required this.salePrice,
    required this.images,
    required this.yoast_head_json,
    required this.description2,
    required this.attributes,
    required this.variations,
    required this.related
    });

  factory Product.fromJson(Map<String, dynamic> json) {
    return Product(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      price: double.parse(json['price']),
      images: json['images'],
      regularPrice: json['regular_price'],
      salePrice: json['sale_price'],
      yoast_head_json: json['yoast_head_json'], 
      description2: json['description'],
      attributes: json['attributes'],
      variations: json['variations'],
      related: json['related_ids']
    );
  }
}