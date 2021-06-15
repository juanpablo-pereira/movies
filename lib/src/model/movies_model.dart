import 'movies_result_model.dart';

class MoviesModel {
  int _page;
  int _totalResults;
  int _totalPages;
  List<MoviesResultModel> _results = [];

  MoviesModel.fromJson(Map<String, dynamic> parsedJson) {
    _page = parsedJson['page'];
    _totalResults = parsedJson['total_results'];
    _totalPages = parsedJson['total_pages'];

    List<MoviesResultModel> temp = [];
    for (int i = 0; i < parsedJson['results'].length; i++) {
      temp.add(
        MoviesResultModel(
          parsedJson['results'][i],
        ),
      );
    }
    _results = temp;
  }

  List<MoviesResultModel> get results => _results;

  int get totalPages => _totalPages;

  int get totalResults => _totalResults;

  int get page => _page;
}
