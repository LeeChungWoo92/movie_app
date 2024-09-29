import 'package:movie_app/data/dto/movie_dto.dart';

abstract interface class MovieDataSource {
  Future<MovieDto> fetch();
}
