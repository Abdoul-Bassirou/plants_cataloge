class Plant {
  final String name;
  final String scientificName;
  final String family;
  final String origin;
  final String imageUrl;
  final String description;
  final String category;
  bool isFavorite;

  Plant({
    required this.name,
    required this.scientificName,
    required this.family,
    required this.origin,
    required this.imageUrl,
    required this.description,
    required this.category,
    this.isFavorite = false,
  });
}
