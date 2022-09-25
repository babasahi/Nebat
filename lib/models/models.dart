class Plant {
  final int id;
  final String plantName;
  final String imagePath;
  final double probability;
  final List<String> images;
  final List<Suggestion> suggestions;

  Plant(
      {required this.id,
      required this.plantName,
      required this.imagePath,
      required this.images,
      required this.probability,
      required this.suggestions});

  Plant.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        plantName = json['plantName'],
        imagePath = json['imagePath'],
        images = json['images'],
        probability = json['probability'],
        suggestions = json['suggestions'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'plantName': plantName,
        'imagePath': imagePath,
        'images': images,
        'probability': probability,
        'suggestions': suggestions
      };
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
