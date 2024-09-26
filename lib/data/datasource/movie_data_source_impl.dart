import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:movie_app/data/datasource/movie_data_source.dart';
import 'package:http/http.dart' as http;
import '../dto/movie_dto.dart';

class MovieDataSourceImpl implements MovieDataSource {
  final String _baseUrl = "https://api.themoviedb.org/3/movie/now_playing";
  final String _language = "ko-KR";
  final int _page = 1;

  Uri _buildUrl() {
    return Uri.parse("$_baseUrl?language=$_language&page=$_page");
  }

  Map<String, String> _buildHeaders() {
    final String? apiKey = dotenv.env['API_KEY_MOVIE'];
    if (apiKey == null) {
      throw Exception('API Key is missing');
    }
    return {
      'accept': 'application/json',
      'Authorization': 'Bearer $apiKey',
    };
  }

  @override
  Future<List<MovieDataDto>> getMovies() async {
    try {
      final response = await http.get(_buildUrl(), headers: _buildHeaders());

      if (response.statusCode == 200) {
        final List<dynamic> jsonResponse = jsonDecode(response.body)['results'];
        return jsonResponse.map((e) => MovieDataDto.fromJson(e)).toList();
      } else {
        throw Exception('Failed to load movies, status code: ${response.statusCode}');
      }
    } catch (error) {
      throw Exception('Error occurred while fetching movies: $error');
    }
  }
}
