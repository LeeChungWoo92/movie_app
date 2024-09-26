import 'package:flutter/material.dart';

import '../../domain/model/movie.dart';

class MovieCardWidget extends StatelessWidget {
  final Movie movie;

  const MovieCardWidget({
    super.key,
    required this.movie,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
        color: Colors.black12,
        child: Column(
          children: [
            SizedBox(
                height: 150,
                width: double.infinity,
                child: Image.network(
                  'https://image.tmdb.org/t/p/w200/${movie.poster}',
                  fit: BoxFit.fill,
                )),
            Text(
              movie.title,
              style: const TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.star,
                  color: Colors.yellow,
                  size: 18,
                ),
                Text(movie.voteAverage.toStringAsFixed(1)),
                Text('(${movie.voteCount.toString()})'),
              ],
            ),
          ],
        ));
  }
}
