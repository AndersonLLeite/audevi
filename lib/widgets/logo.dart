import 'package:flutter/material.dart';

class Logo extends StatelessWidget {
  final bool isPrimary;
  final bool isMini;
  const Logo({
    super.key,
    this.isPrimary = false,
    this.isMini = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: isMini ? 170 : 200,
        width: isMini ? 250 : 300,
        child: Image.asset(
          isPrimary
              ? 'assets/images/logo-primary.png'
              : 'assets/images/logo.png',
        ));
  }
}
