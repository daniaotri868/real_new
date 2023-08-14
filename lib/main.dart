import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:real_new/token/cash_helper.dart';
// import 'package:http/http.dart' as http;
import 'cubit/app_cubit.dart';
import 'loading.dart';
// import 'cash_helper.dart';
// import 'cash_helper.dart';


// List<Ca>
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await CachHelper.init();
  runApp( const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..CreateDataBase()..CreateDataBase2()..CreateDataBase3(),
      child: ScreenUtilInit(
        designSize: const Size(428, 926),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return  MaterialApp(
              title: 'Localizations Sample App',
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: const [
                Locale('ar', "AE"), // EnglishSpanish
              ],
              debugShowCheckedModeBanner: false,
              theme: ThemeData(
                  fontFamily: 'Tajawal'
              ),
              home: Loading()
          );
        },

      ),
    );
  }
}
