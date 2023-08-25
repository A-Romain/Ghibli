class Movie{
  String id;
  String title;
  String director;
  String release_date;
  String image;

  Movie({
    required this.id,
    required this.title,
    required this.director,
    required this.release_date,
    required this.image,
  });

  factory Movie.fromJson(Map<String, dynamic> parsedJson){
    return Movie(
        id: parsedJson['id'],
        title: parsedJson['title'],
        director: parsedJson['director'],
        release_date: parsedJson['release_date'],
        image: parsedJson['image']
    );
  }
}