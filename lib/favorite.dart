import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_new/secondCar.dart';
import 'package:real_new/secondry.dart';
import 'package:real_new/secondryLand.dart';
import 'color/colorMain.dart';
import 'cubit/app_cubit.dart';
import 'package:flutter/src/widgets/image.dart' as flutterImage;
import 'package:intl/intl.dart';



class Favorite extends StatefulWidget {
  const Favorite({Key? key}) : super(key: key);

  @override
  State<Favorite> createState() => _PostsState();
}
class _PostsState extends State<Favorite> {

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        DateFormat formatter = DateFormat('dd/MM/yyyy');
        return DefaultTabController(
            length: 3,
            child: Scaffold(
                appBar: AppBar(
                  backgroundColor: ColorBlue.withOpacity(0.7),
                  // toolbarHeight: 100.h,
                  automaticallyImplyLeading: false,
                  leading: IconButton(
                    onPressed: () {
                      showDialog(context: context, builder: (context) =>CupertinoAlertDialog(
                        title: Text("هل تريد حقاً حذف جميع المفضلة ؟!!"),
                        // content: Text("Do you Delete all notebook ?!"),
                        actions: [
                          CupertinoDialogAction(child: TextButton(child: Text("نعم",style: TextStyle(color: ColorBlue)),onPressed: () {
                             AppCubit.get(context).DeleteAll();
                             AppCubit.get(context).DeleteAll2();
                             AppCubit.get(context).DeleteAll3();
                             Navigator.pop(context);

                          },)),
                          CupertinoDialogAction(child: TextButton(child: Text("لا",style: TextStyle(color: ColorBlue)),onPressed: () {

                            Navigator.pop(context);
                          },)),

                        ],
                      ),);
                    },
                    icon: Icon(Icons.delete,color: Colors.white),
                  ),
                  bottom: const TabBar(
                      labelColor: Colors.white,
                      indicatorColor: Colors.white,
                      tabs: [
                        Tab(text: "بيوت",icon: Icon(Icons.favorite_border)),
                        Tab(text: "أراضي",icon: Icon(Icons.favorite_border)),
                        Tab(text: "سيارات",icon: Icon(Icons.favorite_border))
                      ]
                  ),
                ),
                body:TabBarView(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ListView.separated(
                          itemBuilder: (context, index) =>Dismissible(
                            direction: DismissDirection.endToStart,
                            background: Container(
                              color: Colors.red.withOpacity(0.9),
                              child: Icon(Icons.delete,color: Colors.white),
                            ),
                            key: UniqueKey(),
                            onDismissed: (direction) {
                              print("----$index");
                              int y=0;
                              bool x=AppCubit.get(context).listNote.any((element) {
                                y=element['id'];
                                return element['idx'] == index;
                              });
                              x?print("false"):print("true");
                              print("--------$y");
                             AppCubit.get(context).DeleteDataBase(id:y );
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
                            ),
                          ) ,
                          separatorBuilder: (context, index) =>SizedBox(height: 10) ,
                          itemCount: AppCubit.get(context).FavHouses.length),
                    ),
                    Padding(
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
                                        (AppCubit.get(context).FavLands[index].post?.postsable?.images)!.isEmpty?
                                        flutterImage.Image.asset('assets/images/empty.png',width: 150.w,height:160.h,fit: BoxFit.cover,)
                                            :
                                        flutterImage.Image.network('${AppCubit.get(context).FavLands[index].post?.postsable?.images[0].img}'
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
                                        Text("المنطقة ${AppCubit.get(context).FavLands[index].post?.postsable?.location} ",style: TextStyle(fontWeight: FontWeight.bold, overflow:TextOverflow.ellipsis ,fontSize: 17.sp)),
                                        RSizedBox(height: 7.h,),
                                        Text("السعر ${AppCubit.get(context).FavLands[index].price} مليون ل.س", style: TextStyle(fontSize: 17.sp)),
                                        RSizedBox(height: 7.h,),
                                        Text("تاريخ النشر ${formatter.format(AppCubit.get(context).FavLands[index].post!.postDate as DateTime)}",style: TextStyle(color: Colors.grey,fontSize: 15.sp)),
                                        RSizedBox(height: 5,),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => secondryLand(land:  AppCubit.get(context).FavLands[index])));
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
                    Padding(
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
                              bool w=AppCubit.get(context).listNote2.any((element) {
                                y=element['id'];
                                return element['idx'] == index;
                              });
                              w?print("false"):print("true");
                              print("--------$y");
                              AppCubit.get(context).DeleteDataBase2(id:y );
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
                                        (AppCubit.get(context).FavCars[index].post?.postsable?.images)!.isEmpty?
                                        flutterImage.Image.asset('assets/images/empty.png',width: 150.w,height:160.h,fit: BoxFit.cover,)
                                            :
                                        flutterImage.Image.network('${AppCubit.get(context).FavCars[index].post?.postsable?.images[0].img}'
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
                                              bool w=AppCubit.get(context).listNote2.any((element) {
                                                y=element['id'];
                                                return element['idx'] == index;
                                              });
                                              w?print("false"):print("true");
                                              print("--------$y");
                                              w?AppCubit.get(context).DeleteDataBase2(id:y ):AppCubit.get(context).insertDataBase2(idx: index);
                                            },
                                            child:  AppCubit.get(context).listNote2.any((element) {
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
                                        Text("الاسم ${AppCubit.get(context).FavCars[index].post?.postsable?.name} ",style: TextStyle(fontWeight: FontWeight.bold, overflow:TextOverflow.ellipsis ,fontSize: 17.sp)),
                                        RSizedBox(height: 7.h,),
                                        Text("السعر ${AppCubit.get(context).FavCars[index].price} مليون ل.س", style: TextStyle(fontSize: 17.sp)),
                                        RSizedBox(height: 7.h,),
                                        Text("تاريخ النشر ${formatter.format(AppCubit.get(context).FavCars[index].post!.postDate as DateTime)}",style: TextStyle(color: Colors.grey,fontSize: 15.sp)),
                                        RSizedBox(height: 5,),
                                        TextButton(
                                            onPressed: () {
                                              Navigator.push(context, MaterialPageRoute(builder: (context) => secondCar(car: AppCubit.get(context).FavCars[index],index: index,)));
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
                          itemCount: AppCubit.get(context).FavCars.length),
                    ),
                  ],
                )
            )
        );
      },);
  }
}
