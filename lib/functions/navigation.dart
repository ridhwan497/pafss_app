
import 'package:flutter/material.dart';

void navigateTo(BuildContext context, Widget screen) {
    
    Navigator.push(
      context, 
      PageRouteBuilder(
        pageBuilder: (_, _, _) => screen,
        transitionDuration: Duration.zero,
        reverseTransitionDuration: Duration.zero
        )
      );
}