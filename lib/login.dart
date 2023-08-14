import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_new/widget/customTextField.dart';

import 'color/colorMain.dart';
import 'createUser.dart';
import 'cubit/app_cubit.dart';

class ProfilePage extends StatefulWidget {
  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  TextEditingController emailController=TextEditingController(text: "");

   TextEditingController passwordController=TextEditingController(text: "");

final PasswordFoucs=FocusNode();

final emailFoucs=FocusNode();

   final fromKey=GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          // resizeToAvoidBottomInset: true,
          resizeToAvoidBottomInset: false,
          // resizeToAvoidBottomPadding: false, // this avoids the overflow error

          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: ColorBlue,
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () {},
            ),
          ),
          body: Form(
            key:fromKey ,
            child: Stack(
              alignment: Alignment.center,
              children: [
                CustomPaint(
                  painter: HeaderCurvedContainer(),
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: REdgeInsetsDirectional.only(top: 40),
                      child: Text(
                        "تسجيل دخول",
                        style: TextStyle(
                          fontSize: 30.sp,
                          letterSpacing: 1.5,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    RSizedBox(height: 50,),
                    Container(
                      padding: REdgeInsetsDirectional.only(top: 70),
                      width: 130,
                      height:130,
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 5),
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/images/pe.png'),
                        ),
                      ),
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                        height: 450,
                        width: double.infinity,
                        margin: EdgeInsets.symmetric(horizontal: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // CircleAvatar(
                            //   backgroundColor: ColorBlue,
                            //   radius: 50,
                            //   child: Image.asset('assets/images/boy.png',fit: BoxFit.fill,height: 70,width: 70),
                            // ),
                            SizedBox(height: 10,),
                            CustomTextField(
                              hint_text: "الايميل",
                              readOnly: false,
                              line: 1,
                              suffix: false,
                              suffix_icon: null,
                              controller: emailController,
                              keyboard: TextInputType.emailAddress,
                              validate: (value) {
                                if(value!.isEmpty)
                                {
                                  // emailFoucs.requestFocus();
                                  return "رجاءً إملاءه , أنه فارغ";
                                }
                                // if(value.length<6)
                                // {
                                //   emailFoucs.requestFocus();
                                //   return "لا يسمح بأقل من 6 محارف";
                                // }
                              },
                              obsc: false,
                              // focusNode:emailFoucs ,
                              prefixIcon: Icon(Icons.email, color: Colors.grey),
                            ),
                            SizedBox(height: 30,),
                            CustomTextField(
                              hint_text: "كلمة السر",
                              readOnly: false,
                              line: 1,
                              suffix: false,
                              suffix_icon: null,
                              controller: passwordController,
                              keyboard: TextInputType.visiblePassword,
                              validate: (value) {
                                if(value!.isEmpty)
                                {
                                  // PasswordFoucs.requestFocus();
                                  return "رجاءً إملاءه , أنه فارغ";
                                }
                                if(value.length<6)
                                {
                                  // PasswordFoucs.requestFocus();
                                  return "لا يسمح بأقل من 6 محارف";
                                }
                              },
                              obsc: AppCubit
                                  .get(context)
                                  .visib,
                              // focusNode:PasswordFoucs ,
                              prefixIcon: Icon(Icons.lock, color: Colors.grey),
                            ),
                            RSizedBox(height: 12,),
                            TextButton(onPressed: () {
                              Navigator.push(context, MaterialPageRoute(
                                builder: (context) => const createUser(),)
                              );
                            },
                                child: Text("هل نسيت كلمة السر ؟!",
                                  style: TextStyle(color: ColorBlue),)),
                            SizedBox(height: 30,),
                            state is AppLoadingPostLogin ?
                            Center(
                              child: Container(height: 100.h,
                                  child: Center(child: CircularProgressIndicator(
                                    color: ColorBlue,))),
                            )
                                : TextButton(
                              onPressed: () {
                                print("hhhhhhhhhhhhhher");
                                print(emailController.text.toString());
                                print(passwordController.text.toString());

                                if (fromKey.currentState!.validate()) {
                                  AppCubit.get(context).loginDio(context: context,
                                      email: emailController.text.toString(),
                                      password: passwordController.text
                                          .toString());
                                }
                              },

                              child: Container(
                                padding: EdgeInsets.all(0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: ColorBlue
                                ),
                                height: 50,
                                width: double.infinity,

                                child: Center(child: Text("تسجيل",
                                  style: TextStyle(color: Colors.white),)),
                              ),
                            ),

                            const RSizedBox(height: 5,),
                            Center(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const Text("لم تنشأ حساب ؟!"),
                                  TextButton(onPressed: () {
                                    Navigator.push(context, MaterialPageRoute(
                                      builder: (context) => const createUser(),));
                                  },
                                      child: Text("اضغط هنا",
                                        style: TextStyle(color: ColorBlue),)),
                                ],
                              ),
                            )
                          ],
                        )
                    )
                  ],
                ),


                // Padding(
                //   padding: EdgeInsets.only(bottom: 270, left: 184),
                //   child: CircleAvatar(
                //     backgroundColor: Colors.black54,
                //     child: IconButton(
                //       icon: Icon(
                //         Icons.edit,
                //         color: Colors.white,
                //       ),
                //       onPressed: () {},
                //     ),
                //   ),
                // )
              ],
            ),
          ),
        );
      },
    );
  }
}

