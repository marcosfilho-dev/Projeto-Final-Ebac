// ignore_for_file: file_names

import 'package:atividade_ebac_pre_projeto/common/Model/appstyle.dart';
import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget{
  const AppBarTitle({
    super.key,
    required this.title,
  });

  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        color: AppStyle.mainColor,
      ),
    );
  }
}