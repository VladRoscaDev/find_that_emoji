import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:find_that_emoji/common/buttons/menu_button.dart';
import 'package:find_that_emoji/constants/animation_assets.dart';
import 'package:find_that_emoji/constants/image_assets.dart';
import 'package:find_that_emoji/core/features/game_mode/game_mode.dart';
import 'package:find_that_emoji/core/services/locator.dart';
import 'package:find_that_emoji/core/services/sound_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class MenuPage extends StatefulWidget {
  static const routeName = '/menuPage';
  const MenuPage({super.key});

  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  void initState() {
    super.initState();
    locator.get<SoundService>().playBackgroundMusic();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            colorFilter: ColorFilter.srgbToLinearGamma(),
            image: AssetImage(ImageAssets.BACKGROUND),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Center vertically
          children: [
            Lottie.asset(AnimationAssets.SURPRISED),
            _buildAnimatedText(),
            _buildNewGameButton(context),
            _buildSettingsButton(context),
            _buildHighScoresButton(),
            _buildExitButton(),
          ],
        ),
      ),
    );
  }

  DefaultTextStyle _buildAnimatedText() {
    return DefaultTextStyle(
      style: const TextStyle(
          fontSize: 25,
          color: Color.fromARGB(255, 50, 75, 216),
          fontWeight: FontWeight.bold),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText('Find that emoji!'),
        ],
        isRepeatingAnimation: true,
      ),
    );
  }

  Padding _buildExitButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MenuButton(
          message: 'Exit',
          callBackFunction: () {
            locator.get<SoundService>().stopBackgroundMusic();
            locator.get<SoundService>().playButtonSound();
            // settingsProvider.isSoundEnabled
            //     ? SoundProvider.playButtonSound()
            //     : null;
          }),
    );
  }

  Padding _buildHighScoresButton() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MenuButton(
          message: 'High scores',
          callBackFunction: () {
            locator.get<SoundService>().playButtonSound();
            // settingsProvider.isSoundEnabled
            //     ? SoundProvider.playButtonSound()
            //     : null;
          }),
    );
  }

  Padding _buildSettingsButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MenuButton(
          message: 'Settings',
          callBackFunction: () {
            locator.get<SoundService>().playButtonSound();
            // settingsProvider.isSoundEnabled
            //     ? SoundProvider.playButtonSound()
            //     : null;
            // Navigator.of(context)
            //     .push(SharedAxisPageRoute(page: const SettingsPage()));
          }),
    );
  }

  Padding _buildNewGameButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MenuButton(
          message: 'New game',
          callBackFunction: () {
            locator.get<SoundService>().playButtonSound();
            Navigator.of(context).pushNamed(GameMode.routeName);
          }),
    );
  }
}
