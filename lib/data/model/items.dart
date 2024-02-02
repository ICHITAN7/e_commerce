class ItemModel {
  String itemId;
  bool loved;
  String mainImage;
  String price;
  String rating;
  List<String> subImage;
  String subTitle;
  String title;

  ItemModel({
    required this.itemId,
    required this.loved,
    required this.mainImage,
    required this.price,
    required this.rating,
    required this.subImage,
    required this.subTitle,
    required this.title,
  });

  factory ItemModel.fromMap(String itemId, Map<dynamic, dynamic> map) {
    return ItemModel(
      itemId: itemId,
      loved: map['loved'],
      mainImage: map['mainImage'],
      price: map['price'],
      rating: map['rating'],
      subImage: List<String>.from(map['subImage']),
      subTitle: map['subTitle'],
      title: map['title'],
    );
  }
}
