import 'dart:convert';

import 'package:atividade_ebac_pre_projeto/common/Model/catalog.dart';
import 'package:atividade_ebac_pre_projeto/common/Model/utils.dart';
import 'package:atividade_ebac_pre_projeto/home/Controller/ihome_page_repository.dart';
import 'package:http/http.dart';

class HomePageRepository implements IHomePageRepository{
  final Client client;

  HomePageRepository(this.client);
  @override
  Future<Catalog> getMovie({String? searchTerm = ''})async{
    var url = Uri.https(
      baseUrl,
      urlMovies,
      {urlSearch: searchTerm},
    );

    var  response = await client.get(
      url,
      headers: <String, String>{
        authorization: bearer,
      },
    );

    final map = jsonDecode(response.body);

    return Catalog.fromJson(map);
  }
}