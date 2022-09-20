class Plant {
  final int id;
  final String plantName;
  final String imagePath;
  final List<String> images;
  final List<Suggestion> suggestions;

  Plant(
      {required this.id,
      required this.plantName,
      required this.imagePath,
      required this.images,
      required this.suggestions});
}

class Suggestion {
  final String id;
  final String plantName;
  Suggestion({required this.id, required this.plantName});
}

class PlantDetails {
  final double probability;
  final bool confirmed;
  PlantDetails({
    required this.probability,
    required this.confirmed,
  });
}
