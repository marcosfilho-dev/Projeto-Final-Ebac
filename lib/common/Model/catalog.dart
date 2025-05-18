import 'package:atividade_ebac_pre_projeto/common/Model/movie.dart';

class Catalog {
  Catalog({
    required this.movies,
  });

  final List<Movie>? movies;

  factory Catalog.fromJson(Map<String, dynamic> json) => Catalog(
    movies: json['movies'] == null || (json['movies']as List).isEmpty
    ? []
    : List<Movie>.from(json["movies"].map((x)=> Movie.fromJson(x))),
  );
  Map<String, dynamic> toJson() => {
    "movies" : movies == null || movies!.isEmpty
    ?[]
    : List<dynamic>.from(movies!.map((x) => x.toJson())),
  };
}