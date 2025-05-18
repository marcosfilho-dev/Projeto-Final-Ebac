import 'package:atividade_ebac_pre_projeto/home/page/home_page.dart';
import 'package:flutter/material.dart' ;

import 'package:atividade_ebac_pre_projeto/common/Model/utils.dart';
//import 'package:atividade_ebac_pre_projeto/home/page/home_page.dart';
import 'package:atividade_ebac_pre_projeto/home/page/login_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await checkAlreadyLoggedIn();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    const String title = 'Ebac Movies';
    return MaterialApp(
      title: title,
      theme: ThemeData.dark(),
      home: globalUser == null
      ? const  LoginPage()
      : const HomePage(title: title,
      ),
      routes: <String, WidgetBuilder>{
        '/loginPage': (BuildContext context) =>  const LoginPage(),
        '/homePage': (BuildContext context) => const HomePage(title: title,),
      },
    );
  }
}

