
import 'package:atividade_ebac_pre_projeto/common/Model/classification_type.dart';

const String notLoaded = 'not loaded...';

class Movie {
  Movie({
  this.backdrop,
  this.cast,
  this.classification,
  this.director,
  this.genres,
  required this.id,
  this.tag,
  this.imdbRating,
  this.length,
  this.overview,
  this.poster,
  this.releasedOn,
  this.slug,
  this.title,
 });

 String? backdrop;
 List<String>? cast;
 ClassificationType? classification;
 List<String>? director;
 List<String>? genres;
 String id;
 String? tag;
 double? imdbRating;
 String? length;
 String? overview;
 String? poster;
 DateTime? releasedOn;
 String? slug;
 String? title;

 // ignore: unused_element
 static String _handleNullString(dynamic value, String defaultValue) {
    if (value == null || value.toString().isEmpty) {
      return defaultValue;
    }
    return value.toString();
  }

  // ignore: unused_element
  static List<String> _handleNullList(dynamic value, List<String> defaultValue) {
    if (value == null) {
      return defaultValue;
    }
    return List<String>.from(value.map((x) => x.toString()));
  }

 factory Movie.fromJson(Map<String, dynamic> json) => Movie(
  backdrop: 
  json['backdrop'] == null || json["backdrop"].toString().isEmpty
  ?'Backdrop $notLoaded'
  : json ["backdrop"],
  cast: json["cast"] == null
  ? ['Cast $notLoaded']
  : List<String>.from(json["cast"].map((x)=> x )),
  classification: json["classification"] == null||
  json["classification"].toString().isEmpty
  ? ClassificationType.notLoaded
  : ClassificationTypeTranslation.fromJson(json["classification"]),
  director: 
  json["director"] == null || json["director"].toString().isEmpty
  ? ['Director $notLoaded']
  : json["director"] is String
  ? [json["director"]]
  : List<String>.from(json["director"].map((x)=> x )),
  genres: json["genres"] == null
  ? ['Genres $notLoaded']
  : List<String>.from(json["genres"].map((x)=> x )),
  id: json["id"] ,

  imdbRating: 
  json["imdbRating"] == null ? 0.0 : json["imdb_rating"].toDouble(),
  length: json["length"] == null || json["length"].toString().isEmpty
  ? 'Length $notLoaded'
  : json["length"],
  overview: 
  json["overview"] == null || json["overview"].toString().isEmpty
  ? 'Overview $notLoaded'
  : json["overview"],
  poster:
  json["poster"] == null || json["poster"].toString().isEmpty
  ? 'Poster $notLoaded'
  : json["poster"],
  releasedOn:
  json["releasedOn"] == null || json["releasedOn"].toString().isEmpty
  ? null
  : DateTime.parse(json["releasedOn"]),
  slug: json["slug"] == null || json["slug"].toString().isEmpty
  ? 'Slug $notLoaded'
  : json["slug"],
  title: json["title"] == null || json["title"].toString().isEmpty
  ? 'Title $notLoaded'
  : json["title"],
 );

 Map<String, dynamic> toJson()=> {
  "backdrop": backdrop,
  "cast": cast == null ? null : List<String>.from(cast!.map((x)=> x)),
  "classification": classification == null
  ? null
  : ClassificationTypeTranslation.fromString(classification!.value),
  "director" : director == null 
  ? null
  : List<String>.from(director!.map((x)=> x)),
  "genres": 
  genres == null ? null : List<String>.from(genres!.map((x)=> x)),
  "id": id,
  "imdbRating": imdbRating,
  "length": length,
  "overview": overview,
  "poster": poster,
  // ignore: prefer_null_aware_operators
  "releasedOn": releasedOn == null ? null : releasedOn!.toIso8601String(),
  "slug": slug,
  "title": title,
 };

 Movie copyWith({
  String? backdrop,
  List<String>? cast,
  ClassificationType? classification,
  List<String>? director,
  List<String>? genres,
  required String id,
  String? tag,
  double? imdbRating,
  String? length,
  String? overview,
  String? poster,
  DateTime? releasedOn,
  String? slug,
  String? title,
 }) =>
    Movie(
      backdrop: backdrop ?? this.backdrop,
      cast: cast ?? this.cast,
      classification: classification ?? this.classification,
      director: director ?? this.director,
      genres: genres ?? this.genres,
      id: id,
      tag: tag,
      imdbRating: imdbRating ?? this.imdbRating,
      length: length ?? this.length,
      overview: overview ?? this.overview,
      poster: poster ?? this.poster,
      releasedOn: releasedOn ?? this.releasedOn,
      slug: slug ?? this.slug,
      title: title ?? this.title,
    );
}
 