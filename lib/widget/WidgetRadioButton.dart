import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../color/colorMain.dart';

class CustomRadioButton extends StatelessWidget {
  const CustomRadioButton({Key? key, this.selectedRadio, this.onChang, this.text1, this.text2}) : super(key: key);
  final selectedRadio;
  final onChang;
  final text1;
  final text2;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Radio(
          activeColor: ColorBlue,
          value: 0,
          groupValue: selectedRadio,
          onChanged:onChang
        ),
        Text(
          text1 ?? ' أجار       ',
          style: const TextStyle(fontSize: 17.0),
        ),
        RSizedBox(width: 100.w,),
        Radio(
          value: 1,
          groupValue: selectedRadio,
          activeColor: ColorBlue,
          onChanged: onChang
        ),
        Text(
          text2 ?? 'بيع',
          style: const TextStyle(
            fontSize: 17.0,
          ),
        ),
        RSizedBox(width: 30.w,),
      ],
    );
  }
}
