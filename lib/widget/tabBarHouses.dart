import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_datetime_picker/flutter_datetime_picker.dart' as pick;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color/colorMain.dart';
import '../cubit/app_cubit.dart';
import 'CustomDropButton.dart';
import 'WidgetRadioButton.dart';
import 'customTextField.dart';
import 'package:intl/intl.dart';

class TabBarHouses extends StatefulWidget {
   TabBarHouses({Key? key}) : super(key: key);

  @override
  State<TabBarHouses> createState() => _TabBarHousesState();
}

class _TabBarHousesState extends State<TabBarHouses> {
   @override
   List<String> itemFloor=["1","2","3","4","5","6","7"," 8","9","10"];

   String selectItemFloor="1";

   String selectItemRoom="1";

   List<String> itemdirection=["شمالي","شرقي","غربي","جنوبي","شمالي شرقي","شمالي غربي","شمالي جنوبي"," غربي جنوبي",];

   String selectItemdirection="شمالي";

   TextEditingController ControlHousesName =TextEditingController();

   TextEditingController ControlHousesMony =TextEditingController();

   TextEditingController ControlHousesSpace =TextEditingController();

   TextEditingController ControlHousesDetails =TextEditingController();

   // TextEditingController _dateController = TextEditingController();

   DateFormat formatter = DateFormat('dd/MM/yyyy');

   final fromKey=GlobalKey<FormState>();


   DateTime selectedDate = DateTime.now();


   Future<void> _selectDate(BuildContext context) async {
     final DateTime? picked = await showDatePicker(
       context: context,
       initialDate: selectedDate,
       firstDate: DateTime.now(),
       lastDate: DateTime(2101),
     );
     if (picked != null && picked != selectedDate) {
       setState(() {
         selectedDate = picked;
       });
     }
   }


