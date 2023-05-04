// ignore_for_file: file_names

class Artifact {
  final String name;
  final String museum;
  final String description;
  final List<dynamic> images;
  final String video;

  const Artifact(
      {required this.name,
      required this.museum,
      required this.description,
      required this.images,
      required this.video});

  factory Artifact.fromJson(Map<String, dynamic> json) {
    return Artifact(
      name: json['name'],
      museum: json['museum'],
      description: json['description'],
      images: json['image'],
      video: json['video'],
    );
  }
  static List<Artifact> fromJsonList(List<dynamic> jsonList) {
    List<Artifact> artifact = [];
    for (var json in jsonList) {
      artifact.add(Artifact.fromJson(json));
    }
    return artifact;
  }
}
