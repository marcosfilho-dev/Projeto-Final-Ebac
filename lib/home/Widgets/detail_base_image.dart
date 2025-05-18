import 'package:atividade_ebac_pre_projeto/common/Model/appstyle.dart';
import 'package:atividade_ebac_pre_projeto/common/Model/arguments.dart';
import 'package:flutter/material.dart';

class DetailBaseImage  extends StatelessWidget{
  const DetailBaseImage({
    super.key,
    required this.arguments,
    required this.crossFade,
  });

  final Arguments arguments;
  final ValueNotifier<bool> crossFade;

  @override
  Widget build(BuildContext context){
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Hero(
            tag: arguments.tag, 
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.amber,
                //border: Border.all(Colors.orange,width: 3.0),
                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                boxShadow: [
                  BoxShadow(
                    blurRadius: 10,
                    color: AppStyle.mainBackground,
                    offset: Offset(1,3)
                  )
                ]
              ),
              child: ValueListenableBuilder(
                valueListenable: crossFade, 
                builder: (context, value, child)=> AnimatedCrossFade(
                  duration: const Duration(milliseconds: 1500),
                  reverseDuration: const Duration(milliseconds: 1500),
                  firstCurve: Curves.decelerate,
                  secondCurve: Curves.easeInOut,
                  sizeCurve: Curves.decelerate,
                  firstChild: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(AppStyle.roundAllCorners)
                    ),
                    child: Image.network(
                      arguments.movie.backdrop!,
                      fit: BoxFit.cover,
                      width: 200,
                      height: 300,
                    ),
                  ),
                  secondChild: ClipRRect(
                    borderRadius: const BorderRadius.all(
                      Radius.circular(AppStyle.roundAllCorners)
                    ),
                    child: Image.network(
                      arguments.movie.poster!,
                      fit: BoxFit.cover,
                      width: 100,
                      height: 200,
                    ),
                  ),
                  crossFadeState: crossFade.value
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
                ),
                ),
            ),
            ),
            ValueListenableBuilder(
              valueListenable: crossFade,
               builder: (context, value, child)=> Opacity(
                opacity: crossFade.value ? 1 : 0,
                child: Text(
                  arguments.movie.genres!.join(', '),
                  style: const TextStyle(
                    color: Colors.amber,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ))

        ],
      ),
    );
  }
}