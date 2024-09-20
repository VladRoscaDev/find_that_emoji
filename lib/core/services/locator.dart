import 'package:find_that_emoji/core/services/app_router.dart';
import 'package:find_that_emoji/core/services/sound_service.dart';
import 'package:find_that_emoji/core/services/toast_service.dart';
import 'package:get_it/get_it.dart';

final GetIt locator = GetIt.instance;

void setupInjection() {
  locator.registerSingleton<AppRouter>(AppRouter());
  locator.registerSingleton<ToastService>(ToastService());
  locator.registerSingleton<SoundService>(SoundService());
}
