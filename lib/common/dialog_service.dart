import 'dart:async';

import 'package:flutter/material.dart';
import 'package:states_bloc/eventbus/base_event.dart';
import 'package:states_bloc/eventbus/eventbus.dart';

/// Service to open dialogs
class DialogService {
  static void shareDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const CircularProgressIndicator(),
      barrierDismissible: false,
    );
  }

  static Future<void> errorModal(BuildContext context, String message) async {
    EventBus eventBus = EventBus();

    showDialog(
      context: context,
      builder: (_) => Text(message),
    );
     Timer(const Duration(seconds: 2), () {
      eventBus.fire(const MessageEvent(null));
      print("abdelghani messageRecieved");
      Navigator.pop(context);
    });
  }
}
