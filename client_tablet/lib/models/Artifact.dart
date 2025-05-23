class Artifact {
  final String name;
  final String museum;
  final String description;
  final List<dynamic> images;
  final String video;
  final String rfid;

  const Artifact(
      {required this.name,
      required this.museum,
      required this.description,
      required this.images,
      required this.video,
      required this.rfid});

  factory Artifact.fromJson(Map<String, dynamic> json) {
    return Artifact(
      name: json['name'],
      museum: json['museum'],
      description: json['description'],
      images: json['image'],
      video: json['video'],
      rfid: json['rfid'],
    );
  }
}
