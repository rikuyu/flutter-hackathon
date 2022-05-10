class Profile {
  final String? name;
  final String? description;
  final String? imageUrl;

  Profile({
    required this.name,
    required this.description,
    required this.imageUrl,
  });

  Profile.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name'] as String,
          description: json['description'] as String,
          imageUrl: json['imageUrl'] as String,
        );

  static Map<String, dynamic> toMap(Profile profile) => {
        "name": profile.name,
        "description": profile.description,
        "imageUrl": profile.imageUrl
      };
}
