class Plant {
  final int id;
  final String plantName;
  final String imagePath;
  final double probability;
  final List<String> images;

  Plant(
      {required this.id,
      required this.plantName,
      required this.imagePath,
      required this.images,
      required this.probability});

  Plant.fromJson(Map<String, dynamic> json)
      : id = json['id'],
        plantName = json['plantName'],
        imagePath = json['imagePath'],
        images = json['images'],
        probability = json['probability'];

  Map<String, dynamic> toJson() => {
        'id': id,
        'plantName': plantName,
        'imagePath': imagePath,
        'images': images,
        'probability': probability
      };
}
