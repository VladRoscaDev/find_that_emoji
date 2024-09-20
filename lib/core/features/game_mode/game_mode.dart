import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:find_that_emoji/common/buttons/card_button.dart';
import 'package:find_that_emoji/common/buttons/menu_button.dart';
import 'package:find_that_emoji/constants/animation_assets.dart';
import 'package:find_that_emoji/constants/image_assets.dart';
import 'package:find_that_emoji/core/extensions/context_extensions.dart';
import 'package:find_that_emoji/core/features/game/normal_game.dart';
import 'package:find_that_emoji/core/services/locator.dart';
import 'package:find_that_emoji/core/services/sound_service.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class GameMode extends StatelessWidget {
  static const routeName = '/gameMode';
  const GameMode({super.key});

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
            fit: BoxFit.cover),
      ),
      child: Column(
        children: [
          SizedBox(
              width: context.width,
              height: context.height * 0.3,
              child: Lottie.asset(AnimationAssets.SURPRISED)),
          _buildAnimatedText(),
          SizedBox(height: context.height * 0.05),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              CardButton(
                message: 'Normal Mode',
                callBackFunction: () {
                  locator.get<SoundService>().playButtonSound();
                  Navigator.of(context).pushNamed(NormalGame.routeName);
                  // Navigator.of(context).push(
                  //   SharedAxisPageRoute(
                  //     page: const LoadingPage(
                  //       newPage: NormalGamePage(),
                  //     ),
                  //   ),
                  // );
                },
                icon: const Icon(Icons.add_reaction,
                    color: Colors.white, size: 50),
              ),
              CardButton(
                message: 'Survival mode',
                callBackFunction: () {
                  locator.get<SoundService>().playButtonSound();
                },
                icon:
                    const Icon(Icons.more_time, color: Colors.white, size: 50),
              )
            ],
          ),
          const Spacer(),
          // _buildNormalModeButton(),
          // _buildSurvivalModeButton(),
          // _buildGodModeButton(),
          _buildBackButton(context),
          SizedBox(height: context.height * 0.1),
        ],
      ),
    ));
  }

  Padding _buildBackButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: MenuButton(
        message: 'Back',
        callBackFunction: () {
          locator.get<SoundService>().playButtonSound();
          Navigator.of(context).pop();
          // Navigator.of(context).push(SharedAxisPageRoute(
          //     page: const LoadingPage(
          //   newPage: MenuPage(),
          // )));
        },
      ),
    );
  }

  DefaultTextStyle _buildAnimatedText() {
    return DefaultTextStyle(
      style: const TextStyle(
          fontSize: 25, color: Colors.indigo, fontWeight: FontWeight.bold),
      child: AnimatedTextKit(
        animatedTexts: [
          WavyAnimatedText('Select a game mode!'),
        ],
        isRepeatingAnimation: true,
      ),
    );
  }
}
