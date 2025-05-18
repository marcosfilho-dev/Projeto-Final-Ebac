
import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';



class LoginController {

TextEditingController loginController =TextEditingController();

TextEditingController passwordController =TextEditingController();

ValueNotifier<bool> enableLoginButton = ValueNotifier(false);

ValueNotifier<bool> keepLoggedIn = ValueNotifier(false);

ValueNotifier<bool> loginPage = ValueNotifier(false);



bool rememberMe = false;

SharedPreferences? _prefs;

LoginController(){


_initPrefs();


loginController.addListener(() {

_enableLoginButton();

},);

passwordController.addListener(() {

_enableLoginButton();

});

}

Future<void> logout() async {

await saveRememberMe(false);

// Lógica de logout aqui

// Navegue para a tela de login

}



Future<void> login(String email, String password) async {

// Lógica de autenticação aqui

if (rememberMe) {

await saveRememberMe(true);

}

// Navegue para a tela principal

}

Future<void> saveRememberMe(bool value) async {

rememberMe = value;

tryLogin();

await _prefs?.setBool('rememberMe', value);

}



Future<bool> loadRememberMe() async {

rememberMe = _prefs?.getBool('rememberMe') ?? false;

return rememberMe;

}

_initPrefs() async {

_prefs = await SharedPreferences.getInstance();

rememberMe = _prefs?.getBool('rememberMe') ?? false;

}

void _enableLoginButton(){

loginController.value.text.isNotEmpty &&

passwordController.value.text.isNotEmpty;


}



Future<bool> tryLogin() async{

//await saveRememberMe(true);

if(loginController.value.text == 'marcos'

&& passwordController.value.text == '1234'){

return true;

}

return false;

}


void setState(Null Function() param0) {}

}