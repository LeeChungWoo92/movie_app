import 'package:flutter/material.dart';
import 'package:movie_app/domain/repository/moive_repository.dart';
import 'package:movie_app/presentation/movie/movie_list_ui_state.dart';

class MovieListViewModel with ChangeNotifier {
  final MovieRepository _movieRepository;

  MovieListViewModel(this._movieRepository) {
    fetchMovie();
    getMovies();
  }

  MovieListUiState _state = const MovieListUiState();

  MovieListUiState get state => _state;

  void fetchMovie() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final result = await _movieRepository.fetch();

      if (result != null) {
        _state = state.copyWith(
          isLoading: false,
          movieData: result,
          errorMessage: '',
        );
      } else {
        _state = state.copyWith(
          isLoading: false,
          errorMessage: '영화 데이터를 불러올 수 없습니다.',
        );
      }
    } catch (error) {
      _state = state.copyWith(
        isLoading: false,
        errorMessage: '영화 데이터를 가져오는 도중 오류가 발생했습니다: $error',
      );
    } finally {
      notifyListeners();
    }
  }

  void getMovies() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      final result = await _movieRepository.getMovies();

      if (result != null) {
        _state = state.copyWith(
          isLoading: false,
          movie: result,
          errorMessage: '',
        );
      } else {
        _state = state.copyWith(
          isLoading: false,
          errorMessage: '영화 데이터를 불러올 수 없습니다.',
        );
      }
    } catch (error) {
      // 실패 시 처리
      _state = state.copyWith(
        isLoading: false,
        errorMessage: '영화 데이터를 가져오는 도중 오류가 발생했습니다: $error',
      );
    } finally {
      notifyListeners();
    }
  }
}
