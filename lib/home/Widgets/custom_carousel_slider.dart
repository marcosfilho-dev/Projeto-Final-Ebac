import 'package:atividade_ebac_pre_projeto/common/Model/movie.dart';
import 'package:atividade_ebac_pre_projeto/home/Controller/home_controller.dart';
import 'package:atividade_ebac_pre_projeto/home/Widgets/carousel_card.dart';
import 'package:flutter/material.dart' ;

class CustomCarouselSlider  extends StatefulWidget{
  const CustomCarouselSlider({
    super.key,
    required this.title,
    required this.genre,
    required this.showGenre,
    required this.initialPage,
    required this.movies,
    required this.homePageController,
    });
  
  final String title;
  final String genre;
  final bool showGenre;
  final int initialPage;
  final List<Movie> movies;
  final HomePageController homePageController;

  @override
  State<CustomCarouselSlider> createState() => _CustomCarouselSliderState();

}

class _CustomCarouselSliderState extends State<CustomCarouselSlider>{
  ValueNotifier<int> indexSelectedContainer = ValueNotifier(-1);
  ValueNotifier<double> sizeSelectedContainer = ValueNotifier(150);
  ValueNotifier<FocusNode> itemFocusNode = ValueNotifier(FocusNode());

  @override
  void initState(){
    super.initState();
  }
  @override
  void dispose(){
    indexSelectedContainer.dispose();
    sizeSelectedContainer.dispose();
    itemFocusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          widget.showGenre ? Text(widget.genre) : const SizedBox(),
          Padding(
            padding: EdgeInsets.only(top:  widget.showGenre ? 4 : 0),
            child: SizedBox(
              height: 120,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: widget.movies.length,
                itemBuilder: (_, index) {
                  var item = widget.movies[index];
                  return CarouselCard(
                    index: index,
                    title: widget.title,
                    movie: item,
                    color: Colors.orange,
                    homePageController: widget.homePageController,
                    indexSelectedContainer: indexSelectedContainer,
                    sizeSelectedContainer: sizeSelectedContainer,
                    itemFocusNode: itemFocusNode,
                  );
                },
              ),
            ),
          )
        ],
      )
    );
  }
  }
