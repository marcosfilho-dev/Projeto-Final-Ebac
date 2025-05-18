import 'package:atividade_ebac_pre_projeto/common/Model/catalog.dart';

abstract class IHomePageRepository {
  Future<Catalog> getMovie({String? searchTerm = ''});
}