import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../constants/constants.dart';

class GoogleLabs extends StatefulWidget {
  final String userAgent;
  const GoogleLabs({super.key, required this.userAgent});

  @override
  State<GoogleLabs> createState() => _GoogleLabsState();
}

class _GoogleLabsState extends State<GoogleLabs> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(Constants.googleLabsUrl)),
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
