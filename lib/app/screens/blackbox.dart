import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../constants/constants.dart';

class Blackbox extends StatefulWidget {
  final String userAgent;
  const Blackbox({super.key, required this.userAgent});

  @override
  State<Blackbox> createState() => _BlackboxState();
}

class _BlackboxState extends State<Blackbox> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(Constants.blackboxUrl)),
            initialOptions: InAppWebViewGroupOptions(
              crossPlatform: InAppWebViewOptions(
                userAgent: widget.userAgent,
                mediaPlaybackRequiresUserGesture: false,
                cacheEnabled: true,
                javaScriptEnabled: true,
                useShouldInterceptFetchRequest: true,
                preferredContentMode: UserPreferredContentMode.MOBILE,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
