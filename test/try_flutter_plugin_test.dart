import 'package:flutter_test/flutter_test.dart';
import 'package:try_flutter_plugin/try_flutter_plugin.dart';
import 'package:try_flutter_plugin/try_flutter_plugin_platform_interface.dart';
import 'package:try_flutter_plugin/try_flutter_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockTryFlutterPluginPlatform
    with MockPlatformInterfaceMixin
    implements TryFlutterPluginPlatform {
  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final TryFlutterPluginPlatform initialPlatform = TryFlutterPluginPlatform.instance;

  test('$MethodChannelTryFlutterPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelTryFlutterPlugin>());
  });

  test('getPlatformVersion', () async {
    TryFlutterPlugin tryFlutterPlugin = TryFlutterPlugin();
    MockTryFlutterPluginPlatform fakePlatform = MockTryFlutterPluginPlatform();
    TryFlutterPluginPlatform.instance = fakePlatform;

    expect(await tryFlutterPlugin.getPlatformVersion(), '42');
  });
}
