  import 'package:flutter/material.dart';

BoxDecoration fondDecoration() {
  return const BoxDecoration(
      gradient: LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [
      Colors.blueAccent,
      Colors.white,
    ],
  ));
}