
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color/colorMain.dart';

class CustomDropButton extends StatelessWidget {
   final selectItem;
  final List itemeList;
  final String hint;
  final onChange;
  final validate;
  const CustomDropButton({Key? key, required this.selectItem, required this.itemeList, required this.hint, this.onChange, this.validate}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RSizedBox(
      height:73.0,
      // width: 180.0 ,
      child: Container(
        decoration: BoxDecoration(
            color: silverLight,
            borderRadius: BorderRadius.circular(8)
        ),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: DropdownButtonFormField(
            validator: validate,
            isExpanded: true,
            // isDense: true,
            alignment: Alignment.centerRight,
            // isDense: true,
            // hint:  Text(hint,style: const TextStyle(color: Colors.black)),
            icon: Icon(Icons.keyboard_arrow_down_rounded,color: ColorBlue),
            iconSize:22,
            decoration:  InputDecoration(
              // prefixIcon: prefixIcon,
              filled: true,
              fillColor: silverLight,
              // hintText: hint_text,
              hintStyle: TextStyle(fontSize: 17.sp,color: Silver),
              border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: silverLight)
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: silverLight)
              ),
              enabledBorder:OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide(color: silverLight)
              ),



            ),
            //value: selectItem,
            style:  TextStyle(color: Colors.black,fontSize:20.sp),
            items:itemeList.map<DropdownMenuItem<Object>>((item) => DropdownMenuItem(
                value: item,
                child: Container(alignment: Alignment.centerRight,child:Text(item,style: TextStyle(fontSize: 17.sp),))
            )
            ).toList() ,
            onChanged:onChange,
        ),
      ),)
    );
  }
}
