import 'dart:convert';
import 'dart:io';
import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meta/meta.dart';
import 'package:real_new/my_post.dart';
import 'package:real_new/widget/SearchCars.dart';
import 'package:real_new/widget/SearchHouses.dart';
import 'package:real_new/widget/SearchLands.dart';
import 'package:sqflite/sqflite.dart';
import '../jsons/cars.dart';
import '../jsons/getUserJson.dart';
import '../jsons/housesJson.dart';
import '../jsons/land.dart';
import '../start.dart';
import '../token/auth_repo.dart';
part 'app_state.dart';


class AppCubit extends Cubit<AppState> {
  late final AuthRepo _authRepo;
  AppCubit() : super(AppInitial()) {
    _authRepo = AuthRepo();
  }
 static AppCubit get(context)=>BlocProvider.of(context);
 bool iconFavorite=false;
 int currentIndex=0;
 bool visib=true;
 bool visib2=true;
 List houses=[];
 Map<String, dynamic>  Login={};
 Map<String, dynamic>  CreateUser={};
 Map<String, dynamic>  FilterHouses={};
 int x=0;
 int y=0;
 int z=0;
 int loadingImageHouses=0;
 int loadingImageCars=0;
 int loadingImageLands=0;
  late Database database;
  late Database database2;
  late Database database3;
  bool x1=false;
  bool x2=true;
  bool x3=true;
  List<Map> listNote=[];
  List<Map> listNote2=[];
  List<Map> listNote3=[];
  List <Map>Search=[];
  late int id;
  bool SearchOrNo=false;
  bool SquareShow=false;
  bool IconCheck= false;
  int selectedRadioHouses=1;
  int selectedRadioFilterHouses=1;
  int selectedRadioCars=1;
  int selectedRadioFilterCars=1;
  int selectedRadioFilterCars2=1;
  int selectedRadioLands=1;
  int selectedRadioFilterLands=1;
  String selectItemdirection="شمالي";
  String selectItemFloor="1";
  String selectItemMinRoom="1";
  String selectItemMaxRoom="1";
  late List<String>  base64Images;
  Map listUser={};
  List<Houses> listHouses=[];
  List<Cars> listCars=[];
  List<Lands> listLands=[];
  List<myPost> listMyPost=[];
  List listNotification=[];
  Map <int,bool> SqureCheck={};
  var formData;
  var fileName;
  void ChangeCheckSqure({required id})
  {

    if( IconCheck==false ) {
      print("in if   $IconCheck");
      IconCheck= true;
    } else {
      print("in else   $IconCheck");
      IconCheck = false;
    }
    SqureCheck[id]=IconCheck;
    print("SqureCheck ${SqureCheck}");
    print("SqureCheck ${SqureCheck[id]}");
    emit(AppCheckSqure());

  }


  void SelectedFilterHousesFloor(value)
  {
    selectItemdirection=value;
    emit(AppChangSelectFilterHousesFloor());
  }


  void SelectedFilterHousesMinRoom(value)
  {
    selectItemMinRoom=value;
    emit(AppChangSelectFilterHousesMinRoom());
  }

  void SelectedFilterHousesMaxRoom(value)
  {
    selectItemMaxRoom=value;
    emit(AppChangSelectFilterHousesMaxRoom());
  }

  void SelectedFilterHousesDirection(value)
  {
    selectItemdirection=value;
    emit(AppChangSelectFilterHousesdirection());
  }

  void FunctionSelectedValHouses(value)
  {
    selectedRadioHouses=value;
    emit(AppChangSelectRadioButtonHouses());
  }

  void FunctionSelectedValFilterHouses(value)
  {
    selectedRadioFilterHouses=value;
    emit(AppChangSelectRadioButtonFilterHouses());
  }


  void FunctionSelectedValCars(value)
  {
    selectedRadioCars=value;
    emit(AppChangSelectRadioButtonCars());
  }

