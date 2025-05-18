import 'package:flutter/material.dart';

class LoginImage extends StatelessWidget {
  const LoginImage({
    super.key,
  });
  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 65,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 35),
        child: Image.asset(
        'assets/logo_movie.png',
        color: Colors.white,
        width: 200,
    ),
      ),
    );
  }
}