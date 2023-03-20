// ignore_for_file: file_names

class Artifact {
  final String name;
  final String museum;
  final String description;
  final String image;
  final String video;

  const Artifact(
      {required this.name,
      required this.museum,
      required this.description,
      required this.image,
      required this.video});

  factory Artifact.fromJson(Map<String, dynamic> json) {
    return Artifact(
      name: json['name'],
      museum: json['museum'],
      description: json['description'],
      image: json['image'],
      video: json['video'],
    );
  }
}
