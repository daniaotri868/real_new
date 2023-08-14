import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../color/colorMain.dart';


class CustomTextField extends StatelessWidget {
 final String hint_text;
 final  suffix;
 final suffix_icon;
 final keyboard;
 final controller;
 final PasswordFoucs;
 final obsc;
 final validate;
 final readOnly;
 final line;
 final focusNode;
 final prefixIcon;
 final ontap;
  const CustomTextField({Key? key,this.ontap, required this.hint_text, this.suffix, this.suffix_icon, this.keyboard, this.controller, this.PasswordFoucs, this.obsc, this.validate, this.readOnly, this.line, this.focusNode, this.prefixIcon}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      elevation: 4,
      shadowColor: Colors.transparent,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
        side: BorderSide(
          color: Colors.transparent
        )
      ),
      child: TextFormField(
        // initialValue: "dan",
        obscureText: obsc,
        keyboardType: keyboard,
        controller: controller,
        validator:validate,
        readOnly: readOnly,
        maxLines: line==3?3:1,
        focusNode: focusNode,
        decoration: InputDecoration(
            prefixIcon: prefixIcon,
            filled: true,
            fillColor: silverLight,
            hintText: hint_text,
            hintStyle: TextStyle(fontSize: 17.sp,color: Silver),
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: silverLight)
            ),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: ColorBlue)
            ),
            enabledBorder:OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: silverLight)
            ),
            suffixIcon: suffix?suffix_icon:null,


        ),
        onTap: ontap,
      ),
    );
  }
}
