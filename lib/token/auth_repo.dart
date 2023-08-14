// import 'dart:html';
import 'dart:convert';
import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../jsons/cars.dart';
import '../jsons/getUserJson.dart';
import '../jsons/housesJson.dart';
import '../jsons/land.dart';
import '../my_post.dart';
import 'cash_helper.dart';
import 'dio_factory.dart';


class AuthRepo {
  late final Dio _dio;
  AuthRepo() {
    _dio = DioFactory.instance.get();
  }

  Future<Either<String, String>> loginUser(
      {required String email, required String password}) async {
    try {
      final result = await _dio
          .post('login?email=$email&password=$password');
      dynamic jsonObject = jsonDecode(result.data);
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', jsonObject["access_token"].toString());
      print("SuccessfulData");
      print("hhhhhhhhhher${jsonObject["access_token"]}");
      // // print("Chace = ${CachHelper.sharedPreferences.getString('token')}");
      // return Right("gjgj");
      return Right(jsonObject["access_token"].toString());

    } catch (error) {
      print("error =$error");
      return Left("error");
      // return Left(ExceptionHandler.handle(error as Exception));
    }
  }
//
  Future<Either<String, String>> createUser({
    required String name,
    required String email,
    required String password,
    required String password_confirmation,
    String? phone,
    var image,
    var fileName,
  }) async {
    try {
      final img = await MultipartFile.fromFile(image.path, filename: fileName);
      final formData = FormData.fromMap({
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': password_confirmation,
        'phone': phone,
        'img': img,
      });
      final response = await _dio.post(
        'register',
        data: formData,
      );
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', response.data["access_token"]);
      await prefs.setInt('id', response.data["user"]["id"]);
      print("hhhhhhhhhher${response.data["access_token"]}");
      print("Cache = ${CachHelper.sharedPreferences.getString('token')}");
      print("Cache id = ${CachHelper.sharedPreferences.getInt('id')}");
      print("SuccessfulData");
      return Right(response.data["access_token"]);
    } catch (error) {
      print("error =$error");
      return Left("error");
    }
  }

  // String json = jsonEncode(house.toJson());

  Future<Either<String, List<Houses>>> showHouses() async {
    try {
      final result = await _dio.get('posts/accepted/house');
      print("SuccessfulData");

      List<Houses> housesList = [];
      List<dynamic> jsonResponse = json.decode(result.data.toString());
      print("${CachHelper.sharedPreferences.getString('token')}");
      for (var houseJson in jsonResponse) {
        Houses house = Houses.fromJson(houseJson);
        housesList.add(house);
        print("nnnnn${housesList}");
      }

      print("SuccessfulDataHome");
      return Right(housesList);
    } catch (error, stackTrace) {
      print("showHouses error: $error, stackTrace: $stackTrace");
      return Left("There was an error fetching the houses. Please try again later.");
    }
  }


  Future<Either<String, List<Cars>>> showCars() async {
    try {

      final result = await _dio.get('posts/accepted/car');
      print("SuccessfulDatacccccccccccccccccccccccccccar");
      List<dynamic> jsonResponse = json.decode(result.data.toString());
      // print("Third item in jsonResponse: ${jsonResponse[2]}");
      List<Cars> CarsList = [];
      jsonResponse.forEach((houseJson) {
        Cars car = Cars.fromJson(houseJson);
        CarsList.add(car);
        print("carrier$CarsList");
      });
      print("SuccessfulDataCar");
      return Right(CarsList);
    } catch (error, stackTrace) {
      print("showHouses error: $error, stackTrace: $stackTrace");
      return Left("There was an error fetching the houses. Please try again later.");
    }
  }

  Future<Either<String, List<Lands>>> showLand() async {
    try {
      final result = await _dio.get('posts/accepted/land');
      print("SuccessfulDatacccccccccccccccccccccccccccar");
      List<dynamic> jsonResponse = json.decode(result.data.toString());
      // print("Third item in jsonResponse: ${jsonResponse[2]}");
      List<Lands> LandsList = [];
      jsonResponse.forEach((houseJson) {
        Lands land = Lands.fromJson(houseJson);
        LandsList.add(land);
        print("carrrrrr${Lands}");
      });
      print("SuccessfulDataCar");
      return Right(LandsList);
    } catch (error, stackTrace) {
      print("showHouses error: $error, stackTrace: $stackTrace");
      return Left("There was an error fetching the houses. Please try again later.");
    }
  }

