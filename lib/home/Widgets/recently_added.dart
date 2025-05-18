import 'package:atividade_ebac_pre_projeto/common/Model/appstyle.dart';
import 'package:atividade_ebac_pre_projeto/common/Model/arguments.dart';
import 'package:atividade_ebac_pre_projeto/common/Model/movie.dart';
import 'package:atividade_ebac_pre_projeto/common/Model/utils.dart';
import 'package:atividade_ebac_pre_projeto/home/Controller/home_controller.dart';
import 'package:atividade_ebac_pre_projeto/home/Shared/simples_classification_bedge.dart';
import 'package:atividade_ebac_pre_projeto/home/page/movies_detail.dart';
import 'package:carousel_slider_plus/carousel_slider_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class RecentlyAdded extends StatelessWidget {
  RecentlyAdded({
    super.key,
    required this.title,
    required this.genre,
    required this.showGenre,
    required this.movies,
    required this.homePageController,
  });

  final String title;
  final String genre;
  final bool showGenre;
  final List<Movie> movies;
  final HomePageController homePageController;
  final ValueNotifier<int> initialPage = ValueNotifier(0);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ValueListenableBuilder(
          valueListenable: initialPage,
          builder: (context, value, child) => CarouselSlider(
            options: CarouselOptions(
              height: 150,
              aspectRatio: AppStyle.aspectRatio,
              viewportFraction: AppStyle.viewportFraction,
              initialPage: initialPage.value,
              enableInfiniteScroll: true,
              reverse: false,
              autoPlay: true,
              autoPlayInterval: AppStyle.autoPlayInterval,
              autoPlayAnimationDuration: AppStyle.autoPlayAnimationDuration,
              autoPlayCurve: AppStyle.autoPlayCurve,
              enlargeCenterPage: true,
              scrollDirection: Axis.horizontal,
            ),
            items: movies.map((item) {
              return Builder(
                builder: (BuildContext context) {
                  return Material(
                    color: AppStyle.mainBackground,
                    child: InkWell(
                      onTap: () async {
                        await Future.delayed(const Duration(milliseconds: 700));
                        initialPage.value = movies.indexOf(item);
                        await Navigator.push(
                          context,
                          PageRouteBuilder(
                            transitionDuration: const Duration(milliseconds: 1500),
                            reverseTransitionDuration: const Duration(milliseconds: 500),
                            pageBuilder: (_, __, ___) => MovieDetail(title: title),
                            settings: RouteSettings(
                              arguments: Arguments(
                                tag: homePageController.generateTag(),
                                title: title,
                                homePageController: homePageController,
                                movie: item,
                              ),
                            ),
                          ),
                        );
                      },
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: ClipRRect(
                          borderRadius: const BorderRadius.all(Radius.circular(AppStyle.roundAllCorners)),
                          child: Stack(
                            children: [
                              if (item.poster != null)
                                Image.network(
                                  item.poster!,
                                  fit: BoxFit.cover,
                                  width: double.infinity,
                                ),
                              _buildGradientOverlay(),
                              _buildTitle(item),
                              _buildClassificationBadge(item),
                              _buildRatingBar(item),
                              _buildReleaseDate(item),
                              _buildMovieLength(item),
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                },
              );
            }).toList(),
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Text(genre, style: const TextStyle(fontWeight: FontWeight.bold)),
        ),
      ],
    );
  }

  Widget _buildGradientOverlay() {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(200, 0, 0, 0), Color.fromARGB(0, 0, 0, 0)],
            begin: Alignment.bottomCenter,
            end: Alignment.topCenter,
          ),
        ),
        padding: const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20.0),
      ),
    );
  }

  Widget _buildTitle(Movie item) {
    return Positioned(
      bottom: 0.0,
      left: 0.0,
      right: 0.0,
      child: Center(
        child: Stack(
          children: [
            Text(
              item.title ?? '',
              style: TextStyle(
                fontSize: 20,
                foreground: Paint()
                  ..strokeWidth = 4
                  ..style = PaintingStyle.stroke
                  ..strokeJoin = StrokeJoin.round
                  ..color = Colors.white,
              ),
            ),
            Text(item.title ?? '', style: const TextStyle(fontSize: 20, color: Colors.orange)),
          ],
        ),
      ),
    );
  }

  Widget _buildClassificationBadge(Movie item) {
    return Positioned(
      top: 2,
      right: 10,
      child: SimplesClassificationBedge(classificationSize: 22, classificationOpacity: 0.7, movie: item, fontSize: 9.0),
    );
  }

  Widget _buildRatingBar(Movie item) {
    return Positioned(
      bottom: 4,
      left: 10,
      child: RatingBarIndicator(
        rating: (item.imdbRating ?? 0) / 2,
        itemBuilder: (context, index) => const Icon(Icons.star, color: Colors.amber),
        unratedColor: Colors.white,
        itemCount: 5,
        itemSize: 15.0,
        direction: Axis.horizontal,
      ),
    );
  }

  Widget _buildReleaseDate(Movie item) {
    return Positioned.fill(
      bottom: 4,
      right: 10,
      child: Align(
        alignment: Alignment.bottomRight,
        child: Text(item.releasedOn != null ? dateFormater(item.releasedOn!) : ''),
      ),
    );
  }

  Widget _buildMovieLength(Movie item) {
    return Positioned.fill(
      bottom: 4,
      child: Align(
        alignment: Alignment.bottomLeft,
        child: Text(item.length ?? ''),
      ),
    );
  }
}
                                                    
                            

            
    
