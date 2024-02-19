import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import '../../constants/constants.dart';
import 'package:aitools/app/screens/gpt.dart';
import 'package:aitools/app/screens/perplexity.dart';
import 'package:aitools/app/screens/phind.dart';
import 'package:aitools/app/screens/gemini.dart';
import 'package:aitools/app/screens/bobtailSearch.dart';
import 'package:aitools/app/screens/webLangChain.dart';
import 'package:aitools/app/screens/huggingChat.dart';
import 'package:aitools/app/screens/pi.dart';
import 'package:aitools/app/screens/iask.dart';
import 'package:aitools/app/screens/claude.dart';
import 'package:aitools/app/screens/deepl.dart';
import 'package:aitools/app/screens/andiSearch.dart';
import 'package:aitools/app/screens/cloudTTS.dart';
import 'package:aitools/app/screens/playHT.dart';
import 'package:aitools/app/screens/stablediffweb.dart';
import 'package:aitools/app/screens/clipdrop.dart';
import 'package:aitools/app/screens/gptGo.dart';
import 'package:aitools/app/screens/imagineMeta.dart';
import 'package:aitools/app/screens/komo.dart';
import 'package:aitools/app/screens/perplexityLabs.dart';
import 'package:aitools/app/screens/peruser.dart';
import 'package:aitools/app/screens/yep.dart';
import 'package:aitools/app/screens/leonardo.dart';
import 'package:aitools/app/screens/elevenlabs.dart';
import 'package:aitools/app/screens/craiyon.dart';
import 'package:aitools/app/screens/picfinder.dart';

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
                                      builder: (context) => BobtailSearch(
                                        userAgent: customUserAgent,
                                      ),
                                    ),
                                  );
                                },
                                child: const Text(
                                  AppStrings.bobtailSearch,
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