  Future<Either<String, List<myPost>>> showMyPost() async {
    try {
      final result = await _dio.get('posts/user/posts');
      print("SuccessfulDatacccccccccccccccccccccccccccar");
      List<dynamic> jsonResponse = json.decode(result.data.toString());
      print("Third item in jsonResponse: ${jsonResponse[2]}");
      List<myPost> MyPostList = [];
      // jsonResponse.forEach((MyPostJson) {
      //   myPost ME = myPost.fromJson(MyPostJson);
      //   MyPostList.add(ME);
      //   print("carrrrrr${MyPostList}");
      // });
      print("SuccessfulDataCar");
      return Right(MyPostList);
    } catch (error, stackTrace) {
      print("showHouses error: $error, stackTrace: $stackTrace");
      return Left("There was an error fetching the houses. Please try again later.");
    }
  }


  Future<Either<String, List>> showNotification() async {
    try {
      final result = await _dio.get('notifications');
      // housesFromJson("${result.data}");
      print("SuccessfulData");
      print("hhhhhhhhhher${result.data}");

      print("SuccessfulDataHome");
      return Right(result.data as List);

    } catch (error) {
      print("error =$error");
      return Left("jgkg");
      // return Left(ExceptionHandler.handle(error as Exception));
    }
  }


  Future<Either<String, Map>> getProfile() async {
    try {
      final result = await _dio.get('user');
      // final result = await _dio.get('users/${CachHelper.sharedPreferences.getInt('id')}');
      // final result = await _dio.get('users/1');
      print("SuccessfulData");
      dynamic re=jsonDecode(result.data);
      print("hhhhhhhhhher${re['name']}");
      // List<Map<String, dynamic>> data = [result.data] ;
      // List<GetUser> userList = List.from(data.map((userJson) => GetUser.fromJson(userJson as Map<String, dynamic>)));
      print("SuccessfulShowUser");
      return Right(re);

    } catch (error) {
      print("error =$error");
      return Left("jgkg");
    }
  }


  Future<Either<String, String>> PostHouses(
      {
        required String location,
        required String direction,
        required String floor,
        required String space,
        required String room_number,
        required String price,
        required List<File> images,
        required String operation_id,
        required String duration,


      }) async {
    try {
      FormData formData = FormData.fromMap({
        'location': location,
        'direction': direction,
        'floor': floor,
        'space': space,
        'room_number': room_number,
        'price': price,
        'operation_id': operation_id,
        'duration': duration,
      });

// Add images to form data
      for (var i = 0; i < images.length; i++) {
        formData.files.add(MapEntry(
            'images',
            MultipartFile.fromFileSync(
                images[i].path,
                filename: images[i].path.split('/').last)));
      }

      final result = await _dio.post(
        'houses/add',
        data: formData,
        options: Options(
          followRedirects: false,
          validateStatus: (_) => true,
        ),
      );
      // final result = await _dio.post(
      //   'houses/add',
      //   data: {
      //     'location':'$location',
      //     'direction':'$direction',
      //     'floor':'$floor',
      //     'space':'$space',
      //     'room_number':room_number,
      //     'price':price,
      //     'images':images,
      //     'operation_id':operation_id,
      //     'duration':'$direction',
      //   },
      //   options: Options(
      //       followRedirects: false,
      //     validateStatus: (_) => true,
      // ),

      // result.

      print("SuccessfulData posttttt");
      print(result.data);
      return Right(result.data);
    } catch (error) {
      print("error =$error");
      return Left("error");
    }
  }

  Future<Either<String, List<Houses>>> FilterHouses(
      {
        required String location,
        required String direction,
        required String floor,
        required String min_space,
        required String max_space,
        required String max_room_number,
        required String min_room_number,
        required String min_price,
        required String max_price,
        required String operation_id,
      }) async {
    try {
      _dio.options.followRedirects = true;
      final result = await _dio.post(
        'posts/filter/houses',
        data: {
          'location':'$location',
          'min_space':'$min_space',
          'max_space':'$max_space',
          'floor':floor,
          'min_room_number':min_room_number,
          'max_room_number':max_room_number,
          'operation_id':operation_id,
          'direction':'$direction',
          'min_price':'$min_price',
          'max_price':'$max_price',
        },
        options: Options(
          followRedirects: false,
          validateStatus: (_) => true,
        ),
      );
      // result.
      List<Houses> housesListFilter = [];
      List<dynamic> jsonResponse = json.decode(result.data.toString());
      print("${CachHelper.sharedPreferences.getString('token')}");
      for (var houseJson in jsonResponse) {
        Houses house = Houses.fromJson(houseJson);
        housesListFilter.add(house);
        print("nnnnn$housesListFilter");
      }

      print("SuccessfulDataHome");
      return Right(housesListFilter);
    } catch (error) {
      print("error =$error");
      return Left("error");
    }
  }


