class Movie {
  String title;
  String overview;
  String poster;
  Movie({required this.title, required this.overview, required this.poster});

  Movie fromJson(Map<dynamic, dynamic> json) {
    return Movie(
        title: json['results']['title'],
        overview: json['results']['overview'],
        poster: json['results']['poster_path']);
  }
}