class HeaderCurvedContainer extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = ColorBlue;
    Path path = Path()
      ..relativeLineTo(0, 150)
      ..quadraticBezierTo(size.width / 2, 225, size.width, 150)
      ..relativeLineTo(0, -150)
      ..close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}


// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:real_new/widget/customTextField.dart';
//
//
// import 'color/colorMain.dart';
// import 'createUser.dart';
// import 'cubit/app_cubit.dart';
//
// class loginScreen extends StatefulWidget {
//    loginScreen({Key? key}) : super(key: key);
//
//   @override
//   State<loginScreen> createState() => _loginScreenState();
// }
//
// class _loginScreenState extends State<loginScreen> {
//    TextEditingController emailController=TextEditingController(text: "");
//
//    TextEditingController passwordController=TextEditingController(text: "");
//
// final PasswordFoucs=FocusNode();
//
// final emailFoucs=FocusNode();
//
//    final fromKey=GlobalKey<FormState>();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<AppCubit, AppState>(
//   builder: (context, state) {
//     return Scaffold(
//       backgroundColor: ColorbackgroundDark,
//       body: Form(
//         key: fromKey,
//         child: Container(
//           padding: EdgeInsets.all(20),
//           child: Center(
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.center,
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   CircleAvatar(
//                     backgroundColor: ColorBlue,
//                     radius: 50,
//                     child: Image.asset('assets/images/boy.png',fit: BoxFit.fill,height: 70,width: 70),
//                   ),
//                   SizedBox(height: 10,),
//                   Text("تسجيل الدخول ",style: TextStyle(fontSize: 25)),
//                   SizedBox(height: 100,),
//                   CustomTextField(
//                       hint_text: "الايميل",
//                       readOnly: false,
//                       line: 1,
//                       suffix: false,
//                       suffix_icon: null,
//                       controller:emailController ,
//                       keyboard: TextInputType.emailAddress ,
//                       // validate: (value) {
//                       //   if(value!.isEmpty)
//                       //   {
//                       //     // emailFoucs.requestFocus();
//                       //     return "رجاءً إملاءه , أنه فارغ";
//                       //   }
//                       //   // if(value.length<6)
//                       //   // {
//                       //   //   emailFoucs.requestFocus();
//                       //   //   return "لا يسمح بأقل من 6 محارف";
//                       //   // }
//                       // },
//                       obsc: false,
//                       // focusNode:emailFoucs ,
//                       prefixIcon: Icon(Icons.email,color: Colors.grey),
//                   ),
//                   SizedBox(height: 30,),
//                   CustomTextField(
//                     hint_text: "كلمة السر",
//                     readOnly: false,
//                     line: 1,
//                     suffix: false,
//                     suffix_icon: null,
//                     controller:passwordController ,
//                     keyboard: TextInputType.visiblePassword,
//                     // validate: (value) {
//                     //   if(value!.isEmpty)
//                     //   {
//                     //     // PasswordFoucs.requestFocus();
//                     //     return "رجاءً إملاءه , أنه فارغ";
//                     //   }
//                     //   if(value.length<6)
//                     //   {
//                     //     // PasswordFoucs.requestFocus();
//                     //     return "لا يسمح بأقل من 6 محارف";
//                     //   }
//                     // },
//                     obsc: AppCubit.get(context).visib,
//                     // focusNode:PasswordFoucs ,
//                     prefixIcon: Icon(Icons.lock,color: Colors.grey),
//                   ),
//                   SizedBox(height: 30,),
//                   state is AppLoadingPostLogin?
//                     Center(
//                             child: Container(height: 100.h,child: Center(child: CircularProgressIndicator(color: ColorBlue,))),
//                           )
//                   :TextButton(
//                     onPressed: () {
//                      print("hhhhhhhhhhhhhher");
//                      print(emailController.text.toString());
//                      print(passwordController.text.toString());
//
//                     if(fromKey.currentState!.validate())
//                       {
//
//                         AppCubit.get(context).loginDio(context: context,email:emailController.text.toString(),password: passwordController.text.toString() );
//
//                       }
//                     },
//
//                     child: Container(
//                       padding: EdgeInsets.all(0),
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(10),
//                         color: ColorBlue
//                       ),
//                       height: 50,
//                       width: double.infinity,
//
//                       child: Center(child: Text("تسجيل",style: TextStyle(color: Colors.white),)),
//                     ),
//                   )
//
//
//                   ,SizedBox(height: 5,),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       const Text("لم تنشأ حساب ؟!"),
//                       TextButton(onPressed: () {
//                        Navigator.push(context, MaterialPageRoute(builder: (context) => const createUser(),));
//                       }, child: Text("اضغط هنا",style: TextStyle(color: ColorBlue),)),
//                     ],
//                   )
//                 ],
//               ),
//             ),
//           ),
//         ),
//       ),
//     );
//   },
// );
//   }
// }
