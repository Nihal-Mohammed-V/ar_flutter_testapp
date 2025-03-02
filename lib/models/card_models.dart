class CardModel {
  final String image;
  final String title;
  final String description;
  final String object;
  final bool isLocal;

  CardModel({
    required this.image,
    required this.title,
    required this.description,
    required this.object,
    this.isLocal = true,
  });
}
