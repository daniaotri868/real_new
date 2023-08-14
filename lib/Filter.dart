import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_new/widget/CustomDropButton.dart';
import 'package:real_new/widget/WidgetRadioButton.dart';
import 'package:real_new/widget/customTextField.dart';
import 'package:real_new/widget/tabBarCars.dart';
import 'package:real_new/widget/tabCarsFilter.dart';
import 'package:real_new/widget/tabHousesFilter.dart';
import 'package:real_new/widget/tabLandsFilter.dart';

import 'color/colorMain.dart';
import 'cubit/app_cubit.dart';


class FilterHomePage extends StatefulWidget {
   FilterHomePage({Key? key}) : super(key: key);

  @override
  State<FilterHomePage> createState() => _FilterHomePageState();
}

class _FilterHomePageState extends State<FilterHomePage> {
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
            title:  Row(
              children: [
                const Text("ابحث هنا",style: TextStyle(fontSize: 15,color: Colors.white,fontWeight: FontWeight.w700)),
                RSizedBox(width: 10.w,),
                const Icon(Icons.search,color: Colors.white,)
              ],
            ),
            bottom: const TabBar(
                labelColor: Colors.white,
                indicatorColor: Colors.white,
                indicatorWeight: 3,
                tabs: [
                  Tab(text: "بيوت",),
                  Tab(text: "سيارات",),
                  Tab(text: "أراضي",)
                ]
            ),
          ),

        body:TabBarView(
          children: [
            tabHousesFilter(),
            tabCarsFilter(),
            tabLandsFilter(),
          ],
        )
      ),
    );
  },
);
  }
}