  void FunctionSelectedValFilterCars(value)
  {
    selectedRadioFilterCars=value;
    emit(AppChangSelectRadioButtonFilterCars());
  }
  void FunctionSelectedValFilterCars2(value)
  {
    selectedRadioFilterCars2=value;
    emit(AppChangSelectRadioButtonFilterCars2());
  }
  void FunctionSelectedValLands(value)
  {
    selectedRadioLands=value;
    emit(AppChangSelectRadioButtonLands());
  }

  void FunctionSelectedValFilterLands(value)
  {
    selectedRadioFilterLands=value;
    emit(AppChangSelectRadioButtonFilterLands());
  }
  void ChangeIconFavorite({ id})
 {
   if(iconFavorite==false) {
     iconFavorite=true;
   } else {
     iconFavorite=false;
   }
   emit(AppChangeIconFavorite());
 }

 void changCurrentIndex(index)
 {
   currentIndex=index;
   emit(AppChangCurrentIndex());
 }

 void ChangeIconVisib()
 {
   if(visib==true)
     visib=false;
   else
     visib=true;
   emit(AppChangIconVisib());
 }

  void ChangeIconVisib2()
  {
    if(visib2==true)
      visib2=false;
    else
      visib2=true;
    emit(AppChangIconVisib2());
  }


  final ImagePicker _picker = ImagePicker();
  File? photo;
  List<File?> ?Listphoto;

