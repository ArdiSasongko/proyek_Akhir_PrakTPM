class MexicanFood {
  final String? id;
  final String? title;
  final String? difficulty;
  final String? image;

  MexicanFood({
    this.id,
    this.title,
    this.difficulty,
    this.image,
  });

  MexicanFood.fromJson(Map<String, dynamic> json)
      : id = json['id'] as String?,
        title = json['title'] as String?,
        difficulty = json['difficulty'] as String?,
        image = json['image'] as String?;

  Map<String, dynamic> toJson() => {
    'id' : id,
    'title' : title,
    'difficulty' : difficulty,
    'image' : image
  };
}