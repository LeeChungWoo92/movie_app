import '../../data/dto/movie_dto.dart';
import '../model/movie.dart';

abstract interface class MovieRepository {
  Future<MovieDto> fetch(int page);
  Future<List<Movie>> getMovies(int page);
}
