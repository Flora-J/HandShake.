import 'package:flutter/material.dart';

Widget logo(Size size) {
    return Image.asset (
      "images/logo-handshake.png",
      fit: BoxFit.contain,
      height: size.shortestSide,
      width: size.shortestSide,
      alignment: Alignment.center,
    );
  }