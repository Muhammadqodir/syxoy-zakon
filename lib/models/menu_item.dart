class MenuItem {
  int id;
  String title;
  String desc;
  String price;
  String imageUrl;

  MenuItem({
    required this.id,
    required this.title,
    required this.desc,
    required this.imageUrl,
    required this.price,
  }) {
    imageUrl = imageUrl.replaceAll(
        "https://suxoy-zakon.ru/", "https://suxoyzakon.ru/");
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'desc': desc,
        'price': price,
        'imageUrl': imageUrl
      };
}
