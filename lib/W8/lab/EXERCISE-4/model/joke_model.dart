class JokeModel {
  final String title;
  final String description;
  
  const JokeModel({String? title, String? description})
    : title = title ?? "Title",
      description = description ?? "Descriprtion";
}
