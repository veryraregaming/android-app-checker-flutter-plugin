import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'android_app_checker_method_channel.dart';

abstract class AndroidAppCheckerPlatform extends PlatformInterface {
  /// Constructs a AndroidAppCheckerPlatform.
  AndroidAppCheckerPlatform() : super(token: _token);

  static final Object _token = Object();

  static AndroidAppCheckerPlatform _instance = MethodChannelAndroidAppChecker();

  /// The default instance of [AndroidAppCheckerPlatform] to use.
  ///
  /// Defaults to [MethodChannelAndroidAppChecker].
  static AndroidAppCheckerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [AndroidAppCheckerPlatform] when
  /// they register themselves.
  static set instance(AndroidAppCheckerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
