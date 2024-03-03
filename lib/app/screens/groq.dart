import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../constants/constants.dart';

class Groq extends StatefulWidget {
  final String userAgent;
  const Groq({super.key, required this.userAgent});

  @override
  State<Groq> createState() => _GroqState();
}

class _GroqState extends State<Groq> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SafeArea(
          child: InAppWebView(
            initialUrlRequest: URLRequest(url: WebUri(Constants.groqUrl)),
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
