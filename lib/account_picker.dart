import 'dart:async';
import 'dart:io';

import 'package:flutter/services.dart';

class AccountPicker {
  static const MethodChannel _channel = const MethodChannel('account_picker');


  static Future<String?> getAccountEmailOrId() async {
    String? result;
    if (Platform.isAndroid) {
      result = await _channel.invokeMethod('requestEmailHint');
    } else if (Platform.isIOS) {
      result = await _channel.invokeMethod('requestAccountId');
    }
    return result;
  }

  ///
  /// Show the phone hint if available, it returns String
  /// If not available, it will never callback
  ///
  static Future<String> phoneHint() async {
    String result = "";
    if (Platform.isAndroid) {
      result = await _channel.invokeMethod('requestPhoneHint') ?? "";
    } else if (Platform.isIOS) {
      result = "Not available in iOS";
    }
    return result;
  }
}
