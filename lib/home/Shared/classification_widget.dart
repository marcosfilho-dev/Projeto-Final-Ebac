import 'package:atividade_ebac_pre_projeto/common/Model/movie.dart';
import 'package:atividade_ebac_pre_projeto/home/Shared/classification_badge.dart';
import 'package:flutter/material.dart';

class ClassificationWidget extends StatelessWidget {
  const ClassificationWidget({
    super.key,
    required this.movie,
    required this.crossFade,
    required this.classificationSize,
    required this.classificationOpacity,
  });

  final Movie movie;
  final double classificationSize;
  final double classificationOpacity;
  final ValueNotifier<bool> crossFade;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: crossFade,
      builder: (context, value, child) => AnimatedPositioned(
        duration: const Duration(milliseconds: 300), // Animação mais suave
        top: crossFade.value ? 5 : -100,
        right: crossFade.value
            ? MediaQuery.of(context).size.width - 210
            : -10,
        child: ClassificationBadge(
          classificationSize: classificationSize,
          classificationOpacity: classificationOpacity,
          movie: movie,
        ),
      ),
    );
  }
}