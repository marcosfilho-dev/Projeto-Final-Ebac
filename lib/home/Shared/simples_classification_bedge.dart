import 'package:atividade_ebac_pre_projeto/common/Model/appstyle.dart';
import 'package:atividade_ebac_pre_projeto/common/Model/classification_type.dart';
import 'package:atividade_ebac_pre_projeto/common/Model/movie.dart';
import 'package:flutter/material.dart';

class SimplesClassificationBedge extends StatelessWidget{
  const SimplesClassificationBedge({
    super.key,
    required this.classificationSize,
    required this.classificationOpacity,
    required this.movie,
    this.fontSize,
  });

  final double classificationSize;
  final double? fontSize;
  final double classificationOpacity;
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      width:  classificationSize,
      height: classificationSize,
      decoration:  BoxDecoration(
        color: movie.classification!.value
        .compareTo(ClassificationType.the_7.value) == 
        0
        
        ? Colors.green.withOpacity(classificationOpacity)
        : movie.classification!.value
        .compareTo(ClassificationType.the_13.value) == 
        0
        
        ? Colors.blue.withOpacity(classificationOpacity)
        
        : AppStyle.mainBackground.withOpacity(classificationOpacity),
        borderRadius: BorderRadiusDirectional.circular(50)),
        child: Center(
          child: Text(
            ClassificationTypeTranslation.descriptionFromClassificationType(
              movie.classification! ,
            ),
            style: TextStyle(
              fontSize: fontSize ?? 9,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
    );
  }
}