// ignore_for_file: deprecated_member_use
import 'package:atividade_ebac_pre_projeto/common/Model/appstyle.dart';
import 'package:atividade_ebac_pre_projeto/common/Model/classification_type.dart';
import 'package:atividade_ebac_pre_projeto/common/Model/movie.dart';
import 'package:flutter/material.dart';

class ClassificationBadge extends StatelessWidget {
  const ClassificationBadge({
    super.key,
    required this.classificationSize,
    required this.classificationOpacity,
    required this.movie,
    this.fontSize,
  });

  final double classificationSize;
  final double classificationOpacity;
  final Movie movie;
  final double? fontSize;

  Color _getClassificationColor(ClassificationType classification) {
    if (classification.value.compareTo(ClassificationType.the_7.value) == 0) {
      return Colors.green.withOpacity(classificationOpacity);
    } else if (classification.value.compareTo(ClassificationType.the_13.value) == 0) {
      return Colors.blue.withOpacity(classificationOpacity);
    } else {
      return AppStyle.mainBackground.withOpacity(classificationOpacity);
    }
  }

  @override
  Widget build(BuildContext context) {
    if (movie.classification == null) {
      return const SizedBox(); // ou outro widget de placeholder
    }

    final classificationColor = _getClassificationColor(movie.classification!);

    return Container(
      width: classificationSize,
      height: classificationSize,
      decoration: BoxDecoration(
        color: AppStyle.mainBackground.withOpacity(classificationOpacity),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Container(
          width: classificationSize - 3,
          height: classificationSize - 3,
          decoration: BoxDecoration(
            color: classificationColor,
            shape: BoxShape.circle,
          ),
          child: Center(
            child: Container(
              width: classificationSize - 8,
              height: classificationSize - 8,
              decoration: BoxDecoration(
                color: Colors.amber.withOpacity(classificationOpacity),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: classificationSize - 11,
                  height: classificationSize - 11,
                  decoration: BoxDecoration(
                    color: classificationColor,
                    shape: BoxShape.circle,
                  ),
                  child: Center(
                    child: Text(
                      ClassificationTypeTranslation.descriptionFromString(movie.classification!.value), // Obtenha o valor String
                      style: TextStyle(
                        fontSize: fontSize ?? 9,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}