import 'package:dio/dio.dart';

class diohelper{
  static Dio? dio;
  static init(){
    dio =Dio(
      BaseOptions(
        baseUrl:'https://newsapi.org/',
        receiveDataWhenStatusError: true,
      )
    );
  }

static Future<Response> get(
  {
    required String path,
    required Map<String,dynamic> qurery,
  }
      )async{
    return await dio!.get(path,queryParameters:qurery );

  }
}