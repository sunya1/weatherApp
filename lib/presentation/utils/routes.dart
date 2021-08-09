import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:weather/presentation/screens/main/screen.dart';





class Routes{
  Route goToMain() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) =>  MainScreen(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(1.0, 0.0);
        var end = Offset.zero;
        var curve = Curves.ease;

        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }

}