import 'package:atividade_ebac_pre_projeto/common/Model/appstyle.dart';
import 'package:atividade_ebac_pre_projeto/home/Controller/home_controller.dart';
import 'package:atividade_ebac_pre_projeto/home/Widgets/custom_carousel_slider.dart';
import 'package:flutter/cupertino.dart';
 
class CatalogList extends StatelessWidget {
 const CatalogList({
  super.key,
  required this.title,
  required this.homePageController,
});

final String title;
final HomePageController homePageController;

@override
Widget build(BuildContext context) {
  return Positioned.fill(
    top: homePageController.recentlyAdded.value.isNotEmpty ? 180 : 0,
    child: Align(
      alignment: Alignment. topCenter,
      child: Center(
        child: ValueListenableBuilder<List<CustomCarouselSlider>>(
          valueListenable: homePageController.customCarouselSliders,
          builder: (context, value, child) {
            return Stack(
              children: [
                Container(
                  color: AppStyle.mainBackground,
                  height: double. infinity,
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount:
                    homePageController.customCarouselSliders.value.length,
                    itemBuilder: (_, index) {
                      var items = homePageController
                      .customCarouselSliders.value[index];
                      return Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child: CustomCarouselSlider(
                          title: title,
                          genre: items.genre,
                          initialPage: items.initialPage,
                          movies: items.movies,
                          showGenre: true,
                          homePageController: homePageController,
                          ),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
           ),
        ),
      ),
    );
  }
}