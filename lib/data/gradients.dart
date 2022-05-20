import 'package:flutter/material.dart';

// Gradient from https://learnui.design/tools/gradient-generator.html

class Gradients {
  static LinearGradient getSunriseGradient() {
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(0.8, 1),
      colors: <Color>[
        Color(0xff5c175b),
        Color(0xff81215f),
        Color(0xffa23260),
        Color(0xffbf485e),
        Color(0xffd7615c),
        Color(0xffea7e5a),
        Color(0xfff79d5b),
        Color(0xffffbd61),
      ],
      tileMode: TileMode.mirror,
    );
  }

  static LinearGradient getDayGradient() {
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(0.8, 1),
      colors: <Color>[
        Color(0xffd9c530),
        Color(0xff6dcf72),
        Color(0xff00c8ba),
        Color(0xff00f1c8),
        Color(0xff00b5de),
      ],
      tileMode: TileMode.mirror,
    );
  }

  static LinearGradient getSunsetGradient() {
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(0.8, 1),
      colors: <Color>[
        Color(0xff180c5c),
        Color(0xff4d0664),
        Color(0xff770067),
        Color(0xff9c0466),
        Color(0xffbc1c61),
        Color(0xffd8385a),
        Color(0xffef5551),
        Color(0xffff7547),
      ],
      tileMode: TileMode.mirror,
    );
  }

  static LinearGradient getNightGradient() {
    return const LinearGradient(
      begin: Alignment.topLeft,
      end: Alignment(0.8, 1),
      colors: <Color>[
        Color(0xff1f005c),
        Color(0xff280471),
        Color(0xff300b87),
        Color(0xff39139d),
        Color(0xff401cb5),
        Color(0xff4824cd),
        Color(0xff4e2de6),
        Color(0xff5436ff),
      ],
      tileMode: TileMode.mirror,
    );
  }
}
