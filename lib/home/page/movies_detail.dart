// ignore_for_file: deprecated_member_use

import 'package:atividade_ebac_pre_projeto/common/Model/appstyle.dart';
import 'package:atividade_ebac_pre_projeto/common/Model/arguments.dart';
import 'package:atividade_ebac_pre_projeto/home/Shared/appBar_title.dart';
import 'package:atividade_ebac_pre_projeto/home/Shared/classification_widget.dart';
import 'package:atividade_ebac_pre_projeto/home/Widgets/detail_image.dart';
import 'package:flutter/material.dart';

class MovieDetail extends StatefulWidget{
  const MovieDetail({
    super.key,
    required this.title,
  });

  final String title;

  @override
  State<MovieDetail> createState() => _MovieDetailState();
}

class _MovieDetailState extends State<MovieDetail>{
  ValueNotifier<bool> crossFade = ValueNotifier(false);
  ValueNotifier<bool> printMovieDetail = ValueNotifier(false);
  final _globalkey = GlobalKey();

  Arguments extarctArguments(BuildContext constext){
    final arguments = ModalRoute.of(context)!.settings.arguments as Arguments;
    return arguments;
  }

  Future<void> startCrossFade() async{
    await Future.delayed(const Duration(milliseconds: 2500));
    crossFade.value = true;
  }

  @override
  void initState(){
    super.initState();
    startCrossFade();
  }
  @override
  void dispose(){
    crossFade.dispose();
    printMovieDetail.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context){
    Arguments arguments = extarctArguments(context);
    return WillPopScope(
     onWillPop: () async{
      if (arguments.movie.imdbRating! > 8.5){
        Navigator.pop(context,
        'the argument  Item Rating is ${arguments.movie.imdbRating}');
      }else {
        Navigator.pop(
        context, 'The Argument Item Title is ${arguments.movie.title}');
      }
      return true;
     },
     child: Scaffold(
      appBar: AppBar(
        toolbarHeight: 80,
        leadingWidth: 30,
        actions: [
          Container(
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
            ),
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Material(
              color: Colors.transparent,
              shape: const CircleBorder(),
              child: InkWell(
                splashColor: Colors.black,
                onTap: () async{
                  printMovieDetail.value = true;
                  await Future.delayed(const Duration(milliseconds: 2000));
                  await arguments.homePageController.capturePng(_globalkey);
                  printMovieDetail.value = false;
                },
                customBorder: const CircleBorder(),
                child: Ink(
                  decoration: const BoxDecoration(shape: BoxShape.circle),
                  height: 50,
                  width: 50,
                  child: const Icon(Icons.share,
                  color: Colors.white,
                  ),
                ),
              ),
            ),
          )
        ],
        title: SizedBox(
          height: 80,
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                AppBarTitle(title: widget.title),
              ],
            ),
            ),
        ),
      ),
      body: Column(
        mainAxisSize: MainAxisSize.max,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RepaintBoundary(
            key: _globalkey,
          child: Stack(
            children: [
              DetailImage(arguments: arguments, crossFade: crossFade),
              ClassificationWidget(
                crossFade: crossFade,
                movie: arguments.movie,
                classificationOpacity: 0.9,
                classificationSize: 43,
              ),
              ValueListenableBuilder(
                valueListenable: printMovieDetail, 
                builder: (context, value, child){
                  return printMovieDetail.value
                  ? Positioned(
                    top: 100,
                    left: 130,
                    child: Center(
                      child: Image.asset(
                        'assets/dog2.jpeg',
                        height: 150,
                        opacity: const AlwaysStoppedAnimation(0.3),
                      ),
                    ),
                  )
                  :const SizedBox();
                },
                ),
            ],
          ),
          ),
          Expanded(
            child: Container(
              color: AppStyle.mainBackground,
            ),
          )
        ],
      ),
     ),
     );


  }
}