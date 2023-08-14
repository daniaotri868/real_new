// import 'package:dio/dio.dart';
//
// class dioHelper
//
// {
//   static  Dio ?dio;
//   static init()
//   {
//     dio= Dio(
//         BaseOptions(
//             baseUrl:'http://52.91.25.191:85/' ,
//             receiveDataWhenStatusError: true,
//             receiveTimeout: Duration(seconds:  5),
//             connectTimeout: Duration(seconds: 6),
//             headers: {
//               'Content-Type':'application/json',
//               'Accept':'text/plain'
//             },
//
//         ),
//     );
//   }
//
//   static Future<Response> getDio({required String url,required dynamic query })async
//   {
//     return await dio!.get(url,queryParameters: query);
//   }
//   static Future<Response> PostDio({required String url, Map<String,Map>? query,required  data})async
//   {
//     return await dio!.post(url,queryParameters: query,data: data);
//   }
//
// }