import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:states_bloc/common/dialog_service.dart';
import 'package:states_bloc/eventbus/base_event.dart';
import 'package:states_bloc/eventbus/eventbus.dart';

class MessageNotifier extends StatefulWidget {
  final Widget child;

  const MessageNotifier({
    super.key,
    required this.child,
  });

  @override
  State<MessageNotifier> createState() => _MessageNotifierState();
}

class _MessageNotifierState extends State<MessageNotifier> {
  late EventBus _eventBus;
  late StreamSubscription _subscription;

  @override
  void initState() {
    super.initState();
    _eventBus = EventBus();
    _subscription = _eventBus.on<MessageEvent>().listen((event) {
      onEventFired(event);
    });
  }

  void onEventFired(MessageEvent event) {
    if (event.message != null) {
       DialogService.errorModal(context, event.message!);
      // showDialog(
      //   context: context,
      //   builder: (_) => Text(event.message!),
      // );
      // Timer(const Duration(seconds: 2), () {
      //   _eventBus.fire(const MessageEvent(null));
      //   print("abdelghani messageRecieved");
      // });
    }
  }

  @override
  Widget build(BuildContext context) {
    return widget.child;
  }
}