  List<File> selectedImagesHouses = []; // List of selected image
  List<String> selectedImagesHousesFileName = [];// List of selected image
  List<MultipartFile>selectedImageHousess=[];
  List<File> selectedImagesCars = []; // List of selected image
  List<File> selectedImagesLands = []; // List of selected image
  final picker = ImagePicker();
  String ?photoPath;
  Future<void> imgFromGallery() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      if (pickedFile.path.endsWith('.jpg') || pickedFile.path.endsWith('.jpeg') || pickedFile.path.endsWith('.png')) {
        photo = File(pickedFile.path);
         fileName = photo?.path.split('/').last;
        photoPath = pickedFile.path;
        print('photo: $photo');
        print('photoPath: $photoPath');
           formData = FormData.fromMap({
            'img': await MultipartFile.fromFile(photo!.path, filename: 'image.png'),
          });
      } else {
        print('Error: The selected file is not an image.');
      }
    } else {
      print('No image selected.');
    }

    emit(AppImageCreateUser());
  }
  Future imgFromCamera() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.camera);

    if (pickedFile != null) {
      if (pickedFile.path.endsWith('.jpg') || pickedFile.path.endsWith('.jpeg') || pickedFile.path.endsWith('.png')) {
        photo = File(pickedFile.path);
        fileName = photo?.path.split('/').last;
        photoPath = pickedFile.path;
        print('photo: $photo');
        print('photoPath: $photoPath');
        formData = FormData.fromMap({
          'img': await MultipartFile.fromFile(photo!.path, filename: 'image.png'),
        });
      } else {
        print('Error: The selected file is not an image.');
      }
    } else {
      print('No image selected.');
    }

    emit(AppImageCreateUser());
  }


  Future<void> getImagesHouses({required BuildContext context}) async {
    loadingImageHouses = 1;
    emit(AppListImageLoadingPostHouses());
    selectedImagesHouses = [];
    final pickedFile = await _picker.pickMultiImage(
      imageQuality: 100,
      maxHeight: 1000,
      maxWidth: 1000,
    );
    // List<XFile> xfilePick = pickedFile;

    if (pickedFile !=null) {
      for (var i = 0; i < pickedFile.length; i++) {
        final photos = File(pickedFile[i].path).path.split('/').last;
        selectedImagesHouses.add(File(pickedFile[i].path));
        selectedImagesHousesFileName.add(File(pickedFile[i].path).path.split('/').last );
        selectedImageHousess.add((await MultipartFile.fromFile(File(pickedFile[i].path).path, filename: File(pickedFile[i].path).path.split('/').last))  );

      }

      print("selectedImageHousesssssssssssssssssssss  =$selectedImageHousess");
      // print("selectedImagesHouses  =$selectedImagesHouses");
      // print("selectedImagesHousesNNNNNNNNNNNName  =$selectedImagesHousesFileName");
      // ...
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Nothing is selected')),
      );
    }
    loadingImageHouses = 0;
    emit(AppListImageAddPostHouses());
  }

  Future getImagesCars({required context}) async {
    loadingImageCars=1;
    emit(AppListImageLoadingPostCars());
    selectedImagesCars = [];
    final pickedFile = await _picker.pickMultiImage(
        imageQuality: 100, // To set quality of images
        maxHeight: 1000, // To set maxheight of images that you want in your app
        maxWidth: 1000); // To set maxheight of images that you want in your app
    List<XFile> xfilePick = pickedFile;

    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        selectedImagesCars.add(File(xfilePick[i].path));
      }
    } else {
      // If no image is selected it will show a
      // snackbar saying nothing is selected
      ScaffoldMessenger.of(context ).showSnackBar(
          const SnackBar(content: Text('Nothing is selected')));
    }
    loadingImageCars=0;
    emit(AppListImageAddPostCars());
  }

  Future getImagesLands({required context}) async {
    loadingImageLands=1;
    emit(AppListImageLoadingPostLands());
    selectedImagesLands = [];
    final pickedFile = await _picker.pickMultiImage(
        imageQuality: 100, // To set quality of images
        maxHeight: 1000, // To set maxheight of images that you want in your app
        maxWidth: 1000); // To set maxheight of images that you want in your app
    List<XFile> xfilePick = pickedFile;

    if (xfilePick.isNotEmpty) {
      for (var i = 0; i < xfilePick.length; i++) {
        selectedImagesLands.add(File(xfilePick[i].path));
      }

    } else {
      // If no image is selected it will show a
      // snackbar saying nothing is selected
      ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Nothing is selected')));
    }
    loadingImageLands=0;
    emit(AppListImageAddPostLands());
  }


  // void getDio({required String url})
  // async {
  //   emit(AppLoadingGetHouses());
  //   if(houses.length==0)
  //     {
  //       Dio(BaseOptions(receiveTimeout: Duration(seconds:  6),connectTimeout: Duration(seconds: 7),))
  //           .get('https://real-estates-test.000webhostapp.com/public/api/houses').then((value) {
  //         emit(AppSuccessfulGetHouses());
  //         print("Succesfal data");
  //         houses=value.data;
  //         print(houses);
  //
  //       }).catchError((error){
  //         emit(AppErrorGetHouses());
  //         print("error =$error");
  //       }) ;
  //     }else
  //       {
  //         emit(AppSuccessfulGetHouses());
  //       }
  // }

  void loginDio({required String email, required String password,required context}) async {
    emit(AppLoadingPostLogin());
    Either<String, String> result =
    (await _authRepo.loginUser(email: email, password: password));
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("يوجد خطأ")));
      emit(AppErrorPostLogin());
      print( l);
      //show error
    }, (r) {
      emit(AppSuccessfulPostLogin());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("تم")));
      Navigator.push(context, MaterialPageRoute(builder: (context) => start(),));
      print("successful");

      //save user
    });
  }


  void HousePostDio({required String location,
    required String direction,
    required String floor,
    required String space,
    required String room_number,
    required String price,
    required List<File> images,
    required String operation_id,
    required String duration,
    required context
  }) async {
    emit(AppLoadingPostHouses());
    Either<String, String> result =
    await _authRepo.PostHouses(
        location: location,
        direction: direction,
        floor: floor,
        space: space,
        room_number: room_number,
        price: price,
        images: images,
        operation_id: operation_id,
        duration: duration
    );
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("يوجد خطأ")));

      emit(AppErrorPostHouses());
      print("Error");

      //show error
    }, (r) {
      emit(AppSuccessfulPostHouses());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("تم")));
      print("sucsessful pppppost");

      //save user
    });
  }

  void FilterPostDio({
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
    required context
  }) async {
    emit(AppLoadingPostHousesFilter());
    Either<String, List<Houses>> result =
    await _authRepo.FilterHouses(
        location: location,
        direction: direction,
        floor: floor,
        max_price:max_price ,
        min_price:min_price ,
        max_space:max_space ,
        max_room_number:max_room_number ,
        min_room_number:min_room_number ,
        min_space:min_space ,
        operation_id: operation_id,
    );
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("يوجد خطأ")));
      emit(AppErrorPostHousesFilter());
      print("Error");
      //show error
    }, (r) {
      emit(AppSuccessfulPostHousesFilter());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("تم")));
      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchHouses(searchHouses: r),));

      print("successful Filter");
      //save user
    });
  }


  void FilterPostDioCars({
    required String name,
    required int min_price,
    required int max_price,
    required int min_year,
    required int max_year,
    required int is_new,
    required String color,
    required int operation_id,
    required context
  }) async {
    emit(AppLoadingPostCarsFilter());
    Either<String, List<Cars>> result =
    await _authRepo.FilterCars(
      name:name ,
      min_year:min_year ,
      max_year:max_year ,
      is_new:is_new ,
      color:color ,
      max_price:max_price ,
      min_price:min_price ,
      operation_id: operation_id,
    );
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("يوجد خطأ")));
      emit(AppErrorPostCarsFilter());
      print("Error");
      //show error
    }, (r) {
      emit(AppSuccessfulPostCarsFilter());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("تم")));
      print("successful Filter");
      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchCars(searchCars: r),));
      //save user
    });
  }

  void FilterPostDioLands({
    required String location,
    required String min_space,
    required String max_space,
    required String min_price,
    required String max_price,
    required String operation_id,
    required context
  }) async {
    emit(AppLoadingPostLandsFilter());
    Either<String, List<Lands>> result =
    await _authRepo.FilterLands(
      location: location,
      max_price:max_price ,
      min_price:min_price ,
      max_space:max_space ,
      min_space:min_space ,
      operation_id: operation_id,
    );
    result.fold((l) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("يوجد خطأ")));
      emit(AppErrorPostLandsFilter());
      print("Error");
      //show error
    }, (r) {
      emit(AppSuccessfulPostLandsFilter());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("تم")));
      Navigator.push(context, MaterialPageRoute(builder: (context) => SearchLands(searchLand: r),));

      print("successful Filter");
      //save user
    });
  }



  void showHousesDio() async {
    emit(AppLoadingGetHouses());
    Either<String, List<Houses>> result =
    await _authRepo.showHouses();
    result.fold((l) {
      emit(AppErrorGetHouses());
      print("Error$l");
      //show error
    }, (r) {


      // listHouses?.addAll(r);
      listHouses=r;
      emit(AppSuccessfulGetHouses(r as List<Houses>));
      // getDataBase(database).then((value) {
      //   value.forEach((element) {
      //     FavHouses.add(listHouses[element['idx']]);
      //     // FavHouses.add(listHouses[element['idx']];
      //   });
      //   // listNote.addAll(value);
      //   listNote=value;
      //   // print("${value[0]['idx']}");
      //   print(listNote);
      //   emit(AppGetDataBase());
      // });
      // print("sucsessful pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp${listHouses[0].id}");


      //save user
    });
  }

  void showCarsDio() async {
    emit(AppLoadingGetCars());
    Either<String, List<Cars>> result =
    await _authRepo.showCars();
    result.fold((l) {
      emit(AppErrorGetCars());
      print("Error$l");
      //show error
    }, (r) {


      // listHouses?.addAll(r);
      listCars=r;
      emit(AppSuccessfulGetCars(r as List<Cars>));
      // getDataBase2(database2).then((value) {
      //   value.forEach((element) {
      //     FavCars.add(listCars[element['idx']]);
      //     // FavHouses.add(listHouses[element['idx']];
      //   });
      //   // listNote.addAll(value);
      //   listNote2=value;
      //   print(listNote2);
      //   emit(AppGetDataBase2());
      // });
      print("sucsessful ccccccccccccccccccccccccccccccccccc");


      //save user
    });
  }

  void showLandsDio() async {
    emit(AppLoadingGetLands ());
    Either<String, List<Lands >> result =
    await _authRepo.showLand();
    result.fold((l) {
      emit(AppErrorGetLands ());
      print("Error$l");
      //show error
    }, (r) {
      // listHouses?.addAll(r);

      listLands =r;
      emit(AppSuccessfulGetLands (r as List<Lands>));
      // getDataBase3(database3).then((value) {
      //   value.forEach((element) {
      //     FavLands.add(listLands[element['idx']]);
      //     // FavHouses.add(listHouses[element['idx']];
      //   });
      //   // listNote.addAll(value);
      //   listNote3=value;
      //   // print(listNote3);
      //   emit(AppGetDataBase3());
      // });
      print("sucsessful ccccccccccccccccccccccccccccccccccc");


      //save user
    });
  }


  void showMyPost() async {
    emit(AppLoadingGetMyPost ());
    Either<String, List<myPost>> result =
    await _authRepo.showMyPost();
    result.fold((l) {
      emit(AppErrorGetMyPost ());
      print("Error$l");
      //show error
    }, (r) {
      // listHouses?.addAll(r);
      listMyPost=r;
      emit(AppSuccessfulGetMyPost (r as List<myPost>));
      print("sucsessful ccccccccccccccccccccccccccccccccccc");


      //save user
    });
  }

  void showNotificationDio() async {
    emit(AppLoadingGetNotification());
    Either<String, List> result =
    await _authRepo.showNotification();
    result.fold((l) {
      emit(AppErrorGetNotification ());
      print("Error$l");
      //show error
    }, (r) {
      // listHouses?.addAll(r);
      listNotification=r;
      emit(AppSuccessfulGetNotification (r as List));
      print("sucsessful pppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppppp${listHouses}");


      //save user
    });
  }

  void showUser() async {
    emit(AppLoadingGetUser());
    Either<String, Map> result = await _authRepo.getProfile();
    result.fold((l) {
      emit(AppErrorGetUser());
      print("Error= $l");
    }, (r) {
      listUser=r;
      print("${listUser}");
      print("rrrrrrrrrrr=${r }");
      emit(AppSuccessfulGetUser());
      print("Successful");
    });
  }

  void CreateDio({
    required String name,
    required String email,
    required String password,
    required String password_confirmation,
    required context,
    String ?phone,
    var image,
    var fileName,
  }) async {
    emit(AppLoadingPostCreateUser());
    Either<String, String> result =
    await _authRepo.createUser(
        name: name,
        email: email,
        password: password,
        password_confirmation: password_confirmation,
        phone: phone,
        image: image,
      fileName: fileName
    );
    result.fold((l) {
      emit(AppErrorPostCreateUser());
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("يوجد خطأ")));
      print("Error");
      //show error
    }, (r) {
      emit(AppSuccessfulPostCreateUser());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تم")));
      Navigator.push(context, MaterialPageRoute(builder: (context) => start(),));
      print("sucsessful");

      //save user
    });
  }
  void PostDioLogin({required String email,required String password})
  async {
    y=1;
    emit(AppLoadingPostLogin());

      Dio(BaseOptions(receiveTimeout: Duration(seconds:  6),connectTimeout: Duration(seconds: 7),))
          .post('https://real-estates-test.000webhostapp.com/public/api/login?email=$email&password=$password').then((value) {
            y=0;
        emit(AppSuccessfulPostLogin());
        print("Succesfal data");
        Login=value.data;
        print(Login);
        print(value.data['access_token']['token']);
      }).catchError((error){
        y=0;
        emit(AppErrorPostLogin());
        print("error =$error");
      }) ;

  }


  void PostDioCreateUser(
      {
      required String name,
      required String email,
      required String password,
      required String password_confirmation,
      String ?phone,
      String ?image
      })
  async {
    x=1;
    emit(AppLoadingPostCreateUser());
    Dio(BaseOptions(receiveTimeout: const Duration(seconds: 6),connectTimeout: const Duration(seconds: 7),))
        .post('https://real-estates-test.000webhostapp.com/public/api/users/add?name=$name&email=$email&phone=$phone&password=$password&img=$image')
        .then((value) {
          x=0;
      emit(AppSuccessfulPostCreateUser());
      print("Successfal Create User");
      CreateUser=value.data;
      print(CreateUser);
      print(value.statusCode);
    }).catchError((error){
      x=0;
      emit(AppErrorPostCreateUser());
      print("error in Create User =$error");
    }) ;

  }


  void PostDioEditeUser(
      {required String name,
        required String email,
        required String password,
        String ?phone,
        String ?image})
  async {
    z=1;
    emit(AppLoadingPostEditeUser());
    Dio(BaseOptions(receiveTimeout: const Duration(seconds: 6),connectTimeout: const Duration(seconds: 7),))
        .post(
        'https://real-estates-test.000webhostapp.com/public/api/users/edit/1?name=$name&email=$email&phone=$email&password=$password&img=$image')
        .then((value) {
      z=0;
      emit(AppSuccessfulPostEditeUser());
      print("Successfal Edite User");
      print(value.data);
      print(value.statusCode);
    }).catchError((error){
      z=0;
      emit(AppErrorPostEditeUser());
      print("error in Create User =$error");
    }) ;

  }



  // void PostDioFilterHouses(
  //     {required String location,
  //       required String min_space,
  //       required String max_space,
  //       required String direction,
  //       required String floor,
  //       required String min_room_number,
  //       required String max_room_number,
  //       required String min_price,
  //       required String max_price,
  //       required String operation_id
  //
  //
  //     })
  // async {
  //   x=1;
  //   emit(AppLoadingFilterHouses ());
  //   Dio(BaseOptions(receiveTimeout: const Duration(seconds: 6),connectTimeout: const Duration(seconds: 7),))
  //       .post(
  //       'http://real-estates-test.000webhostapp.com/public/api/posts/filter/houses?location=Aleppo&min_space=200&max_space=2000&direction=west&floor=2&min_room_number=3&max_room_number=3&min_price=300&max_price=2000&operation_id=1')
  //       .then((value) {
  //     x=0;
  //     emit(AppSuccessfulFilterHouses ());
  //     print("Successfal Filter");
  //     FilterHouses=value.data;
  //     print(FilterHouses);
  //     print(value.statusCode);
  //   }).catchError((error){
  //     x=0;
  //     emit(AppErrorPostFilterHouses());
  //     print("error in Create User =$error");
  //   }) ;
  //
  // }



