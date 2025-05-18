import 'package:atividade_ebac_pre_projeto/common/Model/movie.dart';
import 'package:atividade_ebac_pre_projeto/home/Controller/home_controller.dart';

class Arguments {
  final String tag;
  final String title;
  final Movie movie;
  final HomePageController homePageController;

  Arguments({
    required this.tag,
    required this.title,
    required this.movie,
    required this.homePageController,
  });
}