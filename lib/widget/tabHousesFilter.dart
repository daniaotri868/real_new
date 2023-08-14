import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/colorMain.dart';
import '../cubit/app_cubit.dart';
import 'CustomDropButton.dart';
import 'WidgetRadioButton.dart';
import 'customTextField.dart';

class tabHousesFilter extends StatefulWidget {
   tabHousesFilter({Key? key}) : super(key: key);

  @override
  State<tabHousesFilter> createState() => _tabHousesFilterState();
}

class _tabHousesFilterState extends State<tabHousesFilter> {
  List<String> itemFloor=["1","2","3","4","5","6","7"," 8","9","10"];

  List<String> itemMinRoom=["1","2","3","4","5","6","7"," 8","9","10"];

  List<String> itemdirection=["شمالي","شرقي","غربي","جنوبي","شمالي شرقي","شمالي غربي","شمالي جنوبي"," غربي جنوبي","غربي شرقي",""];

  TextEditingController NameController=TextEditingController();

  TextEditingController MinePriceController=TextEditingController();

  TextEditingController MaxPriceeController=TextEditingController();

  TextEditingController MineSpaceController=TextEditingController();

  TextEditingController MaxSpaceController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AppCubit, AppState>(
  builder: (context, state) {
    return SingleChildScrollView(
      child:  Container(
        padding: REdgeInsetsDirectional.only(top: 30.h,end: 20.h,start: 20.w,bottom: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("اسم المنطقة : ",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
                      RSizedBox(height: 5.h,),
                      CustomTextField(
                        readOnly: false,
                        hint_text: "",
                        // prefixIcon: Icon(Icons.accessibility_new),
                        suffix: false,
                        suffix_icon: null,
                        controller:NameController ,
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
                    ],

                  ),
                ),
                RSizedBox(width: 10.w,),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("الطابق : ",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
                        RSizedBox(height: 5.h,),
                        CustomDropButton(
                          selectItem: AppCubit.get(context).selectItemFloor,
                          itemeList:itemFloor ,
                          hint: "الطابق",
                          onChange: (value)
                          {
                            AppCubit.get(context).SelectedFilterHousesFloor(value);
                          },
                        ),
                      ],
                    )
                ),
              ],
            ),
            RSizedBox(height: 20.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("الحد الأدنى لعدد الغرف :",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
                      RSizedBox(height: 5.h,),
                      CustomDropButton(
                        selectItem: AppCubit.get(context).selectItemMinRoom,
                        itemeList:itemMinRoom ,
                        hint: "الطابق",
                        onChange: (value)
                        {
                          AppCubit.get(context).SelectedFilterHousesMinRoom(value);
                        },
                      ),
                    ],

                  ),
                ),
                RSizedBox(width: 10.w,),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("الحدالأعلى لعدد الغرف :",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
                        RSizedBox(height: 5.h,),
                        CustomDropButton(
                          selectItem:AppCubit.get(context).selectItemMaxRoom ,
                          itemeList:itemMinRoom ,
                          hint: "الطابق",
                          onChange: (value)
                          {
                            AppCubit.get(context).SelectedFilterHousesMaxRoom(value);
                          },
                        ),
                      ],
                    )
                ),
              ],
            ),
            RSizedBox(height: 20.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("الحد الأدنى للسعر  : ",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
                      RSizedBox(height: 5.h,),
                      CustomTextField(
                        readOnly: false,
                        hint_text: "",
                        // prefixIcon: Icon(Icons.accessibility_new),
                        suffix: false,
                        suffix_icon: null,
                        controller:MinePriceController ,
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
                    ],

                  ),
                ),
                RSizedBox(width: 10.w,),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("الحد الأعلى للسعر : ",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
                        RSizedBox(height: 5.h,),
                        CustomTextField(
                          readOnly: false,
                          hint_text: "",
                          // prefixIcon: Icon(Icons.accessibility_new),
                          suffix: false,
                          suffix_icon: null,
                          controller:MaxPriceeController ,
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
                      ],
                    )
                ),
              ],
            ),
            RSizedBox(height: 20.h,),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("الحد الأدنى للمساحة : ",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
                      RSizedBox(height: 5.h,),
                      CustomTextField(
                        readOnly: false,
                        hint_text: "",
                        // prefixIcon: Icon(Icons.accessibility_new),
                        suffix: false,
                        suffix_icon: null,
                        controller:MineSpaceController ,
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
                    ],

                  ),
                ),
                RSizedBox(width: 10.w,),
                Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("الحد الأعلى للمساحة : ",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
                        RSizedBox(height: 5.h,),
                        CustomTextField(
                          readOnly: false,
                          hint_text: "",
                          // prefixIcon: Icon(Icons.accessibility_new),
                          suffix: false,
                          suffix_icon: null,
                          controller:MaxSpaceController ,
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
                      ],
                    )
                ),
              ],
            ),
            RSizedBox(height: 20.h,),
            Text("الاتجاه :  ",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
            CustomDropButton(
              selectItem: AppCubit.get(context).selectItemdirection,
              itemeList:itemdirection ,
              hint: "الطابق",
              onChange:  (value) {
                AppCubit.get(context).SelectedFilterHousesDirection(value);
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
            Center(
              child: MaterialButton(
                color: ColorBlue,
                height: 70.h,
                minWidth: double.infinity,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.r)
                ),
                onPressed: () {
                  print(AppCubit.get(context).selectItemdirection);
                  print(NameController.text.toString());
                  AppCubit.get(context).FilterPostDio(
                      location:NameController.text.toString(),
                      direction: AppCubit.get(context).selectItemdirection.toString(),
                      min_price: MinePriceController.text.toString(),
                      max_price: MaxPriceeController.text.toString(),
                      min_space: MineSpaceController.text.toString(),
                      max_space: MaxSpaceController.text.toString(),
                      operation_id: AppCubit.get(context).selectedRadioHouses.toString(),
                      floor:AppCubit.get(context).selectItemFloor.toString(),
                      max_room_number: AppCubit.get(context).selectItemMaxRoom.toString(),
                      min_room_number: AppCubit.get(context).selectItemMaxRoom.toString(),
                      context: context
                  );
                },
                child: Text("بحث",style: TextStyle(color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  },
);
  }
}
