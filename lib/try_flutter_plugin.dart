
import 'try_flutter_plugin_platform_interface.dart';

class TryFlutterPlugin {
  Future<String?> getPlatformVersion() {
    return TryFlutterPluginPlatform.instance.getPlatformVersion();
  }
}
