import 'package:atividade_ebac_pre_projeto/home/Controller/login_controller.dart';
import 'package:flutter/material.dart';
import 'package:switcher/core/switcher_size.dart';
import 'package:switcher/switcher.dart';

class KeepLoggedIn extends StatelessWidget {
  const KeepLoggedIn({super.key, 
  required LoginController controller,
  
  }) : _controller = controller;



  final LoginController _controller;
  
  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20.0,0,0,20.0),
      child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text('permancer logado',
                    style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(width: 16.0),
                    Switcher(
                      value: 
                        _controller.keepLoggedIn.value || 
                        _controller.rememberMe,
                      size: SwitcherSize.large,
                      switcherButtonRadius: 50,
                      enabledSwitcherButtonRotate: true,
                      iconOff: Icons.lock,
                      iconOn: Icons.lock_open,
                      colorOff: Colors.blueGrey,
                      colorOn: Colors.blue,
                      onChanged: (bool state){
                        _controller.saveRememberMe;
                      _controller.keepLoggedIn.value = state;
                      
                      },
                    ),
                  ],
      ),
    );
  }
}
