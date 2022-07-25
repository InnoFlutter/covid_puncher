import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:covid_puncher/covid_puncher.dart';

void main() {
  const MethodChannel channel = MethodChannel('covid_puncher');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });
}
