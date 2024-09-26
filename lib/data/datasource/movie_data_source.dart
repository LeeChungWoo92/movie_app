import 'package:movie_app/data/dto/movie_dto.dart';

abstract interface class MovieDataSource {
  Future<List<MovieDataDto>> getMovies();
}
