import 'package:flutter/material.dart';
import 'dart:math' as mth;

Color getRandomColor() {
  return Color.fromARGB(
    70,
    mth.Random().nextInt(256),
    mth.Random().nextInt(256),
    mth.Random().nextInt(256),
  );
}
