
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';

Widget webViewImpl(BuildContext context, String url) {
  final controller = WebViewController();
  return WebViewWidget(controller: controller);
}
