// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:real_estate/post.dart';
//
// import 'color/colorMain.dart';
//
// class MainPage extends StatefulWidget {
//   const MainPage({Key? key}) : super(key: key);
//
//   @override
//   State<MainPage> createState() => _MainPageState();
// }
//
// class _MainPageState extends State<MainPage> {
//   @override
//   bool x=false;
//   int current=0;
//   final List screen=[];
//   final List name_navegation_item=["الأساسي","المفضلة","بحث","الحساب"];
//   final List Icon_navegation_item=[Icons.home,Icons.favorite_border,Icons.search,Icons.account_circle];
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: ,
//         body: ,
//         bottomNavigationBar: BottomAppBar(
//           shape: CircularNotchedRectangle(),
//           color: Colors.white,
//           // notchMargin: 4,
//           child: Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(topLeft: Radius.circular(20.r),topRight: Radius.circular(20.r)),
//               // color: Colors.white
//             ),
//             height: 60,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     MaterialButton(onPressed: () {
//                       setState(() {
//                         current=0;
//
//                       });
//                     },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icon_navegation_item[0],size: 20,color: current==0?x==false? FlatDark:FlatLight:Colors.black54,),
//                           Text(name_navegation_item[0],style: TextStyle(color: current==0?x==false? FlatDark:FlatLight:Colors.black54,fontSize: 12),)
//                         ],
//                       ),
//                     ),
//                     MaterialButton(onPressed: () {
//                       setState(() {
//
//                         current=1;
//                       });
//                     },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Image.asset('assets/images/heart (3).png', color: current==1?x==false? FlatDark:FlatLight:Colors.black54,height: 25.h,width: 25.w),
//                           // Icon(Icon_navegation_item[1],size: 20,color: current==1?x==false? FlatDark:FlatLight:Colors.black54,),
//                           Text(name_navegation_item[1],style: TextStyle(color: current==1?x==false? FlatDark:FlatLight:Colors.black54,fontSize: 12),)
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//                 Row(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//                     MaterialButton(onPressed: () {
//                       setState(() {
//
//
//                         current=2;
//                       });
//                     },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icon_navegation_item[2],size: 20,color: current==2?x==false? FlatDark:FlatLight:Colors.black54,),
//                           Text(name_navegation_item[2],style: TextStyle(color: current==2?x==false? FlatDark:FlatLight:Colors.black54,fontSize: 12),)
//                         ],
//                       ),
//                     ),
//                     MaterialButton(onPressed: () {
//                       setState(() {
//                         current=3;
//                       });
//                     },
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Icon(Icon_navegation_item[3],size: 20,color: current==3?x==false? FlatDark:FlatLight:Colors.black54,),
//                           Text(name_navegation_item[3],style: TextStyle(color: current==3?x==false? FlatDark:FlatLight:Colors.black54,fontSize: 12),)
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//
//               ],
//
//             ),
//           ),
//         ),
//         floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
//         floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
//
//         floatingActionButton: FloatingActionButton(
//           child: CircleAvatar(
//             backgroundColor: ColorBlue,
//             radius: 35.r,
//             child: Center(
//               child: Icon(Icons.add,color: Colors.white),
//             ),
//           ),
//           onPressed: () {
//             Navigator.push(context, MaterialPageRoute(builder: (context) => Posts(),));
//           },
//         )
//     );
//   }
// }
