import 'package:cart/view/cart.dart';
import 'package:flutter/material.dart';
import 'package:path/path.dart';

Route transition(){
  return  PageRouteBuilder(
      pageBuilder: ( context, animation,  secondaryAnimation) =>Cart(),
      transitionsBuilder: (context, animation, secondaryAnimation, child){
        var tween = Tween(begin: const Offset(0.0,-1.0),end: const Offset(0.0,-0.5));
        var drive = animation.drive(tween);
        return SlideTransition(position: drive,child: child,);
      } );

}