   Widget build(BuildContext context) {
     TextEditingController ControlerDate=TextEditingController(text: "${ formatter.format(selectedDate)}");
     return BlocBuilder<AppCubit,AppState>(
      builder: (context, state) {
      return Form(
        key: fromKey,
        child: SingleChildScrollView(
          child:  Container(
            padding: REdgeInsetsDirectional.only(start: 20.w,end: 20.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                RSizedBox(height:50.h,),
                MaterialButton(
                  onPressed: () {
                    AppCubit.get(context).getImagesHouses(context: context);
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
                AppCubit.get(context).loadingImageHouses==0? RSizedBox(
                  height: 170.h,
                  child: ListView.separated(
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (context, index) =>
                          Image.file(AppCubit.get(context).selectedImagesHouses[index],width: 150.w,height: 170.h,fit: BoxFit.cover),
                      separatorBuilder:(context, index) => RSizedBox(width: 5.w),
                      itemCount: AppCubit.get(context).selectedImagesHouses.length
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
                      controller:ControlHousesName ,
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
                      controller:ControlHousesMony ,
                      keyboard: TextInputType.number,
                      // PasswordFoucs: NameFoucs,
                      obsc:false,
                      validate:  (value) {
                        if(value!.isEmpty)
                        {
                          // NameFoucs.requestFocus();
                          return "رجاءً إملاءه , إنه فارغ ";
                        }
                        if (value.contains('-')&&value.contains(',')) {
                          return '   لا يجب أن يحوي (-) و (,) ';
                        }
                        if (value.contains('-')) {
                          return 'لا يجب أن يحوي (-)';
                        }
                        if (value.contains(',')) {
                          return 'لا يجب أن يحوي (,)';
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
                      controller:ControlHousesSpace ,
                      keyboard: TextInputType.number,
                      // PasswordFoucs: NameFoucs,
                      obsc:false,
                      validate:  (value) {
                        if(value!.isEmpty)
                        {
                          // NameFoucs.requestFocus();
                          return "رجاءً إملاءه , إنه فارغ ";
                        }
                        if (value.contains('-')&&value.contains(',')) {
                          return '   لا يجب أن يحوي (-) و (,) ';
                        }
                        if (value.contains('-')) {
                          return 'لا يجب أن يحوي (-)';
                        }
                        if (value.contains(',')) {
                          return 'لا يجب أن يحوي (,)';
                        }
                        if (value.contains(' ')) {
                          return 'لا يجب أن يحوي  فراغ ';
                        }


                      },
                    ),
                    RSizedBox(height: 20.h,),
                    Text("التاريخ :  "),
                    CustomTextField(
                      readOnly: false,
                      hint_text: "",
                      // prefixIcon: Icon(Icons.accessibility_new),
                      suffix: false,
                      suffix_icon: null,
                      controller:ControlerDate,
                      // PasswordFoucs: NameFoucs,
                      obsc:false,
                      validate:  (value) {
                        if(value!.isEmpty)
                        {
                          // NameFoucs.requestFocus();
                          return "رجاءً إملاءه , إنه فارغ ";
                        }

                      },
                      ontap:(){
                        print("klkkj");
                        return _selectDate(context);
                      }
                    ),
                    RSizedBox(height: 20.h,),
                    Text("الطابق :  "),
                    CustomDropButton(
                        selectItem: selectItemFloor,itemeList:itemFloor ,hint: "الطابق",onChange:(value)
                        {
                          setState(() {
                            selectItemFloor=value;
                          });
                        },
                      validate:(value) {
                        if(value!.isEmpty)
                        {
                          // NameFoucs.requestFocus();
                          return "رجاءً إملاءه , إنه فارغ ";
                        }


                      } ,
                    ),
                    RSizedBox(height: 20.h,),
                    Text("عدد الغرف :  "),
                    CustomDropButton(selectItem: selectItemRoom,itemeList:itemFloor ,hint: "الطابق",onChange: (value)
                    {
                      setState(() {
                        selectItemRoom=value;
                      });

                    },
                      validate:   (value) {
                        if (value!.isEmpty) {
                          // NameFoucs.requestFocus();
                          return "رجاءً إملاءه , إنه فارغ ";
                        }

                      }

                    ),
                    RSizedBox(height: 20.h,),
                    Text("الاتجاه :  "),
                    CustomDropButton(selectItem: selectItemdirection,itemeList:itemdirection ,hint: "الطابق",onChange: (value)
                    {
                      setState(() {
                        selectItemdirection=value;
                      });
                    },
                      validate: (value) {
                        if (value!.isEmpty) {
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
                      controller:ControlHousesDetails ,
                      keyboard: TextInputType.text,
                      // PasswordFoucs: EmailFoucs,
                      readOnly: false,
                      obsc:false,
                      line: 3,
                      validate:  (value) {
                        if(value!.isEmpty)
                        {
                          // NameFoucs.requestFocus();
                          return "رجاءً إملاءه , إنه فارغ ";
                        }

                      },
                    ),
                    RSizedBox(height: 20.h,),
                    CustomRadioButton(
                      selectedRadio: AppCubit.get(context).selectedRadioHouses,
                      onChang:  (val) {
                        print("val = $val");
                        AppCubit.get(context).FunctionSelectedValHouses(val);
                      },
                    ),
                    RSizedBox(height: 20.h,),
                    state is AppLoadingPostHouses?
                   Center(
                     child: SizedBox(height: 100.h,child: Center(child: CircularProgressIndicator(color: ColorBlue,))),
                   )
                   : Center(
                      child: MaterialButton(
                        color: ColorBlue,
                        height: 70.h,
                        minWidth: double.infinity,
                        shape: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.r)
                        ),
                        onPressed: () {
                          if(fromKey.currentState!.validate())
                          {
                            print("${ControlHousesName.text}");
                            print(ControlHousesDetails.text.toString());
                            print(ControlHousesSpace.text);
                            print(selectItemFloor);
                            AppCubit.get(context).HousePostDio(
                              context: context,
                              floor: selectItemFloor.toString(),
                              space:ControlHousesSpace.text.toString() ,
                              price: ControlHousesMony.text.toString(),
                              direction: selectItemdirection.toString(),
                              room_number:selectItemRoom.toString(),
                              operation_id:AppCubit.get(context).selectedRadioHouses.toString(),
                              location: ControlHousesName.text.toString(),
                              duration:ControlerDate.text.toString() ,
                              images: AppCubit.get(context).selectedImagesHouses,
                            );

                          }
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
        ),
      );
    },);
  }
}



