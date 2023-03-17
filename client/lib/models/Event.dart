// ignore_for_file: file_names

class Event {
  final String name;
  final String location;
  final String description;
  final String image;
  final String eventDate;

  const Event(
      {required this.name,
      required this.location,
      required this.description,
      required this.image,
      required this.eventDate});

  factory Event.fromJson(Map<String, dynamic> json) {
    return Event(
      name: json['name'],
      location: json['location'],
      description: json['description'],
      image: json['image'],
      eventDate: json['eventDate'],
    );
  }
}
