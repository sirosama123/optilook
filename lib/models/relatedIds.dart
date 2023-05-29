class RelatedIds {
  String? id;
  String? img;
  String? price;
  String? regular_price;
  String? s_price;
  String? name;
  var yoast_head_json;
  final String description;
  final List<dynamic> images;
  final List<dynamic> attributes;
  final List<dynamic> variations;
  final List<dynamic> related;
  final String description2;
  RelatedIds(
      {required this.id,
      required this.img,
      required this.price,
      required this.regular_price,
      required this.s_price,
      required this.name,
      required this.images,
      required this.yoast_head_json,
      required this.attributes,
      required this.description,
      required this.description2,
      required this.related,
      required this.variations
      });
}
