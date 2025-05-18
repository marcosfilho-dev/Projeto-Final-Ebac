import 'package:atividade_ebac_pre_projeto/common/Model/custom_enum.dart';

class ClassificationType extends CustomEnum<String>{
  // ignore: use_super_parameters
  const ClassificationType._(String value) : super(value);
  static const ClassificationType the_7 = ClassificationType._('7+');
  static const ClassificationType the_13 = ClassificationType._('13+');
  static const ClassificationType the_18 = ClassificationType._('18+');
  static const ClassificationType notLoaded = ClassificationType._('not loaded');
}

class ClassificationTypeTranslation{
  static ClassificationType fromString(String value){
    switch(value){
      case '7+':
      return ClassificationType.the_7;
      case '13+':
      return ClassificationType.the_13;
      case '18+':
      return ClassificationType.the_18;
  }
  return ClassificationType.notLoaded;
  }

  static ClassificationType fromJson(dynamic value) =>
  fromString(value as String);

  static String toJson(ClassificationType value) => value.value.toString();

  static String descriptionFromString(String value){
    switch(value){
      case '7+':
      return '7+';
      case '13+':
      return '13+';
      case '18+':
      return '18+';
      default:
      return 'not loaded';
    }
  }
  static String descriptionFromClassificationType(ClassificationType value){
    switch(value){
      case ClassificationType.the_7:
      return '7+';
      case ClassificationType.the_13:
      return '13+';
      case ClassificationType.the_18:
      return '18+';
      default:
      return 'not loaded';
    }
  }

  static int intFromClassificationType(ClassificationType value){
    switch(value){
      case ClassificationType.the_7:
      return 1;
      case ClassificationType.the_13:
      return 2;
      case ClassificationType.the_18:
      return 3;
      default:
      return 4;
    }
  }

  static ClassificationType classificationTypeFromInt(int value){
    switch(value){
      case 1:
      return ClassificationType.the_7;
      case 2:
      return ClassificationType.the_13;
      case 3:
      return ClassificationType.the_18;
      default:
      return ClassificationType.notLoaded;
    }
  }
}