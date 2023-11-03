import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

class BusScreen extends StatefulWidget {
  const BusScreen({super.key});

  @override
  State<BusScreen> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<BusScreen> {
  double _progress = 0;
  late InAppWebViewController inAppWebViewController;
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width - 40;
    return WillPopScope(
      onWillPop: () async {
        var isLastPage = inAppWebViewController.canGoBack();
        if (await isLastPage) {
          inAppWebViewController.goBack();
          return false;
        }

        return true;
      },
      child: SafeArea(
        child: Scaffold(
          //  drawer: DrawerBox(width),
          appBar: AppBar(
            backgroundColor: Colors.white,

            // ),
            title: const Text(
              'Bus Booking',
              style: const TextStyle(color: Colors.black),
            ),
            actions: [],
          ),
          body: Stack(
            children: [
              InAppWebView(
                initialUrlRequest: URLRequest(
                    url: Uri.parse("https://kabiatravels.com/bus.php")),
                onWebViewCreated: (InAppWebViewController controller) {
                  inAppWebViewController = controller;
                },
                onProgressChanged:
                    (InAppWebViewController controller, int progress) {
                  setState(() {
                    _progress = progress / 100;
                  });
                },
              ),
              _progress < 1
                  ? Center(
                      child: Container(
                        child: CircularProgressIndicator(
                          value: _progress,
                        ),
                      ),
                    )
                  : SizedBox()
            ],
          ),
        ),
      ),
    );
  }
}
