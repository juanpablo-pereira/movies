import '../resources/movie_strings.dart';

class MovieResult {
  int? voteCount;
  late int id;
  bool? video;
  late num voteAverage;
  late String title;
  double? popularity;
  late String posterPath;
  String? originalLanguage;
  String? originalTitle;
  List<int> genreIds;
  String? backdropPath;
  late bool adult;
  late String overview;
  late String releaseDate;

  MovieResult({
    this.voteCount,
    required this.id,
    this.video,
    required this.voteAverage,
    required this.title,
    this.popularity,
    required this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    required this.genreIds,
    this.backdropPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
  });

  factory MovieResult.fromJson(
    Map<String, dynamic> parsedJson,
  ) {
    var genreIds = parsedJson['genre_ids'] as List;

    List<int> _getGenresIdList(
      List<dynamic> parsedList,
    ) {
      List<int> _genreIds = [];

      for (int id = 0; id < parsedList.length; id++) {
        _genreIds.add(
          parsedList[id],
        );
      }
      return _genreIds;
    }

    return MovieResult(
      voteCount: parsedJson['vote_count'],
      id: parsedJson['id'],
      video: parsedJson['video'],
      voteAverage: parsedJson['vote_average'] != null
          ? parsedJson['vote_average']
          : MovieStrings.defaultVoteAverage,
      title: parsedJson['title'] != null
          ? parsedJson['title']
          : MovieStrings.defaultTitle,
      popularity: parsedJson['popularity'],
      posterPath: parsedJson['poster_path'] != null
          ? parsedJson['poster_path']
          : MovieStrings.defaultPosterPath,
      originalLanguage: parsedJson['original_language'],
      originalTitle: parsedJson['original_title'],
      genreIds: _getGenresIdList(genreIds),
      backdropPath: parsedJson['backdrop_path'],
      adult: parsedJson['adult'] != null ? parsedJson['adult'] : false,
      overview: parsedJson['overview'] != null
          ? parsedJson['overview']
          : MovieStrings.defaultOverview,
      releaseDate: parsedJson['release_date'] != null
          ? parsedJson['release_date']
          : MovieStrings.defaultReleaseDate,
    );
  }
}
