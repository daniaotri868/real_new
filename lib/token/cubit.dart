// import 'package:dartz/dartz.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:stay_home/Presntation/login/cubit/states.dart';
// import 'package:stay_home/Presntation/resources/routes_manager.dart';
// import 'package:stay_home/data_remote/auth_repo.dart';
// import 'package:stay_home/model/auth_model.dart';
//
// import '../../../model/home_model.dart';
//
// class InitialCubit extends Cubit<InitialStates> {
//   late final AuthRepo _authRepo;
//   InitialCubit() : super(LoginInitialState()) {
//     _authRepo = AuthRepo();
//   }
//
//   static InitialCubit get(context) => BlocProvider.of(context);
//   void login({required String email, required String password}) async {
//     emit(LoginLoadingState());
//     Either<String, String> result =
//         await _authRepo.loginUser(email: email, password: password);
//     result.fold((l) {
//       emit(LoginErrorState());
//       //show error
//     }, (r) {
//       emit(LoginSuccessState());
//       //save user
//     });
//   }
//
//   void createUser(
//       {required String fullName,
//       required String email,
//       required String imgUrl,
//       required String password,
//       required String phoneNumber,
//       required String birthdate,
//       required String deviceToken,
//       required BuildContext context,
//       required String cityId,
//       int? gender}) async {
//     emit(CreateLoadingState());
//
//     Either<String, AuthModel> result = await _authRepo.createUser(
//       fullName: fullName,
//       email: email,
//       imgUrl: imgUrl,
//       password: password,
//       phoneNumber: phoneNumber,
//       birthdate: birthdate,
//       deviceToken: deviceToken,
//       cityId: cityId,
//       gender: gender,
//       // gender: gender
//     );
//
//     result.fold((l) {
//       emit(CreateErrorState());
//       //show error
//     }, (r) {
//       emit(CreateSuccessState());
//       Navigator.pushNamed(context, Routes.profilesRoute, arguments: r);
//     });
//   }
//
//   void homeCubit() async {
//     emit(HomeLoadingState());
//     Either<String, List<HomeModel>> result = await _authRepo.getHome();
//     result.fold((l) {
//       emit(HomeErrorState());
//       //show error
//     }, (r) {
//       emit(HomeSuccessState(result as List<HomeModel>));
//       //save user
//     });
//   }
// }
//
// //http://stayhome22-001-site1.ftempurl.com/api/Mobile/Customer/Create?FullName=Joudi&Email=joudi%47wQbNPTDJp9hMYdvogK2hAUiHsGeiybwaWe36bwtRQ3UTpYV7YuZ8FV5j9nauFCWwcjM6dTzpL5s2N79Rp5unwdMvc8ZKUCityId=d024439e-9efc-4a4c-94de-50e05c4df267
