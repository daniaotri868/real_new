import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_new/cubit/app_cubit.dart';
import 'package:flutter/src/widgets/image.dart' as flutterImage;
import 'package:intl/intl.dart';
import '../color/colorMain.dart';
import '../jsons/land.dart';
import '../secondryLand.dart';

class SearchLands extends StatelessWidget {
  List<Lands> searchLand;
   SearchLands({Key? key,required this.searchLand}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
  builder: (context, state) {
    DateFormat formatter = DateFormat('dd/MM/yyyy');

    return Scaffold(
      body:  Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.separated(
            itemBuilder: (context, index) =>Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              background: Container(
                color: Colors.red.withOpacity(0.9),
                child: Icon(Icons.delete,color: Colors.white),
              ),
              onDismissed: (direction) {
                print("----$index");
                int y=0;
                bool z=AppCubit.get(context).listNote3.any((element) {
                  y=element['id'];
                  return element['idx'] == index;
                });
                z?print("false"):print("true");
                print("--------$y");
                AppCubit.get(context).DeleteDataBase3(id:y );
              },

              child: Padding(
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
                          (searchLand[index].post?.postsable?.images)!.isEmpty?
                          flutterImage.Image.asset('assets/images/empty.png',width: 150.w,height:160.h,fit: BoxFit.cover,)
                              :
                          flutterImage.Image.network('${searchLand[index].post?.postsable?.images[0].img}'
                            ,width: 150.w,height:160.h,fit: BoxFit.cover,
                          ),

                          //child: Image.asset('assets/images/mainhouse.jpg',fit: BoxFit.fitHeight)),
                        ),
                        Positioned(
                            top: 7.h,
                            right: 3.w,
                            child: InkWell(
                              onTap: () {

                                print("----$index");
                                int y=0;
                                bool z=AppCubit.get(context).listNote3.any((element) {
                                  y=element['id'];
                                  return element['idx'] == index;
                                });
                                z?print("false"):print("true");
                                print("--------$y");
                                z?AppCubit.get(context).DeleteDataBase3(id:y ):AppCubit.get(context).insertDataBase3(idx: index);
                              },
                              child:  AppCubit.get(context).listNote3.any((element) {
                                return element['idx'] == index;
                              })?// AppCubit.get(context).listNote[index]['fav']==1?
                              CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 10,
                                child: RSizedBox(
                                  height: 15.h,
                                  width: 15.w,
                                  child:   flutterImage.Image.asset('assets/images/heart.png',),
                                ),
                              ):
                              CircleAvatar(
                                backgroundColor: Colors.black,
                                radius: 11,
                                child: RSizedBox(
                                  height: 15.h,
                                  width: 15.w,
                                  child: flutterImage.Image.asset('assets/images/heart (3).png', color: Colors.white),
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
                          Text("المنطقة ${searchLand[index].post?.postsable?.location} ",style: TextStyle(fontWeight: FontWeight.bold, overflow:TextOverflow.ellipsis ,fontSize: 17.sp)),
                          RSizedBox(height: 7.h,),
                          Text("السعر ${searchLand[index].price} مليون ل.س", style: TextStyle(fontSize: 17.sp)),
                          RSizedBox(height: 7.h,),
                          Text("تاريخ النشر ${formatter.format(searchLand[index].post!.postDate as DateTime)}",style: TextStyle(color: Colors.grey,fontSize: 15.sp)),
                          RSizedBox(height: 5,),
                          TextButton(
                              onPressed: () {
                                Navigator.push(context, MaterialPageRoute(builder: (context) => secondryLand(land:  searchLand[index])));
                              },
                              child: Text("للمزيد من التفاصيل...",style: TextStyle(color: MainDark,fontSize: 15.sp),


                              )
                          ),

                        ],
                      ),
                    )
                  ],
                ),
              ),
            ) ,
            separatorBuilder: (context, index) =>SizedBox(height: 10) ,
            itemCount: AppCubit.get(context).FavLands.length),
      ),
    );
  },
);
  }
}
