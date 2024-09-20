import 'package:find_that_emoji/core/features/splash_page/splash_page.dart';
import 'package:find_that_emoji/core/services/app_router.dart';
import 'package:find_that_emoji/core/services/locator.dart';
import 'package:find_that_emoji/core/services/sound_service.dart';
import 'package:flutter/material.dart';
import 'package:flex_color_scheme/flex_color_scheme.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  setupInjection();
  WidgetsFlutterBinding.ensureInitialized();
  locator.get<SoundService>().initAudioCache();
  SystemChrome.setPreferredOrientations(
      <DeviceOrientation>[DeviceOrientation.portraitUp]);
  runApp(FindThatEmoji(appRouter: AppRouter()));
}

class FindThatEmoji extends StatefulWidget {
  const FindThatEmoji({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  State<FindThatEmoji> createState() => _FindThatEmojiState();
}

class _FindThatEmojiState extends State<FindThatEmoji> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const SplashPage(),
      onGenerateRoute: widget.appRouter.onGenerateRoute,
      debugShowCheckedModeBanner: false,
      title: 'FindThatEmoji',
      theme: FlexThemeData.light(
          scheme: FlexScheme.purpleM3,
          fontFamily: GoogleFonts.permanentMarker().fontFamily),
    );
  }
}
