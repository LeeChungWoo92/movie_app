import 'package:movie_app/domain/model/movie.dart';

import '../dto/movie_dto.dart';

extension MovieMapper on MovieDataDto {
  Movie toMovie() {
    return Movie(
      id: (id ?? 0) as int,
      title: title ?? '',
      poster: posterPath ?? '',
      overview: overview ?? '',
      releaseDate: releaseDate ?? '',
      voteAverage: voteAverage ?? 0.0,
      voteCount: voteCount ?? 0,
    );
  }
}