// ignore_for_file: file_names

class MiniArtifact {
  final String name;
  final List<dynamic> images;

  const MiniArtifact({required this.name, required this.images});

  factory MiniArtifact.fromJson(Map<String, dynamic> json) {
    return MiniArtifact(
      name: json['name'],
      images: json['image'],
    );
  }

  static List<MiniArtifact> fromJsonList(List<dynamic> jsonList) {
    List<MiniArtifact> miniArtifacts = [];
    for (var json in jsonList) {
      miniArtifacts.add(MiniArtifact.fromJson(json));
    }
    return miniArtifacts;
  }
}

class Museum {
  final String name;
  final String address;
  final List<MiniArtifact> artifacts;
  final String description;
  final String image;
  final String openTime;
  final String closeTime;
  final String city;

  const Museum({
    required this.name,
    required this.address,
    required this.artifacts,
    required this.description,
    required this.image,
    required this.openTime,
    required this.closeTime,
    required this.city,
  });

  factory Museum.fromJson(Map<String, dynamic> json) {
    return Museum(
      name: json['name'],
      address: json['address'],
      artifacts: MiniArtifact.fromJsonList(json['artifacts']),
      description: json['description'],
      image: json['image'],
      openTime: json['openTime'],
      closeTime: json['closeTime'],
      city: json['city'],
    );
  }

  static List<Museum> fromJsonList(List<dynamic> jsonList) {
    List<Museum> museums = [];
    for (var json in jsonList) {
      museums.add(Museum.fromJson(json));
    }
    return museums;
  }
}