List<Houses> FavHouses=[];
List<Cars> FavCars=[];
List<Lands> FavLands=[];


  void CreateDataBase()
  {
    openDatabase(
      'dd.db',
      version: 1,
      onCreate: (database, version) {
        database.execute('CREATE TABLE note(id INTEGER PRIMARY KEY,idx INTEGER)').then((value) {
          print("create Table Successful");
        }).catchError((error){print(" Error : Not Create Table");});
      },
      onOpen: (database) {
        getDataBase(database).then((value) {

          emit(AppGetDataBase());
        });
        print("------------------------------------DataBase Successful--------------------------- ");
      }


      ,

    ).then((value) {
      database=value;
      emit(AppCreateDataBase());
    });
  }
  void CreateDataBase2()
  {
    openDatabase(
      'ddd.db',
      version: 1,
      onCreate: (database2, version) {
        database2.execute('CREATE TABLE note(id INTEGER PRIMARY KEY,idx INTEGER)').then((value) {
          print("create Table Successful");
        }).catchError((error){print(" Error : Not Create Table");});
      },
      onOpen: (database2) {
        getDataBase(database2).then((value) {

          emit(AppGetDataBase2());
        });
        print("------------------------------------DataBase Successful--------------------------- ");
      }


      ,

    ).then((value) {
      database2=value;
      emit(AppCreateDataBase2());
    });
  }

  void CreateDataBase3()
  {
    openDatabase(
      'ddd.db',
      version: 1,
      onCreate: (database3, version) {
        database3.execute('CREATE TABLE note(id INTEGER PRIMARY KEY,idx INTEGER)').then((value) {
          print("create Table Successful");
        }).catchError((error){print(" Error : Not Create Table");});
      },
      onOpen: (database3) {
        getDataBase(database3).then((value) {

          emit(AppGetDataBase3());
        });
        print("------------------------------------DataBase Successful--------------------------- ");
      }

      ,

    ).then((value) {
      database3=value;
      emit(AppCreateDataBase3());
    });
  }

  Future<List<Map>> getDataBase(Database database)async
  {
    emit(AppLoadingGetDataBase());
    print("in get Data");
    return  await database.rawQuery('select * from note');
  }

  Future<List<Map>> getDataBase2(Database database2)async
  {
    emit(AppLoadingGetDataBase2());
    print("in get Data");
    return  await database2.rawQuery('select * from note');
  }

  Future<List<Map>> getDataBase3(Database database3)async
  {
    emit(AppLoadingGetDataBase3());
    print("in get Data");
    return  await database3.rawQuery('select * from note');
  }
  Future insertDataBase({idx})
  {
    FavHouses=[];
    print("in insert Data");
    return  database.transaction((txn)async {
      txn.rawInsert('insert into note (idx) values ($idx)')
          .then((value){
        emit(AppInsertDataBase());
        print("value =$value");
        id=value;
        getDataBase(database).then((value) {
          value.forEach((element) {
            FavHouses.add(listHouses[element['idx']]);
            // FavHouses.add(listHouses[element['idx']];
          });
          // listNote.addAll(value);
          listNote=value;
          print("${value[0]['idx']}");
          print(listNote);
          emit(AppGetDataBase());
        });
      }
      ).catchError((error){print("error in insert");});
    });
  }

  Future insertDataBase2({idx})
  {
    FavCars=[];
    print("in insert Data");
    return  database2.transaction((txn)async {
      txn.rawInsert('insert into note (idx) values ($idx)')
          .then((value){
        emit(AppInsertDataBase2());
        print("value =$value");
        id=value;
        getDataBase(database2).then((value) {
          value.forEach((element) {
            FavCars.add(listCars[element['idx']]);
          });
          // listNote.addAll(value);
          listNote2=value;
          print("${value[0]['idx']}");
          print(listNote2);
          emit(AppGetDataBase2());
        });
      }
      ).catchError((error){print("error in insert");});
    });
  }


  Future insertDataBase3({idx})
  {
    FavLands=[];
    print("in insert Data");
    return  database3.transaction((txn)async {
      txn.rawInsert('insert into note (idx) values ($idx)')
          .then((value){
        emit(AppInsertDataBase3());
        print("value =$value");
        id=value;
        getDataBase(database3).then((value) {
          value.forEach((element) {
            FavLands.add(listLands[element['idx']]);
          });
          // listNote.addAll(value);
          listNote3=value;
          print("${value[0]['idx']}");
          print(listNote3);
          emit(AppGetDataBase3());
        });
      }
      ).catchError((error){print("error in insert");});
    });
  }


  DeleteDataBase({id})async
  {
    FavHouses=[];
    print("in delete");
    return await database.rawDelete('DELETE FROM note WHERE id = $id').then((value) {
      emit(AppDeleteDataBase());
      print("delete successful");
      getDataBase(database).then((value) {
        value.forEach((element) {
          FavHouses.add(listHouses[element['idx']]);
        });
        listNote=value;
        print(listNote);
        emit(AppGetDataBase());
      });
    }).catchError((error){print("error in delete");});
  }

  DeleteDataBase2({id})async
  {
    FavCars=[];
    print("in delete");
    return await database2.rawDelete('DELETE FROM note WHERE id = $id').then((value) {
      emit(AppDeleteDataBase2());
      print("delete successful");
      getDataBase(database2).then((value) {
        value.forEach((element) {
          FavCars.add(listCars[element['idx']]);
        });
        listNote2=value;
        print(listNote2);
        emit(AppGetDataBase2());
      });
    }).catchError((error){print("error in delete");});
  }


  DeleteDataBase3({id})async
  {
    FavLands=[];
    print("in delete");
    return await database3.rawDelete('DELETE FROM note WHERE id = $id').then((value) {
      emit(AppDeleteDataBase3());
      print("delete successful");
      getDataBase(database3).then((value) {
        value.forEach((element) {
          FavLands.add(listLands[element['idx']]);
        });
        listNote3=value;
        print(listNote3);
        emit(AppGetDataBase3());
      });
    }).catchError((error){print("error in delete");});
  }

  DeleteAll()async
  {
    FavHouses=[];
    print("in delete All ");
    return await database.rawDelete('DELETE FROM note ').then((value) {
      emit(AppDeleteDataBase());
      print("delete successful All ");
      getDataBase(database).then((value) {
        value.forEach((element) {
          FavHouses.add(listHouses[element['idx']]);
        });
        listNote=value;
        print(listNote);
        emit(AppGetDataBase());
      });
    }).catchError((error){print("error in delete All ");});

  }

  DeleteAll2()async
  {
    FavCars=[];
    print("in delete All ");
    return await database2.rawDelete('DELETE FROM note ').then((value) {
      emit(AppDeleteDataBase2());
      print("delete successful All ");
      getDataBase(database2).then((value) {
        value.forEach((element) {
          FavCars.add(listCars[element['idx']]);
        });
        listNote2=value;
        print(listNote2);
        emit(AppGetDataBase2());
      });
    }).catchError((error){print("error in delete All ");});

  }

  DeleteAll3()async
  {
    FavLands=[];
    print("in delete All ");
    return await database3.rawDelete('DELETE FROM note ').then((value) {
      emit(AppDeleteDataBase3());
      print("delete successful All ");
      getDataBase(database3).then((value) {
        value.forEach((element) {
          FavLands.add(listLands[element['idx']]);
        });
        listNote3=value;
        print(listNote3);
        emit(AppGetDataBase3());
      });
    }).catchError((error){print("error in delete All ");});

  }


  // Future updateDataBase({id,fav})async
  // {
  //   emit(AppGetDataBase());
  //   print("id = $id");
  //   print("in update");
  //   return await database.rawUpdate('UPDATE note SET fav=1 WHERE id = ${id}',)
  //       .then((value) {
  //
  //     print("update successful");
  //     getDataBase(database).then((value) {
  //       emit(AppUpdateDataBase());
  //       // listNote.addAll(value);
  //       listNote=value;
  //       print(listNote[id]);
  //       emit(AppGetDataBase());
  //     });
  //
  //   }).catchError((error){
  //     print("error in update");
  //   }
  //   );
  //
  // }



  void functionSearch({ required value,required context})
  {

    Search=[];
    if(value.isNotEmpty)
    {
      SearchOrNo=true;
      // houses.forEach((element) {
      //   var x=element;
      //   print("element = \n $element");
      //   print(element);
      //   if(element.contains(value))
      //   {
      //     Search.add(element);
      //   }
      // });
      print( "Search \n = $Search");

    }
    else
    {
      SearchOrNo=false;
    }
    emit(AppSearch());

  }

}







