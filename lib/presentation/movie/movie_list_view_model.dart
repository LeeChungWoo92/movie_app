import 'package:flutter/material.dart';
import 'package:movie_app/domain/repository/movie_repository.dart';
import 'package:movie_app/presentation/movie/movie_list_ui_state.dart';

class MovieListViewModel with ChangeNotifier {
  final MovieRepository _movieRepository;
  int _page = 1; // 초기 페이지는 1
  bool _isLastPage = false; // 마지막 페이지 여부 확인
  bool _isFetching = false; // 중복 요청 방지 플래그

  MovieListViewModel(this._movieRepository);

  MovieListUiState _state = const MovieListUiState();

  MovieListUiState get state => _state;

  Future<void> fetchMovies() async {
    if (_isFetching || _isLastPage) return;

    _isFetching = true; // 로딩 시작
    _setLoading(true);

    try {
      print(_page);
      print('페이지췍');
      // 페이지에 맞는 데이터를 가져옴
      final movieData = await _movieRepository.fetch(_page);
      final movies = await _movieRepository.getMovies(_page);

      // 영화 데이터가 정상적으로 반환되면 상태 업데이트
      if (movies.isNotEmpty) {
        _state = state.copyWith(
          isLoading: false,
          movieData: movieData,
          movie: [...state.movie, ...movies],
          errorMessage: '',
        );

        _page++;
      } else {
        _isLastPage = true;
        _state = state.copyWith(
          isLoading: false,
          errorMessage: '더 이상 불러올 영화가 없습니다.',
        );
      }
    } catch (error) {
      _state = state.copyWith(
        isLoading: false,
        errorMessage: '영화 데이터를 가져오는 도중 오류가 발생했습니다: $error',
      );
    } finally {
      _isFetching = false;
      notifyListeners();
    }
  }

  void _setLoading(bool isLoading) {
    _state = state.copyWith(isLoading: isLoading);
    notifyListeners();
  }
}