  Future<Either<String, List<Cars>>> FilterCars(
      {
        required String name,
        required int min_price,
        required int max_price,
        required int min_year,
        required int max_year,
        required int is_new,
        required String color,
        required int operation_id,
      }) async {
    try {
      _dio.options.followRedirects = true;
      final result = await _dio.post(
        'posts/filter/houses',
        data: {
          'name':'$name',
          'operation_id':operation_id,
          'color':'$color',
          'is_new':is_new,
          'min_price':min_price,
          'max_price':max_price,
          'min_year':min_year,
          'max_year':max_year,
        },
        options: Options(
          followRedirects: false,
          validateStatus: (_) => true,
        ),
      );
      // result.
      List<Cars> CarsListFilter = [];
      List<dynamic> jsonResponse = json.decode(result.data.toString());
      print("${CachHelper.sharedPreferences.getString('token')}");
      for (var houseJson in jsonResponse) {
        Cars car = Cars.fromJson(houseJson);
        CarsListFilter.add(car);
        print("nnnnn$CarsListFilter");
      }

      print("SuccessfulDataHome");
      return Right(CarsListFilter);
    } catch (error) {
      print("error =$error");
      return Left("error");
    }
  }


  Future<Either<String, List<Lands>>> FilterLands(
      {
        required String location,
        required String min_space,
        required String max_space,
        required String min_price,
        required String max_price,
        required String operation_id,
      }) async {
    try {
      _dio.options.followRedirects = true;
      final result = await _dio.post(
        'posts/filter/houses',
        data: {
          'location':'$location',
          'min_space':'$min_space',
          'max_space':'$max_space',
          'operation_id':operation_id,
          'min_price':'$min_price',
          'max_price':'$max_price',
        },
        options: Options(
          followRedirects: false,
          validateStatus: (_) => true,
        ),
      );
      // result.
      List<Lands> LandsListFilter = [];
      List<dynamic> jsonResponse = json.decode(result.data.toString());
      print("${CachHelper.sharedPreferences.getString('token')}");
      for (var houseJson in jsonResponse) {
        Lands Land = Lands.fromJson(houseJson);
        LandsListFilter.add(Land);
        print("nnnnn$LandsListFilter");
      }

      print("SuccessfulDataHome");
      return Right(LandsListFilter);
    } catch (error) {
      print("error =$error");
      return Left("error");
    }
  }




//   Future<Either<String, ProfileModel>> myProfile() async {
//     try {
//       final result = await _dio.get(
//         'Mobile/Customer/GetMyProfile',
//       );
//       print("SuccessfulData");
//       return Right(ProfileModel.fromJson(result.data["response"]));
//     } catch (error) {
//       print("error =$error");
//       return Left(ExceptionHandler.handle(error as Exception));
//     }
//   }
//
//   Future<Either<String, List<HomeModel>>> getHome() async {
//     try {
//       final result = await _dio.get('Mobile/Home/Get');
//       (result.data["response"] as List).map((e) {
//         return HomeModel.fromJson(e);
//       }).toList();
//       print("SuccessfulDataHome");
//       return Right((result.data["response"] as List).map((e) {
//         return HomeModel.fromJson(e);
//       }).toList());
//     } catch (error) {
//       print("error =$error");
//       return Left(ExceptionHandler.handle(error as Exception));
//     }
//   }
// }

// Future<Either<String, List<HomeModel>>> getHome() async {
//   try {
//     final result = await _dio.get('Mobile/Home/Get');
//     (result.data['response'] as List).map((e) {
//       return HomeModel.fromJson(e);
//     }).toList();
//     print("SuccessfulDataHome");
//     return Right((result.data['response'] as List).map((e) {
//       return HomeModel.fromJson(e);
//     }).toList());
//   } catch (error) {
//     print("error =$error");
//     return Left(ExceptionHandler.handle(error as Exception));
//   }
}

