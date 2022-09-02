class ProductListModel {
  int? id;
  String? title;
  int? price;
  String? image;

  ProductListModel(
      { this.id,
       this.title,
       this.price,
       this.image});

  factory ProductListModel.fromJson(Map<String, dynamic> json) {
    return ProductListModel(
      id: json['id'],
      title: json['title'],
      price: json['price'],
      image: json['featured_image'],
    );
  }
}



