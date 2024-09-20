import 'dart:math';

import 'package:find_that_emoji/core/extensions/context_extensions.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:awesome_emojis/emoji.dart' as emojiLibrary;
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
import 'package:find_that_emoji/core/services/locator.dart';
import 'package:find_that_emoji/core/services/sound_service.dart';
import 'package:flutter/material.dart';

class NormalGame extends StatelessWidget {
  static const routeName = '/normalGame';
  const NormalGame({super.key});

  @override
  Widget build(BuildContext context) {
    final countDownController = CountDownController();
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
                colorFilter: ColorFilter.srgbToLinearGamma(),
                image: AssetImage('assets/images/background.jpg'),
                fit: BoxFit.cover),
          ),
          child: Column(
            children: [
              _buildLifeIndicator(context),
              _buildRandomEmoji(context, countDownController),
              Spacer(),
              _buildEmojiPicker(context)
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildEmojiPicker(BuildContext context) {
    return const EmojiPicker(
      config: Config(
        emojiTextStyle: TextStyle(fontSize: 30),
      ),
    );
  }

  Widget _buildRandomEmoji(
      BuildContext context, CountDownController countDownController) {
    emojiLibrary.Emoji selectedEmoji = emojiLibrary.Emoji.all()
        .elementAt(Random().nextInt(emojiLibrary.Emoji.all().length))
        .newSkin(emojiLibrary.fitzpatrick.mediumLight);
    return Stack(
      children: [
        Center(
          child: CircularCountDownTimer(
            initialDuration: 0,
            width: context.width * 0.6,
            height: context.height * 0.45,
            duration: 5,
            fillColor: Colors.red,
            ringColor: Colors.indigo,
            isTimerTextShown: false,
            strokeWidth: 20,
            autoStart: true,
            isReverse: true,
            controller: countDownController,
          ),
        ),
        Column(
          children: [
            SizedBox(
              height: context.height * 0.15,
            ),
            Center(
              child: Text(
                '$selectedEmoji',
                style: const TextStyle(fontSize: 100),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildLifeIndicator(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              IconButton(
                iconSize: 40,
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon:
                    const Icon(Icons.pause_circle_filled, color: Colors.indigo),
              )
            ],
          ),
          const Row(
            children: [
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              Icon(
                Icons.favorite,
                color: Colors.red,
              ),
              Icon(
                Icons.favorite,
                color: Colors.red,
              )
            ],
          ),
        ],
      ),
    );
  }
}
