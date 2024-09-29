import '../../data/dto/movie_dto.dart';
import '../model/movie.dart';

abstract interface class MovieRepository {
  Future<MovieDto> fetch();
  Future<List<Movie>> getMovies();
}
