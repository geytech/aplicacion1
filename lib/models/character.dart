class Character {
  final int id;
  final String name;
  final String image;
  final String status;
  final String species;
  final String gender;
  final Map<String, dynamic> origin;
  final Map<String, dynamic> location;

  Character({
    required this.id,
    required this.name,
    required this.image,
    required this.status,
    required this.species,
    required this.gender,
    required this.origin,
    required this.location,
  });

  factory Character.fromJson(Map<String, dynamic> json) {
    return Character(
      id: json['id'],
      name: json['name'],
      image: json['image'],
      status: json['status'],
      species: json['species'],
      gender: json['gender'],
      origin: json['origin'],
      location: json['location'],
    );
  }
}