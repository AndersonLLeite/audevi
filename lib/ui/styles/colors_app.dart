import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;
  // Avoid self isntance
  ColorsApp._();
  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

//073846
  Color get primary => const Color(0XFF073846);
  //#CFDBDF
  Color get secondary => const Color(0XFFCFDBDF);

  Color get tertiary => const Color(0XFFF19932);

  Color get titleColor => primary;

  Color get subtitleColor => secondary.withOpacity(0.5);
}

extension ColorAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}
