import 'package:audevi/widgets/button.dart';
import 'package:audevi/widgets/logo.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:audevi/ui/styles/colors_app.dart';
import 'package:audevi/ui/styles/text_styles.dart';

class SplashPage extends StatelessWidget {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, '/about');
      },
      child: Scaffold(
        backgroundColor: context.colors.primary,
        body: Center(
          child: Logo(),
        ),
      ),
    );
  }
}
