abstract class MovieStrings {
  static const String apiKey = 'a1f0fb356abe09082c8e841e096b8dde';
  static const String apiFetchPopular =
      'https://api.themoviedb.org/3/movie/popular?api_key=';
  static const String apiFetchSearch =
      'https://api.themoviedb.org/3/search/movie?api_key=';
  static const String apiSearchParam = '&query=';
  static const String gridBuilderImageUrlStart =
      'https://image.tmdb.org/t/p/w185';

  static const String appBarTextFieldHint = 'Search a movie..';
  static const String defaultTitle = 'No Name';
  static const String defaultPosterPath = '';
  static const String defaultOverview = 'This item does not have an overview';
  static const String defaultReleaseDate = 'No Date';
  static const String detailsIsAdultText = '+18';
  static const String detailsIsNotAdultText = 'PG';
  static const String defaultVoteAverage = '0';
}
