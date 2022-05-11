class Profile {
  final String? name;
  final String? description;
  final String? imageUrl;
  final int? prefecture;

  Profile({
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.prefecture,
  });

  Profile.fromJson(Map<String, dynamic> json)
      : this(
          name: json['name'] as String,
          description: json['description'] as String,
          imageUrl: json['imageUrl'] as String,
          prefecture: json['prefecture'] as int,
        );

  static Map<String, dynamic> toMap(Profile profile) => {
        "name": profile.name,
        "description": profile.description,
        "imageUrl": profile.imageUrl,
        "prefecture": profile.prefecture
      };
}
