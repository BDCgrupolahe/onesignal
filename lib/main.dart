
// import 'package:flutter/foundation.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:onesignal_flutter/onesignal_flutter.dart';
// import 'package:connectivity/connectivity.dart'; // Importa el paquete connectivity
// import 'package:permission_handler/permission_handler.dart';

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
//   bool isConnected = true;

//   @override
//   void initState() {
//     super.initState();
//     checkConnectivity(); // Verificar la conexión al iniciar la aplicación
//   }

//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
//       statusBarColor: Color(0xFF2D749B),
//     ));

//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: <Widget>[
//             Expanded(
//               child: Stack(
//                 children: [
//                   if (isConnected)
//                     // InAppWebView(
//                     //   key: webViewKey,
//                     //   initialUrlRequest: URLRequest(
//                     //       url: WebUri(
//                     //           'https://app.congresoneuropediatria.com/')),
//                     //   initialOptions: InAppWebViewGroupOptions(
//                     //     android: AndroidInAppWebViewOptions(
//                     //       useHybridComposition: true,
//                     //       builtInZoomControls: true,
//                     //     ),
//                     //     ios: IOSInAppWebViewOptions(
//                     //       allowsInlineMediaPlayback: true,
//                     //     ),
//                     //     crossPlatform: InAppWebViewOptions(
//                     //       preferredContentMode: UserPreferredContentMode.DESKTOP,
//                     //       useShouldOverrideUrlLoading: true,
//                     //       useOnDownloadStart: true,
//                     //       useShouldInterceptAjaxRequest: true,
//                     //     ),
//                     //     userAgent: 'Mozilla/5.0',
//                     //     transparentBackground: false,
//                     //     clearCache: true,
//                     //     cacheEnabled: false,
//                     //     clearSessionCache: true,
//                     //     applicationNameForUserAgent: 'App',
//                     //     disableContextMenu: true,
//                     //     useOnLoadResource: true,
//                     //     useOnDownloadProgress: true,
//                     //     useShouldInterceptFetchRequest: true,
//                     //   ),
//                     //   onWebViewCreated: (controller) {
//                     //     webViewController = controller;
//                     //   },
//                     //   androidOnPermissionRequest:
//                     //       (controller, origin, resources) async {
//                     //     return PermissionRequestResponse(
//                     //       resources: resources,
//                     //       action: PermissionRequestResponseAction.GRANT,
//                     //     );
//                     //   },
//                     // ),
//                     InAppWebView(
//                       key: webViewKey,
//                       initialUrlRequest: URLRequest(
//                         url: WebUri('https://app.congresoneuropediatria.com/'),
//                       ),
//                       initialOptions: InAppWebViewGroupOptions(
//                         android: AndroidInAppWebViewOptions(
//                           useHybridComposition: true,
//                           builtInZoomControls: true,
//                         ),
//                         ios: IOSInAppWebViewOptions(
//                           allowsInlineMediaPlayback: true,
//                         ),
//                         crossPlatform: InAppWebViewOptions(
//                           preferredContentMode:
//                               UserPreferredContentMode.DESKTOP,
//                         ),
//                       ),
//                       onWebViewCreated: (controller) {
//                         webViewController = controller;
//                       },
//                       androidOnPermissionRequest:
//                           (controller, origin, resources) async {
//                         return PermissionRequestResponse(
//                           resources: resources,
//                           action: PermissionRequestResponseAction.GRANT,
//                         );
//                       },
//                     ),
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
//     OneSignal.initialize('735329bb-a2c5-4de2-817e-91d261b9a494');
//     OneSignal.Notifications.requestPermission(true);
//   }

// // por si no funciona
//   Future<void> requestPermissions() async {
//     var cameraStatus = await Permission.camera.request();
//     var storageStatus = await Permission.storage.request();

//     if (cameraStatus.isGranted && storageStatus.isGranted) {
//       // Permiso concedido, puedes tomar fotos o acceder al almacenamiento
//     } else {
//       // Permiso denegado, maneja la situación de acuerdo a tus necesidades
//     }
//   }

