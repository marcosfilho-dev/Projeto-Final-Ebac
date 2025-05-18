import 'package:atividade_ebac_pre_projeto/common/Model/arguments.dart';
import 'package:atividade_ebac_pre_projeto/common/Model/movie.dart';
import 'package:atividade_ebac_pre_projeto/home/Controller/home_controller.dart';
import 'package:atividade_ebac_pre_projeto/home/Shared/imagem_item.dart';
import 'package:atividade_ebac_pre_projeto/home/page/movies_detail.dart';
import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({
    super.key,
    required this.index,
    required this.title,
    required this.movie,
    required this.color,
    required this.homePageController,
    required this.indexSelectedContainer,
    required this.sizeSelectedContainer,
    required this.itemFocusNode,
  });

  final int index;
  final String title;
  final Movie movie;
  final Color color;
  final HomePageController homePageController;
  final ValueNotifier<int> indexSelectedContainer;
  final ValueNotifier<double> sizeSelectedContainer;
  final ValueNotifier<FocusNode> itemFocusNode;

  @override
  Widget build(BuildContext context) {
    var tag = homePageController.generateTag();

    return ValueListenableBuilder<int>(
      valueListenable: indexSelectedContainer,
      builder: (context, value, _) {
        return InkWell(
          onTap: () async {
            if (indexSelectedContainer.value == index) {
              indexSelectedContainer.value = -1;
            } else {
              indexSelectedContainer.value = index;
              sizeSelectedContainer.value = 200;
            }
            itemFocusNode.value.requestFocus();
            await Future.delayed(const Duration(milliseconds: 700));

            await Navigator.push(
              context,
              PageRouteBuilder(
                transitionDuration: const Duration(milliseconds: 1500),
                reverseTransitionDuration: const Duration(milliseconds: 500),
                pageBuilder: (_, __, ___) => MovieDetail(
                  title: title,
                ),
                settings: RouteSettings(
                  arguments: Arguments(
                    tag: tag,
                    title: title,
                    homePageController: homePageController,
                    movie: movie,
                  ),
                ),
              ),
            );
          },
          focusNode: itemFocusNode.value,
          child: Container(
            width: indexSelectedContainer.value == index
                ? sizeSelectedContainer.value
                : MediaQuery.of(context).size.width / 2.5,
            margin: const EdgeInsets.symmetric(horizontal: 1.0),
            decoration: BoxDecoration(
              color: indexSelectedContainer.value == index ? Colors.amber : null,
            ),
            // ignore: unnecessary_null_comparison
            child: movie == null // Inversão da condição aqui
                ? _buildPlaceholderImage(context)
                : ImagemItem(movie: movie, tag: tag),
          ),
        );
      },
    );
  }

  Widget _buildPlaceholderImage(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width / 2.5,
      height: 200,
      color: Colors.grey[300],
      child: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.movie_creation_outlined),
            SizedBox(height: 8),
            Text(
              "Filme não disponível",
              style: TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}

