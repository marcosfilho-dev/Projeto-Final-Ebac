import 'dart:math' as math;

import 'package:atividade_ebac_pre_projeto/home/Controller/home_controller.dart';
import 'package:flutter/material.dart';

class AppbarRotationIcon extends StatelessWidget{
  const AppbarRotationIcon({
    super.key,
    required this.homePageController,
    });

    final HomePageController homePageController;

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: 180 * math.pi / 360,
      child: ValueListenableBuilder<bool>(
        valueListenable: homePageController.changeSearchIconColor,
        builder: (context, value, _){
          return Icon(
            Icons.search,
            size: 35,
            color: homePageController.changeSearchIconColor.value
            ? const Color.fromARGB(255, 242, 242, 242)
            :const Color.fromARGB(137, 247, 244, 244),
          );
        }
      ),
    );
  }
  
}