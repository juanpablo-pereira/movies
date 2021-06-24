class MovieResult {
  int? voteCount;
  late int id;
  bool? video;
  num? voteAverage;
  String? title;
  double? popularity;
  late String posterPath;
  String? originalLanguage;
  String? originalTitle;
  List<int> genreIds;
  String? backdropPath;
  bool? adult;
  String? overview;
  String? releaseDate;

  MovieResult({
    this.voteCount,
    required this.id,
    this.video,
    this.voteAverage,
    this.title,
    this.popularity,
    required this.posterPath,
    this.originalLanguage,
    this.originalTitle,
    required this.genreIds,
    this.backdropPath,
    this.adult,
    this.overview,
    this.releaseDate,
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
      voteAverage: parsedJson['vote_average'],
      title: parsedJson['title'],
      popularity: parsedJson['popularity'],
      posterPath:
          parsedJson['poster_path'] != null ? parsedJson['poster_path'] : '',
      originalLanguage: parsedJson['original_language'],
      originalTitle: parsedJson['original_title'],
      genreIds: _getGenresIdList(genreIds),
      backdropPath: parsedJson['backdrop_path'],
      adult: parsedJson['adult'],
      overview: parsedJson['overview'],
      releaseDate: parsedJson['release_date'],
    );
  }
}
