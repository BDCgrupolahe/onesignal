import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (!kIsWeb &&
      kDebugMode &&
      defaultTargetPlatform == TargetPlatform.android) {
    await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
  }
  runApp(const MaterialApp(home: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final GlobalKey webViewKey = GlobalKey();
  InAppWebViewController? webViewController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: [
                  InAppWebView(
                    key: webViewKey,
                    initialUrlRequest:
                        URLRequest(url: WebUri('https://congreso2024.colegiocmo.com.mx/?page_id=5998')),
                          onWebViewCreated: (controller) {
                          webViewController = controller;
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future onesignal() async {
    OSNotificationDisplayType.notification;
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    // OneSignal.initialize('8b9d80d1-fc6b-494e-bed6-2e9a14785de5');
    OneSignal.initialize('735329bb-a2c5-4de2-817e-91d261b9a494');
    OneSignal.Notifications.requestPermission(true);

  }
}



// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart'; // Importa el paquete services
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';

// Future main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   if (!kIsWeb &&
//       kDebugMode &&
//       defaultTargetPlatform == TargetPlatform.android) {
//     await InAppWebViewController.setWebContentsDebuggingEnabled(kDebugMode);
//   }
//   runApp(const MaterialApp(home: MyApp()));
// }

// class MyApp extends StatefulWidget {
//   const MyApp({Key? key}) : super(key: key);

//   @override
//   State<MyApp> createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   final GlobalKey webViewKey = GlobalKey();
//   InAppWebViewController? webViewController;

//   @override
//   Widget build(BuildContext context) {
//     // Cambiar el color de la status bar
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Color(0xFF2D749B)));

//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: Stack(
//                 children: [
//                   InAppWebView(
//                     key: webViewKey,
//                     initialUrlRequest:
//                         URLRequest(url: WebUri('https://congreso2024.colegiocmo.com.mx/?page_id=5998')),
//                     onWebViewCreated: (controller) {
//                       webViewController = controller;
//                     },
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

//   Future onesignal() async {
//     OSNotificationDisplayType.notification;
//     OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
//     OneSignal.initialize('91b22ad8-f541-4a2c-bf41-a307e088af08');
//     // OneSignal.initialize('735329bb-a2c5-4de2-817e-91d261b9a494');
//     OneSignal.Notifications.requestPermission(true);
//   }
// }
