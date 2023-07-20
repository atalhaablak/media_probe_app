import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

// // TODO: ÇALIŞMIYOR
class ContractsWebView extends StatefulWidget {
  const ContractsWebView({super.key, required this.data});
  final String data;

  @override
  State<ContractsWebView> createState() => _ContractsWebViewState();
}

class _ContractsWebViewState extends State<ContractsWebView> {
  late WebViewController _controller;

  Uri get uri => Uri.http("www.nytimes.com", "/2023/07/15/opinion/writers-actors-strike.html");

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(uri);
  }

  final Set<Factory<EagerGestureRecognizer>> gestureRecognizers = {Factory(() => EagerGestureRecognizer())};

  @override
  Widget build(BuildContext context) {
    return WebViewWidget(
      controller: _controller,
      gestureRecognizers: gestureRecognizers,
    );
  }
}
