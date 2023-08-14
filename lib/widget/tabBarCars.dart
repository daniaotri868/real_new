import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color/colorMain.dart';
import '../cubit/app_cubit.dart';
import 'CustomDropButton.dart';
import 'WidgetRadioButton.dart';
import 'customTextField.dart';

class tabBarCars extends StatelessWidget {
   tabBarCars({Key? key}) : super(key: key);
  List<String> itemColor=["أحمر","أزرق","أخضر","أسود","بني","فضي","زهري","أصفر","برتقالي","موف"];
  String selectItemColor="أحمر";
  List<String> itemYear=["2001","2002","2003","2004","2005","2006","2007","2008",
    "2009","2010","2011","2012","2013","2014","2015","2016"];
  String selectItemYear="شمالي";
   List<String> itemModel=["لامبورغيني","فيراري"];
   String selectItemModel="لامبورغيني";
   List<String> itemNewOrOld=["جديدة","مستعملة"];
   String selectItemNewOrOld="مستعملة";

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
                AppCubit.get(context).getImagesCars(context: context);
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
            AppCubit.get(context).loadingImageCars==0? RSizedBox(
              height: 170.h,
              child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) =>
                      Image.file(AppCubit.get(context).selectedImagesCars[index],width: 150.w,height: 170.h,fit: BoxFit.cover),
                  separatorBuilder:(context, index) => RSizedBox(width: 5.w),
                  itemCount: AppCubit.get(context).selectedImagesCars.length
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
                Text("اسم السيارة : "),
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
                Text("سنة الصنع : "),
                CustomDropButton(selectItem: selectItemYear,itemeList:itemYear ,hint: "الطابق",),
                RSizedBox(height: 20.h,),
                Text("جديدة أم قديمة  "),
                CustomDropButton(selectItem:selectItemNewOrOld ,itemeList:itemNewOrOld ,hint: "الطابق",),
                RSizedBox(height: 20.h,),
                Text("اللون :  "),
                CustomDropButton(selectItem:selectItemColor ,itemeList:itemColor ,hint: "الطابق",),
                RSizedBox(height: 20.h,),
                Text("الموديل :  "),
                CustomDropButton(selectItem: selectItemModel,itemeList:itemModel ,hint: "الطابق",),
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
                // CustomRadioButton(
                //   Cubit: AppCubit.get(context),
                //   selected:AppCubit.get(context).selectedRadio
                // )
                CustomRadioButton(
                  selectedRadio: AppCubit.get(context).selectedRadioCars,
                  onChang:  (val) {
                    AppCubit.get(context).FunctionSelectedValCars(val);
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
