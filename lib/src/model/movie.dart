import 'movie_result.dart';

class Movie {
  late final int page;
  late final int totalResults;
  late final int totalPages;
  late final List<MovieResult> results;

  Movie({
    required this.page,
    required this.totalResults,
    required this.totalPages,
    required this.results,
  });

  factory Movie.fromJson(Map<String, dynamic> parsedJson) {
    var temporaryMovies = parsedJson['results'] as List;

    List<MovieResult> mappedResults = [];

    for (var tempMovie in temporaryMovies) {
      MovieResult movie = MovieResult.fromJson(
        tempMovie,
      );
      if (movie.posterPath.isNotEmpty) {
        mappedResults.add(
          movie,
        );
      }
    }

    return Movie(
      page: parsedJson['page'],
      totalPages: parsedJson['total_pages'],
      totalResults: parsedJson['total_results'],
      results: mappedResults,
    );
  }
}
