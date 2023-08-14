import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:restart_app/restart_app.dart';
import '../color/colorMain.dart';
import '../details.dart';
import '../profile.dart';
import '../token/cash_helper.dart';

class CustomDraw extends StatelessWidget {
  const CustomDraw({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(

      child: ListView(

        padding: EdgeInsets.zero,
        children: [
           DrawerHeader(
            decoration: BoxDecoration(
              color: ColorBlue,
              borderRadius: BorderRadius.circular(20.r)
            ),
            child: Column(
              children:  [
                RSizedBox(height: 20.h,),
                const Text('إعدادات حسابك ',style: TextStyle(color: Colors.white)),
                RSizedBox(height: 20.h,),
                 const CircleAvatar(
                  backgroundImage: AssetImage('assets/images/pe.png'),
                  backgroundColor: Colors.white54,
                  // backgroundImage: AssetImage('assets/images/user.png'),
                  radius: 35,
                )
              ],
            )
          ),
          ListTile(
            title:  Row(
              children:  [
                Icon(Icons.account_box),
                RSizedBox(width: 10.w,),
                const Text('حسابي'),
              ],
            ),
            onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(),));
              // ...
            },
          ),
          ListTile(
            title:  Row(
              children:  [
                const Icon(Icons.outbox_rounded),
                RSizedBox(width: 10.w,),
                const Text('تسجيل خروج'),
              ],
            ),
            onTap: () {
              showDialog(context: context, builder: (context) =>CupertinoAlertDialog(
                title: const Text("هل تريد حقاً تسجيل الخروج ؟!!"),
                // content: Text("Do you Delete all notebook ?!"),
                actions: [
                  CupertinoDialogAction(child: TextButton(child: Text("نعم",style: TextStyle(color: ColorBlue)),onPressed: () {
                    CachHelper.sharedPreferences.setString('token', '');
                    Restart.restartApp();
                  },)),
                  CupertinoDialogAction(child: TextButton(child: Text("لا",style: TextStyle(color: ColorBlue)),onPressed: () {

                    Navigator.pop(context);
                  },)),

                ],
              ),);

              // ...
            },
          ),
          ListTile(
            title:Row(
              children:  [
                const Icon(Icons.details),
                RSizedBox(width: 10.w,),
                const Text('معلومات عن التطبيق'),
              ],
            ),
            onTap: () {
             Navigator.push(context, MaterialPageRoute(builder: (context) => const Details(),));
            },
          ),

        ],
      ),
    );
  }
}
