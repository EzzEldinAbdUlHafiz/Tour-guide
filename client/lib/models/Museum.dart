// ignore_for_file: file_names

class Museum {
  final String name;
  final String address;
  final String artifacts;
  final String description;
  final String image;
  final String openTime;
  final String closeTime;
  final String city;

  const Museum(
      {required this.name,
      required this.address,
      required this.artifacts,
      required this.description,
      required this.image,
      required this.openTime,
      required this.closeTime,
      required this.city});

  factory Museum.fromJson(Map<String, dynamic> json) {
    return Museum(
      name: json['name'],
      address: json['address'],
      artifacts: json['artifacts'],
      description: json['description'],
      image: json['image'],
      openTime: json['openTime'],
      closeTime: json['closeTime'],
      city: json['city'],
    );
  }
}
