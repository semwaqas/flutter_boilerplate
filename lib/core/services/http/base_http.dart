import 'package:dio/dio.dart';
import 'package:get_started_boilerplate/core/common/constants/constants.dart';
import 'package:get_started_boilerplate/core/services/log/log.dart';
import 'package:get_storage/get_storage.dart';

import 'base_interceptor.dart';

final BaseHttp baseHttp = BaseHttp();

class BaseHttp {
  static final BaseHttp _service = BaseHttp._internal();

  factory BaseHttp() => _service;

  BaseHttp._internal();

  static const classTag = "BaseHTTP";

  static GetStorage get apiCacheStorage => _storage;
  static final GetStorage _storage = GetStorage('api_cache_container');
  static bool isStorageReady = false;
  static const _tokenStorageKey = "authentication_token";
  static const _tokenNotFoundKey = "TOKEN_DELETED";
  static const _authDataStorageKey = "authentication_data";

  static _initializeStorage() async {
    isStorageReady = false;
    try {
      await GetStorage.init('api_cache_container').then((r) => (r) {
            isStorageReady = true;
          });
    } catch (e) {
      kLog("error in api cache initialization..",
          logStatus: LogStatus.ERROR, tag: classTag);
    }
  }

  static String baseURL = Constants.env.apiUrl();

  static int maxRedirects = 3;
  static final Dio _dio = Dio(
    BaseOptions(
      baseUrl: baseURL,
      maxRedirects: maxRedirects,
      receiveDataWhenStatusError: true,
    ),
  );

  static initializeAPIServices() async {
    await _initializeStorage();
    await _interceptorsInitialization();
  }

  static appendInterceptor(InterceptorsWrapper interceptor) =>
      _dio.interceptors.add(interceptor);

  static _interceptorsInitialization() {
    _dio.interceptors.add(BaseInterceptor());
  }

  static storeToken(String token) async {
    try {
      await _storage.write(_tokenStorageKey, token);
    } catch (e) {
      kLog("Error storing token!", tag: classTag, logStatus: LogStatus.ERROR);
    }
  }

  static String? getToken() {
    try {
      return _storage.read(_tokenStorageKey);
    } catch (e) {
      kLog("error getting token!", tag: classTag, logStatus: LogStatus.ERROR);
    }
    return null;
  }

  /// Clears the [apiCacheStorage] and clears the Stored Token.
  ///
  static clearCacheStorage() async {
    await _storage.write(_tokenStorageKey, _tokenNotFoundKey);
    await _storage.erase();
  }

  ///Store authentication data in [apiCacheStorage].
  static storeAuthData(Map<String, dynamic>? data) {
    try {
      _storage.write(_authDataStorageKey, data);
    } catch (e) {
      kLog("Error storing auth data!",
          tag: classTag, logStatus: LogStatus.ERROR);
    }
  }

  ///Get authentication data in [apiCacheStorage].
  static getAuthData() {
    try {
      return _storage.read(_authDataStorageKey);
    } catch (e) {
      kLog("Error getting auth data!",
          tag: classTag, logStatus: LogStatus.ERROR);
    }
    return null;
  }

  Future<T?> get<T>(
      {required String endPointURL,
      Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? header,
      bool addToCache = true}) async {
    Response response = await _dio.get(endPointURL,
        options: Options(headers: header), queryParameters: queryParameters);
    if (response.statusCode == 200) {
      if (addToCache) _storage.write(endPointURL, response.data);
      return response.data;
    } else {
      return null;
    }
  }

  Future<T?> post<T>(
      {required String endPointURL,
      Map<String, dynamic>? data,
      Map<String, dynamic>? header,
      bool addToCache = true}) async {
    Response response = await _dio.post(endPointURL,
        data: data, options: Options(headers: header));
    if (response.statusCode == 200) {
      if (addToCache) _storage.write(endPointURL, response.data);
      return response.data;
    } else {
      return null;
    }
  }
}
