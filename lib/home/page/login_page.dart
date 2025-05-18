import 'package:atividade_ebac_pre_projeto/common/Components/keep_logged_in.dart';
import 'package:atividade_ebac_pre_projeto/common/Components/login_fields.dart';
import 'package:atividade_ebac_pre_projeto/common/Components/login_image.dart';
import 'package:atividade_ebac_pre_projeto/common/Components/sing_in.dart';
import 'package:atividade_ebac_pre_projeto/home/Controller/login_controller.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  late LoginController _controller;
 

  @override
  void initState() {
   _controller = LoginController(); 
   
   
    super.initState();
    
  }
  
  
  @override
  void dispose() {
   _controller.loginController.dispose();
    _controller.passwordController.dispose(); 
    
    super.dispose();
    
  }
  
  
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
           const LoginImage(),
           Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            spacing: 10.0,
            children: [
              LoginFields(
                controller: _controller.loginController,
               label: 'Login',
               isPassword: false,
               ),
               LoginFields(
                controller: _controller.passwordController,
               label: 'password',
               isPassword: true,
               ),
               KeepLoggedIn(controller: _controller),
               SingIn(controller: _controller,),
              
            ],
           )
        ],
      ),
    );
  }
}



