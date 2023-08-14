import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_new/widget/tabBarCars.dart';
import 'package:real_new/widget/tabBarHouses.dart';
import 'package:real_new/widget/tabBarLand.dart';
import 'color/colorMain.dart';
import 'cubit/app_cubit.dart';

class Posts extends StatefulWidget {
  const Posts({Key? key}) : super(key: key);

  @override
  State<Posts> createState() => _PostsState();
}
class _PostsState extends State<Posts> {
  List<String> itemFloor=["1","2","3","4","5","6","7"," 8","9","10"];
  String selectItemFloor="1";
  List<String> itemdirection=["شمالي","شرقي","غربي","جنوبي","شمالي شرقي","شمالي غربي","شمالي جنوبي"," غربي جنوبي",];
  String selectItemdirection="شمالي";
  TextEditingController ControlHousesName =TextEditingController();
  TextEditingController ControlHousesMony =TextEditingController();
  TextEditingController ControlHousesSpace =TextEditingController();
  TextEditingController ControlHousesDetails =TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
      return DefaultTabController(
          length: 3,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: ColorBlue,
              // toolbarHeight: 100.h,
              automaticallyImplyLeading: false,
              centerTitle: true,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("انشر بوست ",style: TextStyle(fontSize: 15.sp,color: Colors.white)),
                  Icon(Icons.accessibility_new,color: Colors.white,)
                ],
              ),
              bottom: const TabBar(
                  labelColor: Colors.white,
                  indicatorColor: Colors.white,
                  indicatorWeight: 3,
                  tabs: [
                    Tab(text: "بيوت",),
                    Tab(text: "أراضي",),
                    Tab(text: "سيارات",)
                  ]
              ),
            ),
              body:TabBarView(
                children: [
                  TabBarHouses(
                      // itemdirection: itemdirection,
                      // itemFloor: itemFloor,
                      // selectItemdirection: selectItemdirection,
                      // selectItemFloor: selectItemFloor,
                      // ControlHousesMony: ControlHousesMony,
                      // ControlHousesDetails:ControlHousesDetails ,
                      //  ControlHousesName:ControlHousesName ,
                      //  ControlHousesSpace:ControlHousesSpace ,
                  ),
                  const tabBarLands(),
                  tabBarCars()
                ],
              )
          )
      );
    },);
  }
}
