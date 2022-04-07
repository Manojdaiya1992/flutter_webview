import 'dart:io';

import 'package:e_learning/models/video_call_param.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:webview_flutter/webview_flutter.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:async';
import 'dart:developer';

// class VideoCallWebView extends StatefulWidget {
//   const VideoCallWebView({Key? key, required String url}) : super(key: key);

//   @override
//   State<VideoCallWebView> createState() => _VideoCallState();
// }

// class _VideoCallState extends State<VideoCallWebView> {
//   late Future<String> requestParam;
//   InAppWebViewController? webViewController;
//   InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
//       crossPlatform: InAppWebViewOptions(
//         useShouldOverrideUrlLoading: true,
//         mediaPlaybackRequiresUserGesture: false,
//       ),
//       android: AndroidInAppWebViewOptions(
//         useHybridComposition: true,
//       ),
//       ios: IOSInAppWebViewOptions(
//         allowsInlineMediaPlayback: true,
//       ));

//   @override
//   void initState() {
//     // permissions();
//     super.initState();
//     getVideoCallUrl();
//   }

//   void getVideoCallUrl() {
//     requestParam = VideoCallParam().toJson();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//           child:
//               // FutureBuilder(
//               //   future: requestParam,
//               //   builder: (context, snapshot) {
//               //     if (snapshot.hasData) {
//               //       // return WebView(
//               //       //   initialUrl: snapshot.data.toString(),
//               //       //   //       initialUrl: "https://flutter.dev",
//               //       //   javascriptMode: JavascriptMode.unrestricted,
//               //       //   allowsInlineMediaPlayback: true,
//               //       //   initialMediaPlaybackPolicy:
//               //       //       AutoMediaPlaybackPolicy.always_allow,
//               //       // );
//               //       InAppWebView(
//               //         // key: webViewKey,
//               //         initialUrlRequest:
//               //             URLRequest(url: Uri.parse("https://inappwebview.dev/")),
//               //         initialOptions: options,
//               //         //  pullToRefreshController: pullToRefreshController,
//               //         onWebViewCreated: (controller) {
//               //           webViewController = controller;
//               //         },

//               //         androidOnPermissionRequest:
//               //             (controller, origin, resources) async {
//               //           return PermissionRequestResponse(
//               //               resources: resources,
//               //               action: PermissionRequestResponseAction.GRANT);
//               //         },
//               //       );
//               //     } else if (snapshot.hasError) {
//               //       return Text(snapshot.error.toString());
//               //     }
//               //     return const CircularProgressIndicator();
//               //   },
//               // ),
//               InAppWebView(
//         // key: webViewKey,
//         initialUrlRequest:
//             URLRequest(url: Uri.parse("https://inappwebview.dev/")),
//         initialOptions: options,
//         //  pullToRefreshController: pullToRefreshController,
//         onWebViewCreated: (controller) {
//           webViewController = controller;
//         },

//         androidOnPermissionRequest: (controller, origin, resources) async {
//           return PermissionRequestResponse(
//               resources: resources,
//               action: PermissionRequestResponseAction.GRANT);
//         },
//       )
//           // child: WebView(
//           //     initialUrl: requestParam ?? "https://flutter.dev",
//           //     // initialUrl: "https://flutter.dev",
//           //     javascriptMode: JavascriptMode.unrestricted),
//           ),
//     );
//   }
// }

class VideoCallWebView extends StatelessWidget {
  final String url;
  VideoCallWebView({Key? key, required this.url}) : super(key: key);

  InAppWebViewController? webViewController;
  InAppWebViewGroupOptions options = InAppWebViewGroupOptions(
      crossPlatform: InAppWebViewOptions(
        useShouldOverrideUrlLoading: true,
        mediaPlaybackRequiresUserGesture: false,
      ),
      android: AndroidInAppWebViewOptions(
        useHybridComposition: true,
      ),
      ios: IOSInAppWebViewOptions(
        allowsInlineMediaPlayback: true,
      ));

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: InAppWebView(
        // key: webViewKey,
        initialUrlRequest: URLRequest(url: Uri.parse(url)),
        initialOptions: options,
        //  pullToRefreshController: pullToRefreshController,
        onWebViewCreated: (controller) {
          webViewController = controller;
        },

        androidOnPermissionRequest: (controller, origin, resources) async {
          return PermissionRequestResponse(
              resources: resources,
              action: PermissionRequestResponseAction.GRANT);
        },
      ),
    );
  }
}
