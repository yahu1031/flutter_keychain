import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'flutter_keychain_method_channel.dart';

abstract class FlutterKeychainPlatform extends PlatformInterface {
  /// Constructs a FlutterKeychainPlatform.
  FlutterKeychainPlatform() : super(token: _token);

  static final Object _token = Object();

  static FlutterKeychainPlatform _instance = MethodChannelFlutterKeychain();

  /// The default instance of [FlutterKeychainPlatform] to use.
  ///
  /// Defaults to [MethodChannelFlutterKeychain].
  static FlutterKeychainPlatform get instance => _instance;
  
  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FlutterKeychainPlatform] when
  /// they register themselves.
  static set instance(FlutterKeychainPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
