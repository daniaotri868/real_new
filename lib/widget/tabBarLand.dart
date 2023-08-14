import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/colorMain.dart';
import '../cubit/app_cubit.dart';
import 'WidgetRadioButton.dart';
import 'customTextField.dart';

class tabBarLands extends StatelessWidget {
  const tabBarLands({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child:  Container(
        padding: REdgeInsetsDirectional.only(start: 20.w,end: 20.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            RSizedBox(height: 50.h,),
            MaterialButton(
              onPressed: () {
                AppCubit.get(context).getImagesLands(context: context);
              },
              child: Container(
                height: 50.h,
                width: 200.w,
                decoration: BoxDecoration(
                    color: ColorBlue,
                    borderRadius: BorderRadius.circular(10.r)
                ),
                child: Center(
                    child:Row(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        RSizedBox(width: 20.w,),
                        Icon(Icons.add,color: Colors.white),
                        RSizedBox(width: 20.w,),
                        Text("أضف صورة ",style: TextStyle(color: Colors.white),)
                      ],
                    )
                ),
              ),
            ),
            RSizedBox(height: 20,),
            AppCubit.get(context).loadingImageLands==0? RSizedBox(
              height: 170.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      Image.file(AppCubit.get(context).selectedImagesLands[index],width: 150.w,height: 170.h,fit: BoxFit.cover),
                  separatorBuilder:(context, index) => RSizedBox(width: 5.w),
                  itemCount: AppCubit.get(context).selectedImagesLands.length
              ),
            ):
            Container(
              height: 100.h,
              width: 100.w,
              child: Center(
                child:   CircularProgressIndicator(color: ColorBlue)   ,
              ),
            )
            ,
            RSizedBox(height: 50.h,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text("اسم المنطقة : "),
                CustomTextField(
                  readOnly: false,
                  hint_text: "",
                  // prefixIcon: Icon(Icons.accessibility_new),
                  suffix: false,
                  suffix_icon: null,
                  // controller:ControllerName ,
                  keyboard: TextInputType.text,
                  // PasswordFoucs: NameFoucs,
                  obsc:false,
                  validate:  (value) {
                    if(value!.isEmpty)
                    {
                      // NameFoucs.requestFocus();
                      return "رجاءً إملاءه , إنه فارغ ";
                    }

                  },
                ),
                RSizedBox(height: 20.h,),
                Text("السعر : "),
                CustomTextField(
                  readOnly: false,
                  hint_text: "",
                  // prefixIcon: Icon(Icons.accessibility_new),
                  suffix: false,
                  suffix_icon: null,
                  // controller:ControllerName ,
                  keyboard: TextInputType.text,
                  // PasswordFoucs: NameFoucs,
                  obsc:false,
                  validate:  (value) {
                    if(value!.isEmpty)
                    {
                      // NameFoucs.requestFocus();
                      return "رجاءً إملاءه , إنه فارغ ";
                    }

                  },
                ),
                RSizedBox(height: 20.h,),
                Text("المساحة :  "),
                CustomTextField(
                  readOnly: false,
                  hint_text: "",
                  // prefixIcon: Icon(Icons.accessibility_new),
                  suffix: false,
                  suffix_icon: null,
                  // controller:ControllerName ,
                  keyboard: TextInputType.text,
                  // PasswordFoucs: NameFoucs,
                  obsc:false,
                  validate:  (value) {
                    if(value!.isEmpty)
                    {
                      // NameFoucs.requestFocus();
                      return "رجاءً إملاءه , إنه فارغ ";
                    }

                  },
                ),
                RSizedBox(height: 20.h,),
                const Text("تفاصيل أكثر"),
                CustomTextField(
                  hint_text: "",
                  suffix: false,
                  suffix_icon: null,
                  // controller:ControllerEmail ,
                  keyboard: TextInputType.number,
                  // PasswordFoucs: EmailFoucs,
                  readOnly: false,
                  obsc:false,
                  line: 3,
                  validate:  (value) {
                    if(value!.isEmpty)
                    {
                      // NameFoucs.requestFocus();
                      return "Please make sure the password or user name you are entering is correct";
                    }

                  },
                ),
                RSizedBox(height: 20.h,),
                CustomRadioButton(
                  selectedRadio: AppCubit.get(context).selectedRadioLands,
                  onChang:  (val) {
                    AppCubit.get(context).FunctionSelectedValLands(val);
                  },
                ),
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

                    },
                    child: Text("نشر",style: TextStyle(color: Colors.white)),
                  ),
                ),
                RSizedBox(height: 20.h,),
              ],
            )

          ],
        ),
      ),
    );
  }
}
