import 'package:atividade_ebac_pre_projeto/common/Model/appstyle.dart';
import 'package:atividade_ebac_pre_projeto/home/Controller/home_controller.dart';
import 'package:atividade_ebac_pre_projeto/home/Widgets/custom_carousel_slider.dart';
import 'package:atividade_ebac_pre_projeto/home/Widgets/recently_added.dart';
import 'package:flutter/material.dart';

class RecentlyAddedImplementation extends StatelessWidget {
  const RecentlyAddedImplementation({
    super.key,
    required this.title,
    required this.homePageController,
  });

  final String title;
  final HomePageController homePageController;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 0,
      child: Align(
        alignment: Alignment.topCenter,
        child: Container(
          color: AppStyle.mainBackground,
          child: ValueListenableBuilder<List<CustomCarouselSlider>>(
            valueListenable: homePageController.recentlyAdded,
            builder: (context, value, child) {
              final recentlyAddedList = homePageController.recentlyAdded.value;
              if (recentlyAddedList.isNotEmpty) {
                final firstCarousel = recentlyAddedList[1];
                return RecentlyAdded(
                  title: title,
                  homePageController: homePageController,
                  genre: firstCarousel.genre,
                  movies: firstCarousel.movies,
                  showGenre: true,
                );
              } else {
                return const SizedBox.shrink(); // Widget vazio em vez de SizedBox com dimensões zero
              }
            },
          ),
        ),
      ),
    );
  }
}