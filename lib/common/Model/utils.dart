import 'dart:convert';

import 'package:atividade_ebac_pre_projeto/common/Model/appstyle.dart';
import 'package:atividade_ebac_pre_projeto/common/Model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:shared_preferences/shared_preferences.dart';

UserModel? globalUser;
Future<bool> checkAlreadyLoggedIn() async{
  final prefs = await _startSharedPreferences();

if(!await _getKeepLoggedInValue(prefs)){
  return false;
}
  final userModel = prefs.getString('userModel');

  if(userModel == null || userModel.isEmpty){
    return false;
  }
  globalUser = UserModel.fromJson(jsonDecode(userModel)); 
  return false;
}
Future<bool> _getKeepLoggedInValue(SharedPreferences prefs)async{
    SharedPreferences prefs = await _startSharedPreferences();

    return prefs.getBool('keepLoggedIn') ?? false;
  }

  Future<SharedPreferences> _startSharedPreferences()async{
    final prefs = await SharedPreferences.getInstance();
    return prefs;
  }

  String dateFormater(DateTime dateTime,
  [Locale locate = const Locale('en', 'US')]){
    final DateFormat formatter = locate.languageCode == 'en'
    ? DateFormat('yyyy')
    :DateFormat('dd-MM-yyyy');
    final String formatted = formatter.format(dateTime);
    return formatted;
  }

  ThemeData themeData(bool isDarkTheme, BuildContext context){
    return ThemeData(
      primarySwatch: Colors.orange,
      visualDensity:  VisualDensity.adaptivePlatformDensity,
      primaryColor: AppStyle.mainColor,
      textTheme: const TextTheme(
        bodyLarge: TextStyle(color: AppStyle.mainColor),
        bodyMedium: TextStyle(color: AppStyle.mainColor),
      ),
      primaryTextTheme: const TextTheme(
        titleLarge: TextStyle(
          color: AppStyle.mainColor, fontSize: 18, fontWeight: FontWeight.bold),
          bodyMedium: TextStyle(color: AppStyle.mainColor),
          displaySmall: TextStyle(color: AppStyle.mainColor),
      ),
    );
  }

  const baseUrl = 'wookie.codesubmit.io';
  const urlMovies = '/movies';
  const urlSearch = 'q';

  const authorization = 'Authorization';
  const bearer = 'Bearer Wookie2021';
  


