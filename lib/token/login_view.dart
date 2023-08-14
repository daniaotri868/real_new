// import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//

//
// class LoginView extends StatefulWidget {
//   const LoginView({Key? key}) : super(key: key);
//
//   @override
//   State<LoginView> createState() => _LoginViewState();
// }
//
// class _LoginViewState extends State<LoginView> {
//   double _headerHeight = 250;
//   TextEditingController controllerDilocode = TextEditingController();
//   TextEditingController controllerPhoneNumber = TextEditingController();
//   final DilocodeFoucs = FocusNode();
//   final PhoneNumberFoucs = FocusNode();
//   var formkey = GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     var emailController = TextEditingController(text: "");
//     var passwordController = TextEditingController(text: "");
//     return BlocBuilder<InitialCubit, InitialStates>(
//       builder: (context, state) {
//         return Directionality(
//             textDirection: TextDirection.rtl,
//             child: BlocListener<InitialCubit, InitialStates>(
//               listener: (context, state) {
//                 if (state is LoginSuccessState) {
//                   Navigator.pushReplacementNamed(context, Routes.homesRoute);
//                 }
//               },
//               child: Scaffold(
//                 resizeToAvoidBottomInset: false,
//                 backgroundColor: Colors.white,
//                 body: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       Container(
//                         height: _headerHeight,
//                         child: HeaderWidget(
//                             _headerHeight, true, Icons.login_rounded),
//                       ),
//                       SafeArea(
//                         child: Container(
//                           padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//                           margin: const EdgeInsets.fromLTRB(20, 10, 20, 10),
//                           child: Column(
//                             children: [
//                               CustomText(
//                                 txt: AppStrings.loginTitle,
//                                 txtColor: ColorManager.primary,
//                                 fontWeight: FontWeight.w700,
//                                 fontSize: 30.sp,
//                               ),
//                               30.verticalSpace,
//                               Form(
//                                 key: formkey,
//                                 child: Column(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     TextFormField(
//                                       controller: emailController,
//                                       decoration:
//                                           ThemeHelper().textInputDecoration(
//                                         AppStrings.usernameHint,
//                                         AppStrings.usernameOutBorder,
//                                       ),
//                                       validator: (val) {
//                                         if (val!.isEmpty) {
//                                           DilocodeFoucs.requestFocus();
//                                           return AppStrings.validateEmail;
//                                         }
//                                       },
//                                     ),
//                                     30.verticalSpace,
//                                     TextFormField(
//                                       controller: passwordController,
//                                       obscureText: true,
//                                       decoration: ThemeHelper()
//                                           .textInputDecoration(
//                                               AppStrings.passwordHint,
//                                               AppStrings.usernameOutBorder),
//                                       validator: (val) {
//                                         if (val!.isEmpty) {
//                                           DilocodeFoucs.requestFocus();
//                                           return AppStrings.validatePassword;
//                                         }
//                                       },
//                                     ),
//                                     30.verticalSpace,
//                                     ConditionalBuilder(
//                                       fallback: (BuildContext context) =>
//                                           Center(
//                                         child: CircularProgressIndicator(
//                                           color: ColorManager.primary,
//                                         ),
//                                       ),
//                                       condition: state is! LoginLoadingState,
//                                       builder: (BuildContext context) =>
//                                           Container(
//                                         margin: const EdgeInsets.fromLTRB(
//                                             25, 10, 25, 10),
//                                         padding: const EdgeInsets.fromLTRB(
//                                             10, 0, 10, 0),
//                                         decoration: ThemeHelper()
//                                             .buttonBoxDecoration(context),
//                                         child: CustomGeneralButton(
//                                           text: AppStrings.loginBtn,
//                                           onTap: () {
//                                             if (formkey.currentState!
//                                                 .validate()) {
//                                               print(emailController.text);
//                                               print(passwordController.text);
//                                               InitialCubit.get(context).login(
//                                                 email: emailController.text
//                                                     .toString(),
//                                                 password: passwordController
//                                                     .text
//                                                     .toString(),
//                                               );
//                                               // Navigator.pushNamed(
//                                               //     context,
//                                               //     Routes.homesRoute);
//                                             }
//                                           },
//                                         ),
//                                       ),
//                                     ),
//                                     Container(
//                                       margin: REdgeInsetsDirectional.only(
//                                           end: 50,
//                                           top: 20,
//                                           start: 100,
//                                           bottom: 20),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           const CustomText(
//                                             txt: AppStrings.login,
//                                           ),
//                                           10.verticalSpace,
//                                           GestureDetector(
//                                             onTap: () {
//                                               Navigator.pushNamed(context,
//                                                   Routes.registerRoute);
//                                             },
//                                             child: CustomText(
//                                               txt: AppStrings.forgetPassword,
//                                               txtColor: ColorManager.primary,
//                                               fontWeight: FontWeight.w700,
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                               )
//                             ],
//                           ),
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ));
//       },
//     );
//   }
// }
