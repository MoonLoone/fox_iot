import 'package:flutter/services.dart';

const _channel = const EventChannel("get_device_info");

typedef void Listener(dynamic msg);
typedef void CancelListening();

CancelListening startListening(Listener listener, Map<String, String> args) {
  var subscription = _channel.receiveBroadcastStream(args).listen(
      listener, cancelOnError: true);
  return () {
    subscription.cancel();
  };
}
