// ignore_for_file: override_on_non_overriding_member

import 'dart:io';
import 'dart:convert';

import 'http_client_credential.dart';

class MockHttpClient implements HttpClient {
  @override
  bool autoUncompress = true;

  @override
  var _connectionTimeout = const Duration(seconds: 5);

  get connectionTimeout => _connectionTimeout;

  set connectionTimeout(value) {
    _connectionTimeout = value!;
  }

  @override
  Future<HttpClientRequest> openUrl(String method, Uri url) {
    throw UnimplementedError();
  }

  @override
  Future<HttpClientRequest> open(String method, String host, int port, String path) {
    throw UnimplementedError();
  }

  @override
  Future<HttpClientRequest> get(String host, int port, String path) {
    throw UnimplementedError();
  }

  @override
  Future<HttpClientRequest> getUrl(Uri url) {
    throw UnimplementedError();
  }

  @override
  Future<HttpClientRequest> post(String host, int port, String path) {
    throw UnimplementedError();
  }

  @override
  Future<HttpClientRequest> postUrl(Uri url) {
    throw UnimplementedError();
  }

  @override
  Future<HttpClientRequest> put(String host, int port, String path) {
    throw UnimplementedError();
  }

  @override
  Future<HttpClientRequest> putUrl(Uri url) {
    throw UnimplementedError();
  }

  @override
  Future<HttpClientRequest> delete(String host, int port, String path) {
    throw UnimplementedError();
  }

  @override
  Future<HttpClientRequest> deleteUrl(Uri url) {
    throw UnimplementedError();
  }

  @override
  void addCredentials(Uri url, String realm, HttpClientCredentials credentials) {}

  @override
  void addProxyCredentials(String host, int port, String realm, HttpClientCredentials credentials) {}

  @override
  void close({bool force = false}) {}

  @override
  set authenticateProxy(
    Future<bool> Function(String host, int port, String scheme, String realm)? f,
  ) {}

  @override
  set authenticateProxyFailed(
    void Function(Uri url, String scheme, String realm, bool closeAfterFailure) f,
  ) {}

  @override
  set authenticateProxyUnsolicited(
    Future<bool> Function(String host, int port, String scheme, String realm)? f,
  ) {}

  @override
  set badCertificateCallback(bool Function(X509Certificate cert, String host, int port)? callback) {}

  @override
  set findProxy(String Function(Uri url)? f) {}

  @override
  set idleTimeout(Duration? timeout) {}

  @override
  set maxConnectionsPerHost(int? maxConnectionsPerHost) {}

  @override
  set userAgent(String? userAgent) {}

  @override
  set proxyCredentials(List<HttpClientCredentials> credentials) {}

  @override
  set authenticateFailed(void Function(Uri url, String scheme, String realm, bool closeAfterFailure) f) {}
  
  @override
  late Duration _idleTimeout;

  Duration get idleTimeout => _idleTimeout;
  
  @override
  set authenticate(Future<bool> Function(Uri url, String scheme, String? realm)? f) {
    // TODO: implement authenticate
  }
  
  @override
  set connectionFactory(Future<ConnectionTask<Socket>> Function(Uri url, String? proxyHost, int? proxyPort)? f) {
    // TODO: implement connectionFactory
  }
  
  @override
  Future<HttpClientRequest> head(String host, int port, String path) {
    // TODO: implement head
    throw UnimplementedError();
  }
  
  @override
  Future<HttpClientRequest> headUrl(Uri url) {
    // TODO: implement headUrl
    throw UnimplementedError();
  }
  
  @override
  // TODO: implement maxConnectionsPerHost
  int? get maxConnectionsPerHost => throw UnimplementedError();
  
  @override
  Future<HttpClientRequest> patch(String host, int port, String path) {
    // TODO: implement patch
    throw UnimplementedError();
  }
  
  @override
  Future<HttpClientRequest> patchUrl(Uri url) {
    // TODO: implement patchUrl
    throw UnimplementedError();
  }
  
  @override
  // TODO: implement userAgent
  String? get userAgent => throw UnimplementedError();
  
  @override
  set keyLog(Function(String line)? callback) {
    // TODO: implement keyLog
  }
}

mixin HttpClientCredential {
}
