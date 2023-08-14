// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_localizations/flutter_localizations.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// import 'cash_helper.dart';
//
// void main() async {
//   WidgetsFlutterBinding.ensureInitialized();
//   await CachHelper.init();
//   runApp(MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   MyApp({
//     Key? key,
//   }) : super(key: key);
//   // Color _primarColor = HexColor('#6659B3');
//
//   @override
//   Widget build(BuildContext context) {
//     return ScreenUtilInit(
//       designSize: const Size(375, 812),
//       minTextAdapt: true,
//       splitScreenMode: true,
//       builder: (context, child) {
//         return BlocProvider(
//           create: (context) => InitialCubit(),
//           child: GetMaterialApp(
//               title: 'Localizations Sample App',
//               localizationsDelegates: const [
//                 GlobalMaterialLocalizations.delegate,
//                 GlobalWidgetsLocalizations.delegate,
//                 GlobalCupertinoLocalizations.delegate,
//               ],
//               supportedLocales: const [
//                 Locale('ar', "AE"), // EnglishSpanish
//               ],
//               theme: ThemeData(
//                 appBarTheme: const AppBarTheme(
//                   systemOverlayStyle: SystemUiOverlayStyle(
//                     statusBarColor: Colors.transparent,
//                   ),
//                 ),
//                 fontFamily: 'Inter',
//                 primaryColor: _primarColor,
//                 scaffoldBackgroundColor: Colors.grey.shade100,
//                 primarySwatch: Colors.grey,
//                 // accentColor: _accentColor,
//               ),
//               onGenerateRoute: RouteGenerator.getRoute,
//               initialRoute: Routes.splashRoute,
//               debugShowCheckedModeBanner: false,
//               home: CachHelper.sharedPreferences.getString('token') != null
//                   ? HomeView()
//                   : SplashView()
//               // home: LoginView(),
//               ),
//         );
//       },
//     );
//   }
// }
