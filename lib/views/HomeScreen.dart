import 'package:flutter/material.dart';
import 'package:movies_app/components/now_playing.dart';
import 'package:movies_app/components/top_rated.dart';
import 'package:movies_app/components/trending_movies.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: const <Widget>[
            Text(
              'Trending Movies',
              style: TextStyle(fontSize: 18.0),
            ),
            TrendingMovies(),
            Text(
              'Top Rated Movies',
              style: TextStyle(fontSize: 18.0),
            ),
            TopRated(),
            Text(
              'Now Playing Movies',
              style: TextStyle(fontSize: 18.0),
            ),
            NowPlayingMovies(),
          ],
        ),
      ),
    );
  }
}
