import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_new/widget/customTextField.dart';

import 'color/colorMain.dart';
import 'cubit/app_cubit.dart';



class Profile extends StatefulWidget {

   Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();


}

class _ProfileState extends State<Profile> {
  TextEditingController ControllerName=TextEditingController();
  final NameFoucs=FocusNode();
  bool readOnlyName=true;
  TextEditingController ControllerPhone=TextEditingController();
  final PhoneFoucs=FocusNode();
  bool readOnlyPhone=true;
  TextEditingController ControllerEmail=TextEditingController();
  final EmailFoucs=FocusNode();
  bool readOnlyEmail=true;
  TextEditingController passwordController=TextEditingController(text: "");
  final PasswordFoucs=FocusNode();
  int x=0;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit,AppState>(
        builder:(context, state) {

          ControllerName.text=AppCubit.get(context).listUser['name'];
          ControllerEmail.text=AppCubit.get(context).listUser['email'];
          ControllerPhone.text=AppCubit.get(context).listUser['phone'];
          return Scaffold(
            resizeToAvoidBottomInset: true,
            body: Container(
                padding: REdgeInsetsDirectional.only(start: 20.w,end: 20.w,top: 100.h),
                child:SingleChildScrollView(
                  child:  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            onTap: () {
                              setState(() {
                                readOnlyName=false;
                                readOnlyPhone=false;
                                readOnlyEmail=false;
                                x==0?x=1:x=0;
                              });
                            },
                            child: CircleAvatar(
                              backgroundColor: Colors.blue.withOpacity(0.3),
                              radius: 20,
                              child: const Center(
                                child: Icon(Icons.edit,color: Colors.black),
                              ),
                            ),
                          ),
                          IconButton(onPressed: () {
                           setState(() {
                             x=0;
                           });
                            Navigator.pop(context);
                          }, icon: Icon(Icons.arrow_forward_ios,color: ColorBlue,)),
                        ],
                      ),
                      //RSizedBox(width: 100.w,),
                      Center(
                        child: Stack(
                          children: [ClipRRect(
                            borderRadius: BorderRadius.only(topLeft:Radius.circular(50), topRight:Radius.circular(50), bottomLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
                            child: Container(
                              color: ColorBlue, // لون الخلفية المطلوب
                              child:
                                AppCubit.get(context).listUser != null
                                  ? Image.network(AppCubit.get(context).listUser['img'], height: 120.h, width: 120.w)
                                  :
                                Image.asset('assets/images/boy.png', height: 120.h, width: 120.w),
                            ),
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
                      ),
                      RSizedBox(height: 40.h,),
                      Padding(
                        padding:REdgeInsetsDirectional.only(start: 20.w,end: 20.w) ,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text("معلومات حسابك الشخصي :",style: TextStyle(fontSize: 20)),
                            RSizedBox(height: 20.h,),
                            const Text("الاسم : "),
                            CustomTextField(
                              hint_text: "اسمك",
                              suffix: false,
                              suffix_icon: null,
                              controller:ControllerName ,
                              keyboard: TextInputType.text,
                              PasswordFoucs: NameFoucs,
                              readOnly: readOnlyName,
                              obsc:false,
                              validate:  (value) {
                                if(value!.isEmpty)
                                {
                                  NameFoucs.requestFocus();
                                  return "Please make sure the password or user name you are entering is correct";
                                }

                              },
                            ),
                            RSizedBox(height: 20.h,),
                            const Text("رقم الهاتف"),
                            CustomTextField(
                              hint_text: "رقمك",
                              suffix: false,
                              suffix_icon: null,
                              controller:ControllerPhone ,
                              keyboard: TextInputType.number,
                              PasswordFoucs: PhoneFoucs,
                              readOnly: readOnlyPhone,
                              obsc:false,
                              validate:  (value) {
                                if(value!.isEmpty)
                                {
                                  NameFoucs.requestFocus();
                                  return "Please make sure the password or user name you are entering is correct";
                                }

                              },
                            ),
                            RSizedBox(height: 20.h,),
                            const Text("الايميل"),
                            CustomTextField(
                              hint_text: "ايميلك",
                              suffix: false,
                              suffix_icon: null,
                              controller:ControllerEmail ,
                              keyboard: TextInputType.emailAddress,
                              PasswordFoucs: EmailFoucs,
                              readOnly: readOnlyEmail,
                              obsc:false,
                              validate:  (value) {
                                if(value!.isEmpty)
                                {
                                  NameFoucs.requestFocus();
                                  return "Please make sure the password or user name you are entering is correct";
                                }

                              },
                            ),
                            RSizedBox(height: 20.h,),
                            x==1?const Text("كلمة السر"):Container(),
                            x==1?CustomTextField(
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
                                  // emailFoucs.requestFocus();
                                  return "رجاءً إملاءه , أنه فارغ";
                                }
                                // if(value.length<6)
                                // {
                                //   // emailFoucs.requestFocus();
                                //   return "لا يسمح بأقل من 6 محارف";
                                // }
                              },
                              obsc: AppCubit.get(context).visib,
                              focusNode:PasswordFoucs ,
                              prefixIcon: Icon(Icons.lock,color: Colors.grey),
                            ):Container(),
                            RSizedBox(height: 20.h,),
                            Center(
                              child: MaterialButton(
                                color: ColorBlue,
                                height: 70.h,
                                minWidth: double.infinity,
                                shape: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r)
                                ),
                                onPressed: () {
                                  setState(() {
                                    readOnlyName=true;
                                    readOnlyPhone=true;
                                    readOnlyEmail=true;
                                    print(ControllerName.text.toString());
                                     // AppCubit.get(context).PostDioEditeUser(
                                     //     name:ControllerName.text.toString() ,
                                     //     email: ControllerEmail.text.toString(),
                                     //     password: passwordController.text.toString(),
                                     //     phone: ControllerPhone.text.toString(),
                                     // );

                                      print("uuuu${AppCubit.get(context).listUser[0].name}");
                                      // استخدم userName هنا


                                  });
                                },
                                child: Text("تم",style: TextStyle(color: Colors.white)),
                              ),
                            ),
                            RSizedBox(height: 20.h,),
                          ],
                        ),
                      ),



                    ],
                  ),
                )
            ),
          );
        },
    );
  }
}

