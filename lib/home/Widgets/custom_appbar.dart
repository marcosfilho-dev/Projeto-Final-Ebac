import 'package:atividade_ebac_pre_projeto/common/Model/appstyle.dart';
import 'package:atividade_ebac_pre_projeto/home/Controller/home_controller.dart';
import 'package:atividade_ebac_pre_projeto/home/Shared/appBar_title.dart';
import 'package:atividade_ebac_pre_projeto/home/Shared/appbar_rotation_icon.dart';
import 'package:atividade_ebac_pre_projeto/home/Shared/search_textfield.dart';
import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget{
  const CustomAppBar({
    super.key,
    required this.title,
    required this.homePageController,
  });
  
  final String title;
  final HomePageController homePageController;

  @override
  Widget build(BuildContext context) {
    // ignore: deprecated_member_use
    return WillPopScope(
      onWillPop: () async{
        Navigator.pop(context, 'The Argumento Item Title is $title');
        return true;
      },
      child: AppBar(
        toolbarHeight: 80,
        elevation: 2 ,
        shape: const Border(
          bottom: BorderSide(color: AppStyle.mainBackground, width: 2)),
          foregroundColor: AppStyle.mainBackground,
          title: SizedBox(
            height: 80,
            child: Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  AppBarTitle(title: title),
                  const Spacer(
                    flex: 1,
                  ),
                  Flexible(
                    flex: 2,
                    child: Row(
                      children: [
                        AppbarRotationIcon(homePageController: homePageController),
                        SearchTextfield(homePageController: homePageController),
                      ],
                    )
                  )
                ],
              ),
              ),
          )
        )
      );
    
  }
  @override
  Size get preferredSize => const Size.fromHeight(80);
}