//   Future<void> checkConnectivity() async {
//     var connectivityResult = await Connectivity().checkConnectivity();
//     if (connectivityResult == ConnectivityResult.none) {
//       // No hay conexión a Internet
//       setState(() {
//         isConnected = false;
//       });
//       showDialog(
//         context: context,
//         builder: (context) => AlertDialog(
//           title: Text('Conexión a Internet'),
//           content:
//               Text('Por favor, conecta a WiFi para acceder a la aplicación.'),
//           actions: [
//             ElevatedButton(
//               onPressed: () {
//                 Navigator.pop(context);
//                 // Cierra la aplicación si no hay conexión
//                 if (!isConnected) {
//                   SystemChannels.platform.invokeMethod('SystemNavigator.pop');
//                 }
//               },
//               child: Text('Aceptar'),
//             ),
//           ],
//         ),
//       );
//     }
//   }
// }

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:connectivity/connectivity.dart'; // Importa el paquete connectivity
import 'package:permission_handler/permission_handler.dart';

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
  int backPressCount = 0;

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
      body: WillPopScope(
        onWillPop: onWillPop,
        child: SafeArea(
          child: Column(
            children: <Widget>[
              Expanded(
                child: Stack(
                  children: [
                    if (isConnected)
                      InAppWebView(
                        key: webViewKey,
                        initialUrlRequest: URLRequest(
                          url: WebUri(
                              'https://app.congresoneuropediatria.com/'),
                        ),
                        initialOptions: InAppWebViewGroupOptions(
                          android: AndroidInAppWebViewOptions(
                            useHybridComposition: true,
                            builtInZoomControls: true,
                          ),
                          ios: IOSInAppWebViewOptions(
                            allowsInlineMediaPlayback: true,
                          ),
                          crossPlatform: InAppWebViewOptions(
                            preferredContentMode:
                                UserPreferredContentMode.DESKTOP,
                          ),
                        ),
                        onWebViewCreated: (controller) {
                          webViewController = controller;
                        },
                        androidOnPermissionRequest:
                            (controller, origin, resources) async {
                          return PermissionRequestResponse(
                            resources: resources,
                            action: PermissionRequestResponseAction.GRANT,
                          );
                        },
                        onLoadStop: (controller, url) {
                          // Limpiar el contador de retroceso cuando se carga una nueva página
                          backPressCount = 0;
                        },
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<bool> onWillPop() async {
    if (backPressCount == 1) {
      // Si se presiona el botón de atrás dos veces consecutivas, mostrar diálogo de confirmación
      bool confirm = await showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('Salir de la aplicación'),
          content: Text('¿Estás seguro de que quieres salir de la aplicación?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context, false);
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context, true);
              },
              child: Text('Aceptar'),
            ),
          ],
        ),
      );
      if (confirm ?? false) {
        // Si se acepta, salir de la aplicación
        SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      }
      return false;
    } else {
      // Intentar retroceder en el WebView
      if (await webViewController?.canGoBack() ?? false) {
        webViewController?.goBack();
      } else {
        // Incrementar el contador y esperar 2 segundos antes de resetearlo
        backPressCount++;
        await Future.delayed(Duration(seconds: 2));
        backPressCount = 0;
      }
      return false;
    }
  }

  Future onesignal() async {
    OSNotificationDisplayType.notification;
    OneSignal.Debug.setLogLevel(OSLogLevel.verbose);
    OneSignal.initialize('735329bb-a2c5-4de2-817e-91d261b9a494');
    OneSignal.Notifications.requestPermission(true);
  }

  Future<void> requestPermissions() async {
    var cameraStatus = await Permission.camera.request();
    var storageStatus = await Permission.storage.request();

    if (cameraStatus.isGranted && storageStatus.isGranted) {
      // Permiso concedido, puedes tomar fotos o acceder al almacenamiento
    } else {
      // Permiso denegado, maneja la situación de acuerdo a tus necesidades
    }
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
          content: Text(
              'Por favor, conecta a WiFi para acceder a la aplicación.'),
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
