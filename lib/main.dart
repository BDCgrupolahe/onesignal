import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:connectivity/connectivity.dart'; // Importa el paquete connectivity

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
  bool isConnected = true;

  @override
  void initState() {
    super.initState();
    checkConnectivity(); // Verificar la conexión al iniciar la aplicación
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Color(0xFF2D749B),
    ));

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Expanded(
              child: Stack(
                children: [
                  if (isConnected)
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
    OneSignal.initialize('735329bb-a2c5-4de2-817e-91d261b9a494');
    OneSignal.Notifications.requestPermission(true);
  }

  Future<void> checkConnectivity() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      // No hay conexión a Internet
      setState(() {
        isConnected = false;
      });
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Conexión a Internet'),
          content: Text('Por favor, conecta a WiFi para acceder a la aplicación.'),
          actions: [
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                // Cierra la aplicación si no hay conexión
                if (!isConnected) {
                  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                }
              },
              child: Text('Aceptar'),
            ),
          ],
        ),
      );
    }
  }
}





