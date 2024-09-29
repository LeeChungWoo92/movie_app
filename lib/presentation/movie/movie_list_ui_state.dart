import 'package:freezed_annotation/freezed_annotation.dart';

import '../../data/dto/movie_dto.dart';
import '../../domain/model/movie.dart';

part 'movie_list_ui_state.freezed.dart';

part 'movie_list_ui_state.g.dart';

@freezed
class MovieListUiState with _$MovieListUiState {
  const factory MovieListUiState({
    MovieDto? movieData,
    @Default([]) List<Movie> movie,
    @Default(false) bool isLoading,
    @Default('에러발생') String errorMessage,
  }) = _MovieListUiState;

  factory MovieListUiState.fromJson(Map<String, Object?> json) => _$MovieListUiStateFromJson(json);
}
