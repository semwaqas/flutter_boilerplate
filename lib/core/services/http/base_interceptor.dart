import 'package:dio/dio.dart';
import 'package:get_started_boilerplate/core/services/log/log.dart';

import 'base_http.dart';

class BaseInterceptor implements InterceptorsWrapper {
  // Helper function to get headers, including the Authorization token.
  Map<String, String> getHeaders() {
    var headers = <String, String>{'Content-Type': 'application/json'};
    String? token = BaseHttp.getToken();
    if (token != null) {
      headers['Authorization'] = "Bearer $token";
    }
    return headers;
  }

  // Cache expiration duration
  final Duration cacheDuration = const Duration(days: 7);

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    kLog("onRequest Interceptor ${options.uri}");
    options.headers = getHeaders();

    // Check if the data is in the cache
    if (options.extra['useCache'] == true) {
      String cacheKey = options.uri.toString();
      if (BaseHttp.apiCacheStorage.hasData(cacheKey)) {
        var cachedData = BaseHttp.apiCacheStorage.read(cacheKey);

        // Check cache expiration
        final timestamp = cachedData['timestamp'];
        if (timestamp != null &&
            DateTime.parse(timestamp).add(cacheDuration).isAfter(DateTime.now())) {
          kLog("Serving cached data for ${options.uri}");
          handler.resolve(
            Response(
              requestOptions: options,
              data: cachedData['data'],
              statusCode: 200,
              statusMessage: 'Cache hit',
            ),
          );
          return; // Serve cached response
        } else {
          kLog("Cache expired for ${options.uri}");
        }
      }
    }
    handler.next(options); // Proceed with the API call
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) async {
    kLog("onResponse Interceptor ${response.requestOptions.uri}");

    // Cache the response if caching is enabled
    if (response.requestOptions.extra['useCache'] == true &&
        response.statusCode == 200) {
      String cacheKey = response.requestOptions.uri.toString();
      kLog("Caching response for $cacheKey");
      BaseHttp.apiCacheStorage.write(
        cacheKey,
        {
          'data': response.data,
          'timestamp': DateTime.now().toIso8601String(),
        },
      );
    }
    handler.next(response); // Pass the response to the next handler
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) async {
    kLog("onError Interceptor ${err.requestOptions.uri}: ${err.message}");

    /// Token refresh logic (uncomment and implement as needed)
    // if (err.response?.statusCode == 401 || err.response?.statusCode == 403) {
    //   var response = await refreshToken();
    //   try {
    //     var token = response.data["accessToken"];
    //     BaseHttp.storeToken(token);
    //     handler.resolve(await _retry(err.requestOptions));
    //   } catch (e) {
    //     handler.next(e);
    //   }
    //   return;
    // }
    handler.next(err); // Pass the error to the next handler
  }

  /// Helper method for token refresh (optional)
  // Future<Response<dynamic>> refreshToken() async {
  //   Dio dio = Dio();
  //   final refreshToken = BaseHttp.getAuthData()?["refreshToken"];
  //   var response = await dio.post(
  //     ApiKeys.tokenRefresh,
  //     data: {"refreshToken": refreshToken},
  //   );
  //   return response;
  // }

  /// Retry request after token refresh (optional)
  // Future<Response<dynamic>> _retry(RequestOptions requestOptions) async {
  //   Dio dio = Dio();
  //   String? token = BaseHttp.getToken();
  //   final options = Options(
  //     method: requestOptions.method,
  //     headers: {
  //       "authorization": "Bearer $token",
  //     },
  //   );
  //
  //   return dio.request<dynamic>(
  //     requestOptions.path,
  //     data: requestOptions.data,
  //     queryParameters: requestOptions.queryParameters,
  //     options: options,
  //   );
  // }
}

