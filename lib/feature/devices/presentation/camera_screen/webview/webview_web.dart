
import 'package:flutter/cupertino.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:webview_flutter_web/webview_flutter_web.dart';
import 'package:webview_flutter_platform_interface/src/platform_webview_controller.dart';

Widget webViewImpl(BuildContext context, String url){
  final params = _getParams();
  return WebWebViewWidget(params).build(context);
}

PlatformWebViewWidgetCreationParams _getParams(){
  final controller = PlatformWebViewController(PlatformWebViewControllerCreationParams());
  return PlatformWebViewWidgetCreationParams(
      controller: controller
  );
}

