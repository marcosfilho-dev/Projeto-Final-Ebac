import 'package:atividade_ebac_pre_projeto/home/Controller/login_controller.dart';

import 'package:flutter/material.dart';

import 'package:toastification/toastification.dart';



class SingIn extends StatelessWidget {

const SingIn({

super.key,

required LoginController controller,

}) : _controller = controller;



final LoginController _controller;



@override

Widget build(BuildContext context) {

return ToastificationWrapper(

child: ValueListenableBuilder(

valueListenable: _controller.enableLoginButton,

builder: (context, value, child) {

return ElevatedButton(

onPressed: _controller.enableLoginButton.value

? null

: ()async{

if (await _controller.tryLogin()){

// ignore: use_build_context_synchronously

_controller.login('', '');

Navigator.of(context).pushNamedAndRemoveUntil(

'/homePage', (Route<dynamic> route)=> true);

toastification.show(

// ignore: use_build_context_synchronously

context: context,

title: const Text('acesso permitido'),

autoCloseDuration: const Duration( seconds: 2),

);

//print('acesso permetido');

}else{

toastification.show(

// ignore: use_build_context_synchronously

context: context,

title: const Text('acesso negado'),

autoCloseDuration: const Duration( seconds: 2),

);

//print('erro ao logar');


}


},

style: ElevatedButton.styleFrom(

textStyle: const TextStyle(fontSize: 20),

),

child:const Padding(

padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),

child: Text('Entrar'),

),


);

},


),

);

}

}
