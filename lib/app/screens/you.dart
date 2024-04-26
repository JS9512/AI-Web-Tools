import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../constants/constants.dart';

class You extends StatefulWidget {
  final String userAgent;
  const You({super.key, required this.userAgent});

  @override
  State<You> createState() => _YouState();
}

class _YouState extends State<You> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(Constants.youUrl)),
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
