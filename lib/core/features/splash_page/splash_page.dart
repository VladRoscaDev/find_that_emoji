import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:find_that_emoji/constants/image_assets.dart';
import 'package:find_that_emoji/core/features/menu/menu_page.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatelessWidget {
  static const routeName = '/';
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      durationInSeconds: 3,
      navigator: const MenuPage(),
      logo: Image.asset(ImageAssets.LOGO),
      logoWidth: 200,
      title: const Text(
        'Find that Emoji!',
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 40,
        ),
      ),
    );
  }
}
