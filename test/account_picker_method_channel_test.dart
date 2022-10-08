import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:account_picker/account_picker_method_channel.dart';

void main() {
  MethodChannelAccountPicker platform = MethodChannelAccountPicker();
  const MethodChannel channel = MethodChannel('account_picker');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
