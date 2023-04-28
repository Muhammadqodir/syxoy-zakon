class MenuItem {
  int id;
  String title;
  String desc;
  String price;
  String imageUrl;

  MenuItem(
      {required this.id,
      required this.title,
      required this.desc,
      required this.imageUrl,
      required this.price});

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'desc': desc,
        'price': price,
        'imageUrl': imageUrl
      };
}
