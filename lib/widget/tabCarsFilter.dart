import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/colorMain.dart';
import '../cubit/app_cubit.dart';
import 'CustomDropButton.dart';
import 'WidgetRadioButton.dart';
import 'customTextField.dart';
import 'package:intl/intl.dart';

class tabCarsFilter extends StatefulWidget {
  tabCarsFilter({Key? key}) : super(key: key);

  @override
  State<tabCarsFilter> createState() => _tabCarsFilterState();
}

class _tabCarsFilterState extends State<tabCarsFilter> {
  List<String> itemColor=["أحمر","أخضر","أصفر","أبيض","أسود","برتقالي","فضي","أزرق",];



  TextEditingController NameController=TextEditingController();

  TextEditingController MinePriceController=TextEditingController();

  TextEditingController MaxPriceeController=TextEditingController();


  DateFormat formatter = DateFormat('dd/MM/yyyy');
  DateTime selectedDate = DateTime.now();
  DateTime selectedDate2 = DateTime.now();


  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: selectedDate,
      firstDate:DateTime(1980),
      lastDate:  DateTime.now(),
    );
    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController ControlerDate=TextEditingController(text: "${ formatter.format(selectedDate)}");
    TextEditingController ControlerDate2=TextEditingController(text: "${ formatter.format(selectedDate)}");
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
                          Text("الاسم : ",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
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
                            Text("اللون: ",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
                            RSizedBox(height: 5.h,),
                            CustomDropButton(
                              selectItem: AppCubit.get(context).selectItemdirection,
                              itemeList:itemColor ,
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
                RSizedBox(height: 25.h,),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("الحد الأدنى للسنة :",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
                          RSizedBox(height: 5.h,),
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
                        ],

                      ),
                    ),
                    RSizedBox(width: 10.w,),
                    Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("الحدالأعلى للسنة :",style: TextStyle(color: ColorBlue,fontSize: 18.sp)),
                            RSizedBox(height: 5.h,),
                            CustomTextField(
                                readOnly: false,
                                hint_text: "",
                                // prefixIcon: Icon(Icons.accessibility_new),
                                suffix: false,
                                suffix_icon: null,
                                controller:ControlerDate2,
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
                          ],
                        )
                    ),
                  ],
                ),
                RSizedBox(height: 25.h,),
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
                RSizedBox(height: 25.h,),
                CustomRadioButton(
                  text1: "جديدة",
                  text2: "قديمة",
                  selectedRadio: AppCubit.get(context).selectedRadioFilterCars,
                  onChang:  (val) {
                    print("val = $val");
                    AppCubit.get(context).FunctionSelectedValFilterCars(val);
                  },
                ),
                RSizedBox(height: 25.h,),
                CustomRadioButton(
                 selectedRadio: AppCubit.get(context).selectedRadioFilterCars2,
                  onChang:  (val) {
                    print("val = $val");
                    AppCubit.get(context).FunctionSelectedValFilterCars2(val);
                  },
                ),
                RSizedBox(height: 25.h,),
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
                      AppCubit.get(context).FilterPostDioCars(
                          min_year: ControlerDate as int,
                          max_year:ControlerDate2 as int ,
                          min_price: MinePriceController.text as int,
                          max_price: MaxPriceeController.text as int,
                          operation_id: AppCubit.get(context).selectedRadioHouses as int,
                          is_new: AppCubit.get(context).selectedRadioFilterCars as int,
                          color: AppCubit.get(context).selectItemdirection,
                          name:NameController.text.toString() ,
                          context: context,
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
