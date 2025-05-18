import 'package:atividade_ebac_pre_projeto/common/Model/appstyle.dart';
import 'package:atividade_ebac_pre_projeto/common/Model/movie.dart';
import 'package:atividade_ebac_pre_projeto/common/Model/utils.dart';
import 'package:atividade_ebac_pre_projeto/home/Shared/simples_classification_bedge.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ImagemItem extends StatelessWidget {
  const ImagemItem({
    super.key,
    required this.movie,
    required this.tag,
  });

  final Movie movie;
  final String tag;

  static const double _fontSizeTitle = 12.0;
  static const double _fontSizeInfo = 10.0;
  static const double _classificationSize = 22.0;
  static const double _ratingBarSize = 8.0;
  static const double _gradientHeight = 60.0;
  static const double _marginAll = 1.0;
  static const double _positionedRight = 10.0;
  static const double _positionedTop = 2.0;
  static const double _positionedBottom = 2.0;

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Container(
      margin: const EdgeInsets.all(_marginAll),
      child: ClipRRect(
        borderRadius: const BorderRadius.all(
          Radius.circular(AppStyle.roundAllCorners),
        ),
        child: Stack(
          children: [
            Hero(
              tag: tag,
              child: movie.poster != null
                  ? Image.network(
                      movie.poster!,
                      fit: BoxFit.cover,
                      width: double.infinity,
                      errorBuilder: (context, error, stackTrace) =>
                          _buildPlaceholderImage(screenWidth),
                    )
                  : _buildPlaceholderImage(screenWidth),
            ),
            _buildGradientOverlay(context),
            if (movie.title != null) _buildTitle(context),
            if (movie.imdbRating != null) _buildRatingBar(),
            if (movie.releasedOn != null) _buildReleaseDate(),
            if (movie.length != null) _buildMovieLength(),
            _buildClassification(),
          ],
        ),
      ),
    );
  }

  Widget _buildPlaceholderImage(double screenWidth) {
    return Container(
      width: screenWidth,
      height: screenWidth * 1.5,
      color: Colors.grey[300],
      child: const Center(child: Icon(Icons.image_not_supported)),
    );
  }

  Widget _buildGradientOverlay(BuildContext context) {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        height: _gradientHeight,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [
              Color.fromARGB(200, 0, 0, 0),
              Color.fromARGB(0, 0, 0, 0),
            ],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
      ),
    );
  }

  Widget _buildTitle(BuildContext context) {
    return Positioned(
      bottom: 15.0,
      left: 0.0,
      right: 0.0,
      child: Center(
        child: Stack(
          children: [
            Text(
              movie.title!,
              style: TextStyle(
                fontSize: _fontSizeTitle,
                foreground: Paint()
                  ..strokeWidth = 1
                  ..style = PaintingStyle.stroke
                  ..strokeJoin = StrokeJoin.round
                  ..color = Colors.white,
              ),
            ),
            Text(
              movie.title!,
              style: const TextStyle(
                fontSize: _fontSizeTitle,
                color: Colors.orange,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRatingBar() {
    return Positioned(
      top: _positionedTop,
      right: _positionedRight,
      child: RatingBarIndicator(
        rating: movie.imdbRating! / 2,
        itemBuilder: (context, index) => const Icon(
          Icons.star,
          color: Colors.amber,
        ),
        unratedColor: Colors.white,
        itemCount: 5,
        itemSize: _ratingBarSize,
        direction: Axis.horizontal,
      ),
    );
  }

  Widget _buildReleaseDate() {
    return Positioned(
      bottom: _positionedBottom,
      right: _positionedRight,
      child: Text(
        dateFormater(movie.releasedOn!),
        style: const TextStyle(fontSize: _fontSizeInfo),
      ),
    );
  }

  Widget _buildMovieLength() {
    return Positioned.fill(
      bottom: _positionedBottom,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          movie.length!,
          style: const TextStyle(fontSize: _fontSizeInfo),
        ),
      ),
    );
  }

  Widget _buildClassification() {
    return Positioned(
      top: _positionedTop,
      right: _positionedRight,
      child: SimplesClassificationBedge(
        classificationSize: _classificationSize,
        classificationOpacity: 0.7,
        movie: movie,
        fontSize: _fontSizeInfo,
      ),
    );
  }
}