import 'package:dio/browser.dart';
import 'package:dio/dio.dart';

class CustomDio extends DioForBrowser {
  CustomDio()
      : super(
          BaseOptions(
            baseUrl: 'https://clickserver.duckdns.org',
            receiveTimeout: const Duration(seconds: 10),
          ),
        );

  CustomDio unauth() {
    return this;
  }
}
