import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:vrview/vrview.dart';

void main() {
  const MethodChannel channel = MethodChannel('vrview');

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

//  test('getPlatformVersion', () async {
//    expect(await Vrview.platformVersion, '42');
//  });
}
