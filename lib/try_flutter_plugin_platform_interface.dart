import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'try_flutter_plugin_method_channel.dart';

abstract class TryFlutterPluginPlatform extends PlatformInterface {
  /// Constructs a TryFlutterPluginPlatform.
  TryFlutterPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static TryFlutterPluginPlatform _instance = MethodChannelTryFlutterPlugin();

  /// The default instance of [TryFlutterPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelTryFlutterPlugin].
  static TryFlutterPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [TryFlutterPluginPlatform] when
  /// they register themselves.
  static set instance(TryFlutterPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
