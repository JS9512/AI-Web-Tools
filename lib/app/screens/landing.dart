import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../constants/constants.dart';
import 'package:aiwebtools/app/screens/gpt.dart';
import 'package:aiwebtools/app/screens/perplexity.dart';
import 'package:aiwebtools/app/screens/phind.dart';
import 'package:aiwebtools/app/screens/gemini.dart';
import 'package:aiwebtools/app/screens/googleLabs.dart';
import 'package:aiwebtools/app/screens/bobtail.dart';
import 'package:aiwebtools/app/screens/leptonSearch.dart';
import 'package:aiwebtools/app/screens/thinkAny.dart';
import 'package:aiwebtools/app/screens/webLangChain.dart';
import 'package:aiwebtools/app/screens/huggingChat.dart';
import 'package:aiwebtools/app/screens/mistral.dart';
import 'package:aiwebtools/app/screens/blackbox.dart';
import 'package:aiwebtools/app/screens/groq.dart';
import 'package:aiwebtools/app/screens/poe.dart';
import 'package:aiwebtools/app/screens/pi.dart';
import 'package:aiwebtools/app/screens/iask.dart';
import 'package:aiwebtools/app/screens/claude.dart';
import 'package:aiwebtools/app/screens/deepl.dart';
import 'package:aiwebtools/app/screens/andiSearch.dart';
import 'package:aiwebtools/app/screens/cloudTTS.dart';
import 'package:aiwebtools/app/screens/playHT.dart';
import 'package:aiwebtools/app/screens/stablediffweb.dart';
import 'package:aiwebtools/app/screens/clipdrop.dart';
import 'package:aiwebtools/app/screens/gptGo.dart';
import 'package:aiwebtools/app/screens/imagineMeta.dart';
import 'package:aiwebtools/app/screens/komo.dart';
import 'package:aiwebtools/app/screens/perplexityLabs.dart';
import 'package:aiwebtools/app/screens/adrenaline.dart';
import 'package:aiwebtools/app/screens/peruser.dart';
import 'package:aiwebtools/app/screens/yep.dart';
import 'package:aiwebtools/app/screens/leonardo.dart';
import 'package:aiwebtools/app/screens/lalal.dart';
import 'package:aiwebtools/app/screens/elevenlabs.dart';
import 'package:aiwebtools/app/screens/craiyon.dart';
import 'package:aiwebtools/app/screens/picfinder.dart';

class Landing extends StatefulWidget {
  const Landing.aitools({super.key});

  @override
  State<Landing> createState() => _LandingState();
}

class _LandingState extends State<Landing> {
  InAppWebViewController? webViewController;
  bool permissionGranted = false;
  final String customUserAgent =
      'Mozilla/5.0 (Linux; Android  11; Pixel  5 Build/RQ1A.210205.004; wv) AppleWebKit/537.36 (KHTML,like Gecko) Chrome/120.0.6099.230 Safari/537.36';

  @override
  void initState() {
    _getStoragePermission();
    _getCameraAndMicrophonePermissions();
    super.initState();
  }

  Future<void> _getCameraAndMicrophonePermissions() async {
    var cameraStatus = await Permission.camera.status;
    var micStatus = await Permission.microphone.status;

    if (!cameraStatus.isGranted) {
      await Permission.camera.request();
    }
    if (!micStatus.isGranted) {
      await Permission.microphone.request();
    }

    // Set state accordingly based on the permission status
    setState(() {
      permissionGranted = cameraStatus.isGranted && micStatus.isGranted;
    });
  }

  Future _getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      setState(() {
        permissionGranted = true;
      });
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      setState(() {
        permissionGranted = false;
      });
    }
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topRight,
                end: Alignment.bottomLeft,
                colors: [Colors.blue, Colors.green],
              ),
            ),
            child: LayoutBuilder(
                builder: (BuildContext context, BoxConstraints constraints) {
              return SingleChildScrollView(
                child: ConstrainedBox(
                  constraints: BoxConstraints(minHeight: constraints.maxHeight),
                  child: IntrinsicHeight(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        // Added heading
                        const Center(
                          child: Text(
                            AppStrings.heading,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: FontSize.fs30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(height: AppSize.as10),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Gpt(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.chatGpt,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Phind(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.phind,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Perplexity(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.perplexity,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PerplexityLabs(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.perplexityLabs,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Mistral(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.mistral,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Gemini(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.gemini,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GoogleLabs(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.googleLabs,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Claude(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.claude,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Poe(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.poe,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Adrenaline(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.adrenaline,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Bobtail(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.bobtail,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => LeptonSearch(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.leptonSearch,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ThinkAny(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.thinkAny,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => WebLangChain(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.webLangChain,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => huggingChat(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.huggingChat,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Blackbox(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.blackbox,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Groq(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.groq,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Pi(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.pi,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => GptGo(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.gptGo,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AndiSearch(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.andiSearch,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Komo(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.komo,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Yep(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.yep,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Peruser(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.perUser,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Iask(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.iAsk,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Deepl(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.deepl,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PicFinder(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.picFinder,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Craiyon(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.craiyon,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Leonardo(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.leonardo,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ImagineMeta(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.imagineMeta,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Clipdrop(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.clipdrop,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => StableDiff(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.stableDiffWeb,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Lalal(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.lalal,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => ElevenLabs(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.elevenLabs,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => CloudTTS(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.cloudTTS,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: AppSize.as10,
                        ),
                        Center(
                          child: Container(
                            height: AppSize.as40,
                            width: AppSize.as130,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(
                                AppPadding.ap10,
                              ),
                            ),
                            child: Center(
                              child: InkWell(
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => PlayHT(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.playHT,
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: FontSize.fs14,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            })));
  }
}
