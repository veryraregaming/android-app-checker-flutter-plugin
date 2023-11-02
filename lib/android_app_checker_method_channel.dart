import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'android_app_checker_platform_interface.dart';

/// An implementation of [AndroidAppCheckerPlatform] that uses method channels.
class MethodChannelAndroidAppChecker extends AndroidAppCheckerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('android_app_checker');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
