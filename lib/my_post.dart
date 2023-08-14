import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/src/widgets/image.dart' as flutterImage;
import 'package:real_new/secondry.dart';
import 'package:intl/intl.dart';

import 'color/colorMain.dart';
import 'cubit/app_cubit.dart';

class myPost extends StatelessWidget {
  const myPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
  builder: (context, state) {
    DateFormat formatter = DateFormat('dd/MM/yyyy');
    return Scaffold(
     body:  Padding(
       padding: const EdgeInsets.all(8.0),
       child: ListView.separated(
           itemBuilder: (context, index) =>Padding(
             padding: REdgeInsetsDirectional.only(start: 6,top: 20),
             child: Row(
               // mainAxisAlignment: MainAxisAlignment.spaceBetween,
               crossAxisAlignment: CrossAxisAlignment.center,
               children: [
                 Stack(
                   children: [
                     ClipRRect(
                       borderRadius: BorderRadius.circular(15),
                       child:
                       (AppCubit.get(context).FavHouses[index].post?.postsable?.images)!.isEmpty?
                       flutterImage.Image.asset('assets/images/empty.png',width: 150.w,height:160.h,fit: BoxFit.cover,)
                           :
                       flutterImage.Image.network('${AppCubit.get(context).FavHouses[index].post?.postsable?.images[0].img}'
                         ,width: 150.w,height:160.h,fit: BoxFit.cover,
                       ),

                       //child: Image.asset('assets/images/mainhouse.jpg',fit: BoxFit.fitHeight)),
                     ),
                     Positioned(
                         top: 3.h,
                         right: 3.w,
                         child: InkWell(
                           onTap: () {
                             print("----$index");
                             int y=0;
                             bool x=AppCubit.get(context).listNote.any((element) {
                               y=element['id'];
                               return element['idx'] == index;
                             });
                             x?print("false"):print("true");
                             print("--------$y");
                             x?AppCubit.get(context).DeleteDataBase(id:y ):AppCubit.get(context).insertDataBase(idx: index);
                           },
                           child: CircleAvatar(
                             backgroundColor: Colors.white,
                             radius: 10,
                             child: RSizedBox(
                               height: 17.h,
                               width: 17.w,
                               child:   flutterImage.Image.asset('assets/images/heart.png',),
                             ),
                           ),
                         )
                     )

                   ],
                 ),

                 // ClipRRect(
                 //   borderRadius: BorderRadius.only(topLeft:Radius.circular(20) ,topRight:Radius.circular(20),bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20) ),
                 //   child: Image.asset('assets/images/mainhouse.jpg',
                 //     width: MediaQuery.of(context).size.width/2,height: 200,fit: BoxFit.cover,),
                 // ),
                 Padding(
                   padding: REdgeInsetsDirectional.only(start: 20),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.center,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children:  [
                       RSizedBox(height: 5.h,),
                       Text("العنوان ${AppCubit.get(context).FavHouses[index].post?.postsable?.location} ",style: TextStyle(fontWeight: FontWeight.bold, overflow:TextOverflow.ellipsis ,fontSize: 17.sp)),
                       RSizedBox(height: 7.h,),
                       Text("السعر ${AppCubit.get(context).FavHouses[index].price} مليون ل.س", style: TextStyle(fontSize: 17.sp)),
                       RSizedBox(height: 7.h,),
                       Text("تاريخ النشر ${formatter.format(AppCubit.get(context).FavHouses[index].post!.postDate as DateTime)}",style: TextStyle(color: Colors.grey,fontSize: 15.sp)),
                       RSizedBox(height: 5,),
                       TextButton(
                           onPressed: () {
                             Navigator.push(context, MaterialPageRoute(builder: (context) => second(listH: AppCubit.get(context).FavHouses[index],index: index,)));
                           },
                           child: Text("للمزيد من التفاصيل...",style: TextStyle(color: MainDark,fontSize: 15.sp),


                           )
                       ),

                     ],
                   ),
                 )
               ],
             ),
           ) ,
           separatorBuilder: (context, index) =>SizedBox(height: 10) ,
           itemCount: AppCubit.get(context).FavHouses.length),
     ),
    );
  },
);
  }
}
