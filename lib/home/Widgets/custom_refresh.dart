import 'package:atividade_ebac_pre_projeto/home/Controller/home_controller.dart';
import 'package:flutter/material.dart';

class CustomRefresh extends StatelessWidget{
  const CustomRefresh({
    super.key,
    required this.homePageController,
  });
  final HomePageController homePageController;
  @override
  Widget build(BuildContext context) {
    return Positioned(
      child: Center(
        child: ValueListenableBuilder(
          valueListenable: homePageController.isRefreshCustomOn, 
          builder: (context, value, child){
            return homePageController.isRefreshCustomOn.value
            ? Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.orange,
                borderRadius: BorderRadius.circular(100),
              ),
              child:  const Padding(
                padding: EdgeInsets.all(12.0),
                child:  CircularProgressIndicator(
                  color: Colors.orange,
                  backgroundColor: Colors.white,
                  strokeWidth: 2,
                ),
                ),
            )
            : const SizedBox();
          },
          ),
      ),
    );
  }
}