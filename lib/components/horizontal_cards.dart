import 'package:flutter/material.dart';

class HorizontalCards extends StatelessWidget {
  final List movieData;
  const HorizontalCards(this.movieData);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: movieData.length,
        itemBuilder: (context, index) {
          final String posterPath = movieData[index]['poster_path'];
          return Container(
            child: Card(
              child: FadeInImage.assetNetwork(
                  placeholder: 'assets/loading.jpg',
                  image: 'http://image.tmdb.org/t/p/w780/$posterPath'),
            ),
          );
        },
      ),
    );
  }
}
