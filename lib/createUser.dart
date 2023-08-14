
import 'dart:io';

import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:real_new/start.dart';
import 'package:real_new/widget/customTextField.dart';

import 'color/colorMain.dart';
import 'cubit/app_cubit.dart';

class createUser extends StatefulWidget {
  const createUser({Key? key}) : super(key: key);

  @override
  State<createUser> createState() => _createUserState();
}

class _createUserState extends State<createUser> {
  TextEditingController ControllerName=TextEditingController();
  final NameFoucs=FocusNode();
  bool readOnlyName=true;
  TextEditingController ControllerPhone=TextEditingController();
  final PhoneFoucs=FocusNode();
  bool readOnlyPhone=true;
  TextEditingController ControllerEmail=TextEditingController();
  final EmailFoucs=FocusNode();
  TextEditingController passwordController=TextEditingController(text: "");
  final PasswordFoucs=FocusNode();
  TextEditingController passwordConfigController=TextEditingController(text: "");
  final PasswordConfigFoucs=FocusNode();
  bool readOnlyEmail=true;
  TextEditingController DetailsController=TextEditingController();
  final DetailsFoucs=FocusNode();

  // Future getImage()async{
  //   final XFile? image= await ImagePicker().pickImage(source: ImageSource.gallery);
  //   if(image==null)
  //     {
  //      return;
  //     }
  //   final File ?imageTemprory=File(m, image.path);
  //   setState(() {
  //     this._image=imageTemprory;
  //   });
  // }
  // final ImagePicker _picker = ImagePicker();
  // File? _photo;
  //
  // Future imgFromGallery() async {
  //   final XFile? pickedFile =
  //   await _picker.pickImage(source: ImageSource.gallery);
  //
  //   if (pickedFile != null) {
  //     _photo = File(pickedFile.path );
  //
  //   } else {
  //     print('No image selected.');
  //   }
  // }
  final fromKey=GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
        builder: (context, state) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            body: Form(
              key: fromKey,
              child:  Stack(

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
                  Padding(
                    padding: REdgeInsetsDirectional.only(top: 120.h,start: MediaQuery.of(context).size.width/2.9),
                    child: Column(
                      children: [
                        Text("إنشاء حساب ",  style: TextStyle(
                      fontSize: 25.sp,
                      letterSpacing: 1.5,
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),),
                        RSizedBox(height: 10,),
                        Stack(
                          children: [
                            RSizedBox(height: 100.h,),
                            ClipRRect(
                              borderRadius: const BorderRadius.only(
                                  topLeft:Radius.circular(60) ,topRight:Radius.circular(60),
                                  bottomLeft: Radius.circular(60),bottomRight: Radius.circular(60) ),
                              child: AppCubit.get(context).photo!=null?
                              Image.file(AppCubit.get(context).photo!,fit: BoxFit.cover,height: 130.h,width: 130.w,):
                              Image.asset('assets/images/pe.png',height: 130.h,width: 130.w,),
                            ),
                            Positioned(
                                top: 80.h,
                                child: InkWell(
                                  child: CircleAvatar(
                                    backgroundColor: ColorBlue,
                                    radius: 10,
                                    child: const Center(
                                      child: Icon(Icons.camera_alt,color: Colors.white,size: 13),
                                    ),
                                  ),
                                  onTap: () {
                                    showDialog(context: context, builder: (context) =>CupertinoAlertDialog(
                                      title: Text("هل تريد اختيار الصورة عن طريق الكاميرا أم من المعرض ؟!!"),
                                      // content: Text("Do you Delete all notebook ?!"),
                                      actions: [
                                        CupertinoDialogAction(child: TextButton(child: Text("معرض",style: TextStyle(color: ColorBlue)),onPressed: () {
                                          AppCubit.get(context).imgFromGallery();

                                          Navigator.pop(context);
                                        },)),
                                        CupertinoDialogAction(child: TextButton(child: Text("كاميرا",style: TextStyle(color: ColorBlue)),onPressed: () {
                                          AppCubit.get(context).imgFromCamera();

                                          Navigator.pop(context);
                                        },)),

                                      ],
                                    ),);
                                    print("ggggggg");
                                  },
                                )
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:REdgeInsetsDirectional.only(start: 20.w,top: 330.w,end: 20.w) ,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        RSizedBox(height: 20.h,),
                        CustomTextField(
                          readOnly: false,
                          hint_text: "الاسم",
                          prefixIcon: Icon(Icons.accessibility_new),
                          suffix: false,
                          suffix_icon: null,
                          controller:ControllerName ,
                          keyboard: TextInputType.text,
                          PasswordFoucs: NameFoucs,
                          obsc:false,
                          validate:  (value) {
                            if(value!.isEmpty)
                            {
                              NameFoucs.requestFocus();
                              return "رجاءً إملاءه , إنه فارغ ";
                            }

                          },
                        ),
                        RSizedBox(height: 20.h,),
                        CustomTextField(
                          hint_text: "الايميل",
                          prefixIcon: Icon(Icons.email,color: Colors.grey),
                          suffix: false,
                          suffix_icon: null,
                          controller:ControllerEmail ,
                          keyboard: TextInputType.emailAddress,
                          PasswordFoucs: EmailFoucs,
                          readOnly: false,
                          obsc:false,
                          validate:  (value) {
                            if(value!.isEmpty)
                            {
                              NameFoucs.requestFocus();
                              return "رجاءً إملاءه , إنه فارغ";
                            }

                          },
                        ),
                        RSizedBox(height: 20.h,),
                        CustomTextField(
                          hint_text: "كلمة السر",
                          readOnly: false,
                          line: 1,
                          suffix: true,
                          suffix_icon: IconButton(
                            icon: Icon(AppCubit.get(context).visib==true?Icons.visibility_off:Icons.visibility,color: ColorBlue,),
                            onPressed: () {
                              AppCubit.get(context).ChangeIconVisib();
                            },

                          ),
                          controller:passwordController ,
                          keyboard: TextInputType.visiblePassword,

                          validate: (value) {
                            if(value!.isEmpty)
                            {
                              PasswordFoucs.requestFocus();
                              return "رجاءً إملاءه , أنه فارغ";
                            }
                            if(value.length<6)
                            {
                              PasswordFoucs.requestFocus();
                              return "لا يسمح بأقل من 6 محارف";
                            }
                          },
                          obsc: AppCubit.get(context).visib,
                          focusNode:PasswordFoucs ,
                          prefixIcon: Icon(Icons.lock,color: Colors.grey),
                        ),
                        RSizedBox(height: 20.h,),
                        CustomTextField(
                          hint_text: "تأكيد كلمة السر",
                          readOnly: false,
                          line: 1,
                          suffix: true,
                          suffix_icon: IconButton(
                            icon: Icon(AppCubit.get(context).visib2==true?Icons.visibility_off:Icons.visibility,color: ColorBlue,),
                            onPressed: () {
                              AppCubit.get(context).ChangeIconVisib2();
                            },

                          ),
                          controller:passwordConfigController ,
                          keyboard: TextInputType.visiblePassword,

                          validate: (value) {
                            if(value!.isEmpty)
                            {
                              PasswordConfigFoucs.requestFocus();
                              return "رجاءً إملاءه , أنه فارغ";
                            }
                            if(value.length<6)
                            {
                              PasswordConfigFoucs.requestFocus();
                              return "لا يسمح بأقل من 6 محارف";
                            }
                          },
                          obsc: AppCubit.get(context).visib2,
                          focusNode:PasswordConfigFoucs ,
                          prefixIcon: Icon(Icons.lock,color: Colors.grey),
                        ),
                        RSizedBox(height: 20.h,),
                        CustomTextField(
                          readOnly: false,
                          hint_text: "الرقم",
                          prefixIcon: Icon(Icons.numbers),
                          suffix: false,
                          suffix_icon: null,
                          controller:ControllerPhone ,
                          keyboard: TextInputType.number,
                          PasswordFoucs: PhoneFoucs,
                          obsc:false,
                          validate:  (value) {
                            if(value!.isEmpty)
                            {
                              NameFoucs.requestFocus();
                              return "إملاءه إنه فارغ .";
                            }
                            if (value.contains('-')&&value.contains(',')) {
                              return '   لا يجب أن يحوي (-) و (,) ';
                            }
                            if (value.contains('-')) {
                              return 'لا يجب أن يحوي (-)';
                            }
                            if (value.contains(' ')) {
                              return 'لا يجب أن يحوي  فراغ ';
                            }if (value.contains(',')) {
                              return 'لا يجب أن يحوي (,)';
                            }

                          },
                        ),
                        RSizedBox(height: 20.h,),
                          ConditionalBuilder(
                             condition:state is! AppLoadingPostCreateUser ,
                               builder: (context) => Center(
                                 child: MaterialButton(
                                   color: ColorBlue,
                                   height: 70.h,
                                   minWidth: double.infinity,
                                   shape: OutlineInputBorder(
                                       borderRadius: BorderRadius.circular(10.r)
                                   ),
                                   onPressed: () {
                                     print("${AppCubit.get(context).photo}");
                                     if(fromKey.currentState!.validate())
                                     {
                                       print("photoPath   ${AppCubit.get(context).photoPath}");
                                       print("file name = ${AppCubit.get(context).fileName}");
                                       AppCubit.get(context).CreateDio(
                                         context: context,
                                         name:ControllerName.text.toString() ,
                                         password_confirmation:passwordConfigController.text.toString() ,
                                         email: ControllerEmail.text.toString(),
                                         phone: ControllerPhone.text.toString(),
                                         password: passwordController.text.toString(),
                                         image: AppCubit.get(context).photo,
                                         fileName: AppCubit.get(context).fileName,
                                         // fileName: AppCubit.get(context).fileName,
                                       );
                                       if(state is AppSuccessfulPostCreateUser)
                                         {

                                           Navigator.push(context, MaterialPageRoute(builder: (context) => start(),));
                                         }
                                       print("image ${AppCubit.get(context).photo}");

                                     }
                                     // print(ControllerName.text.toString());
                                     // print(ControllerEmail.text.toString());
                                     // print( ControllerPhone.text.toString());
                                     // print(passwordController.text.toString());
                                     // print(AppCubit.get(context).photo.toString());

                                     setState(() {
                                       readOnlyName=true;
                                       readOnlyPhone=true;
                                       readOnlyEmail=true;
                                     });
                                   },
                                   child: Text("تم",style: TextStyle(color: Colors.white)),
                                 ),
                               ),
                                 fallback:  (context) => Center(
                                  child: Container(height: 100.h
                                      ,child: Center(child: CircularProgressIndicator(color: ColorBlue,))
                                  ),
                                 ),
                          )
                       , RSizedBox(height: 60.h,),
                      ],
                    ),
                  ),
                ],
              ),
            )
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
