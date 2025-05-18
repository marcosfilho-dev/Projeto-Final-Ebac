import 'dart:io';
import 'dart:math' as math;
import 'dart:ui';

import 'package:atividade_ebac_pre_projeto/common/Model/catalog.dart';
import 'package:atividade_ebac_pre_projeto/common/Model/movie.dart';
import 'package:atividade_ebac_pre_projeto/home/Controller/ihome_page_repository.dart';
import 'package:atividade_ebac_pre_projeto/home/Widgets/custom_carousel_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart' as path_provider;
import 'package:share_plus/share_plus.dart';

class HomePageController{
  final String title;
  final homeSearchController = TextEditingController();
  final detailSearchController = TextEditingController();
  final IHomePageRepository ihomePageRepository;

  ValueNotifier<bool> isLoading = ValueNotifier(false);
  ValueNotifier<bool> isRefreshCustomOn = ValueNotifier(false);
  ValueNotifier<bool> showCancelButtom = ValueNotifier(false);
  ValueNotifier<bool> changeSearchIconColor = ValueNotifier(false);
  ValueNotifier<FocusNode> searchFocusNode = ValueNotifier(FocusNode());
  ValueNotifier<List<String>> genreList = ValueNotifier([]);
  ValueNotifier<Catalog> fullCatalog = ValueNotifier(Catalog(movies: []));
  ValueNotifier<List<CustomCarouselSlider>> customCarouselSliders = 
  ValueNotifier([]);
  ValueNotifier<List<CustomCarouselSlider>> recentlyAdded = ValueNotifier([]);

  HomePageController({
    required this.title,
    required this.ihomePageRepository,
  }){
    searchFocusNode.value.addListener((){
      _searchFocusChange();

    });

    homeSearchController.addListener((){
      if(homeSearchController.value.text.isEmpty){
        showCancelButtom.value = false;
      } else {
        showCancelButtom.value = true;
      }
    });
  }

  get homePageController => this;

  Future<Catalog> getMovie({String? searchTerm = ''}) async{
    isRefreshCustomOn.value = false;

    final catalog = await ihomePageRepository.getMovie(searchTerm: searchTerm);
    await _processData(catalog, searchTerm);
    isRefreshCustomOn.value = false;
    return fullCatalog.value;
  }

  Future<void> _processData(Catalog catalog, String? searchTerm) async{
    fullCatalog.value = catalog;
    _generateGenreList(searchTerm);
    await _createGenreCarouselSlider(searchTerm == null || searchTerm.isEmpty);
    await Future.delayed(const Duration(seconds: 1));
  }

  void _generateGenreList(String? searchTerm){
    genreList.value = [];
    if(searchTerm == null || searchTerm.isEmpty){
      for (var movie in fullCatalog.value.movies!){
        for(var e in movie.genres!){
          if(!genreList.value.contains(e)){
            genreList.value.add(e);
          }
        }
      }
    }
  }

  Future<List<CustomCarouselSlider>> _createGenreCarouselSlider(
    bool showGenre)async{
      customCarouselSliders.value = [];
      recentlyAdded.value = [];

      if(fullCatalog.value.movies!.isEmpty){
        return [];
      }

      await _processGenreListData(showGenre);

      if(showGenre){
        fullCatalog.value.movies!
        .sort((a, b)=> b.releasedOn!.compareTo(a.releasedOn!));

        recentlyAdded.value.add(
          CustomCarouselSlider(
            title: title,
            genre: 'Recently added',
            showGenre: showGenre,
            initialPage: 0,
            homePageController: this,
            movies: fullCatalog.value.movies!.length<= 5
            ? fullCatalog.value.movies!
            :fullCatalog.value.movies!.take(5).toList()),
        );
      }

      customCarouselSliders.value
      .sort((a, b)=> b.movies.length.compareTo(a.movies.length));
      return customCarouselSliders.value;
    }

    Future<void> _processGenreListData(bool showGenre)async{
      if(showGenre){
        for(var genre in genreList.value){
          var movies = fullCatalog.value.movies!
          .where((element)=> element.genres!.contains(genre))
          .toList();

          List<Movie> movieList =[];
          for(var element in movies){
            movieList.add(
              element.copyWith(
                id: element.id,
                tag: DateTime.now().microsecondsSinceEpoch.toString(),
              ),
            );
          }

          customCarouselSliders.value.add(
            CustomCarouselSlider(
              title: title, 
              genre: genre, 
              showGenre: showGenre, 
              initialPage: math.Random().nextInt(movieList.length), 
              movies: movies, 
              homePageController: this,
              ),
          );
        }
      }else{
        List<Movie> movieList = [];
        for(var element in fullCatalog.value.movies!){
          movieList.add(
            element.copyWith(
              id: element.id,
              tag: DateTime.now().microsecondsSinceEpoch.toString(),
            ),
          );
        }

        customCarouselSliders.value.add(
          CustomCarouselSlider(
            title: title,
            genre: '',
            showGenre: showGenre,
            initialPage: math.Random().nextInt(movieList.length),
            movies: movieList,
            homePageController: this,
          ),
        );

        await Future.delayed(const Duration(milliseconds: 100));
      }
    }

    void _searchFocusChange(){
      changeSearchIconColor.value = changeSearchIconColor.value;
    }

    Future<void> executeSearch()async{
      isLoading.value = false;
      await getMovie(searchTerm: homeSearchController.value.text);
      isLoading.value = false;
    }

    void clearSearch()async{
      searchFocusNode.value.unfocus();
      homeSearchController.clear();
      await executeSearch();
    }
    String generateTag(){
      return DateTime.now().microsecondsSinceEpoch.toString();
    }

    
    Future<void> capturePng(GlobalKey globalKey)async{

      final RenderRepaintBoundary boundary =
      globalKey.currentContext!.findRenderObject()! as RenderRepaintBoundary;

      final image = await boundary.toImage();
       final ByteData? byteData = 
       await image.toByteData(format: ImageByteFormat.png);
      final Uint8List pngBytes = byteData!.buffer.asUint8List();
      final temp = await path_provider.getTemporaryDirectory();
      File tempImage = File("${temp.path}/tempimage.png");
      tempImage.writeAsBytesSync(pngBytes);
      if(kDebugMode){
        print(tempImage.path);
      }
      Share.shareFiles([tempImage.path]);
    }

    

}