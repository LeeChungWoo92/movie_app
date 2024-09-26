import 'package:flutter/material.dart';
import 'package:movie_app/domain/repository/moive_repository.dart';
import 'package:movie_app/presentation/movie/movie_list_ui_state.dart';

class MovieListViewModel with ChangeNotifier {
  final MovieRepository _movieRepository;

  MovieListViewModel(this._movieRepository) {
    getMovies();
  }

  MovieListUiState _state = const MovieListUiState();

  MovieListUiState get state => _state;

  void getMovies() async {
    _state = state.copyWith(isLoading: true);
    notifyListeners();

    try {
      // 영화 데이터를 가져오는 repository 호출
      final result = await _movieRepository.getMovies();
      print('무비result: $result');

      // 성공적으로 데이터를 가져왔을 때 처리
      if (result != null) {
        _state = state.copyWith(
          isLoading: false,
          movie: result, // 영화 데이터를 상태에 저장
          errorMessage: '', // 에러 메시지 초기화
        );
      } else {
        // 결과가 null일 때
        _state = state.copyWith(
          isLoading: false,
          errorMessage: '영화 데이터를 불러올 수 없습니다.', // 적절한 에러 메시지
        );
      }
    } catch (error) {
      print('무비error: $error');
      // 실패 시 처리
      _state = state.copyWith(
        isLoading: false,
        errorMessage: '영화 데이터를 가져오는 도중 오류가 발생했습니다: $error', // 에러 메시지 처리
      );
    } finally {
      print('무비result: finally');
      // 상태 변경 알림
      notifyListeners();
    }
  }
}
