import 'package:carousel_slider/carousel_controller.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/src/widgets/image.dart' as flutterImage;
import 'package:intl/intl.dart';
import 'package:real_new/widgetConst.dart';
import 'color/colorMain.dart';
import 'cubit/app_cubit.dart';
import 'jsons/housesJson.dart';


class second extends StatefulWidget {

   Houses listH;
   int index;
   second({required this.listH,required this.index});

  @override
  State<second> createState() => _secondState();
}

class _secondState extends State<second> {
  final CarouselController carouselController=CarouselController();

   DateFormat formatter = DateFormat('dd/MM/yyyy');
   int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body:  ConditionalBuilder(
            condition: AppCubit.get(context).listHouses.isNotEmpty ,
            builder: (context) => SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      CarouselSlider(
                        items: widget.listH.post?.postsable?.images.map((e) {
                          return Container(
                            margin: REdgeInsetsDirectional.all(2),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5)
                            ),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: (widget.listH.post?.postsable?.images)!.isEmpty?
                                flutterImage.Image.asset('assets/images/empty.png' , height: 300.h,width: double.infinity,fit: BoxFit.cover,)
                                    :
                                flutterImage.Image.network('${e.img}'
                                  , height: 300.h,width: double.infinity,fit: BoxFit.cover,
                                ),

                                //child: Image.asset('assets/images/mainhouse.jpg',fit: BoxFit.fitHeight)),
                          ),
                          );
                        }).toList(),
                        carouselController: carouselController,
                        options: CarouselOptions(
                          scrollPhysics: BouncingScrollPhysics(),
                          height: 430.h,
                          viewportFraction: 1,
                          onPageChanged: (index, reason) {
                            // AppCubit.get(context).changCurrentIndex(index);
                            print(index);
                            setState(() {
                              currentIndex=index;
                            });

                          },
                        ),
                      ),
                      Positioned(
                        left: 1,
                        top: 25,
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            }, icon: Icon(Icons.arrow_forward_outlined,color: Colors.black54,)),
                      ),
                      Positioned(
                          top: 35.h,
                          right: 20.w,
                          child:InkWell(
                            onTap: () {
                              // AppCubit.get(context).DeleteAll();
                              print("----${widget.index}");
                              int y=0;
                              bool x=AppCubit.get(context).listNote.any((element) {
                                y=element['id'];
                                return element['idx'] == widget.index;
                              });
                              x?print("false"):print("true");
                              print("--------$y");
                              x?AppCubit.get(context).DeleteDataBase(id:y ):AppCubit.get(context).insertDataBase(idx: widget.index);
                            },
                            child:Container(
                              child:
                              AppCubit.get(context).listNote.any((element) {
                                return element['idx'] == widget.index;
                              })?// AppCubit.get(context).listNote[index]['fav']==1?
                              RSizedBox(
                                height: 30.h,
                                width: 30.w,
                                child:   flutterImage.Image.asset('assets/images/heart.png',),
                              ):
                              RSizedBox(
                                height: 35.h,
                                width: 35.w,
                                child: flutterImage.Image.asset('assets/images/heart (3).png', color: Colors.white),
                              ),
                            ) ,
                          )
                      ),
                      // Positioned(
                      //     top: 30,
                      //     right: 1,
                      //     child: IconButton(onPressed: () {
                      //       AppCubit.get(context).ChangeIconFavorite();
                      //     },icon:AppCubit.get(context).iconFavorite==false?Icon(AppCubit.get(context).iconFavorite==false?Icons.favorite:Icons.favorite_sharp,color: Colors.white):Icon(AppCubit.get(context).iconFavorite==false?Icons.favorite_border:Icons.favorite_sharp,color: Colors.red[300]),
                      //     )),

                    ],
                  ),
                  SizedBox(height: 10.h,),
                  Container(
                    padding: REdgeInsetsDirectional.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: List.generate(widget.listH.post!.postsable!.images.length, (index) =>  Padding(
                              padding: REdgeInsetsDirectional.all(1),
                              child: CircleAvatar(radius: 3,backgroundColor:currentIndex==index? ColorBlue:Colors.black38,),
                            ),)
                        ),
                        RSizedBox(height: 10,),
                        Text("السعر ${widget.listH.price} مليون سوري",style: TextStyle(color: benlight,fontSize: 22.sp),),
                        RSizedBox(height: 2,),
                        Row(
                          children: [
                            const Icon(Icons.location_on_sharp,color: Colors.grey,size: 13),
                            RSizedBox(width: 2,),
                            Text("العنوان ${widget.listH.post?.postsable?.location}  ",style: TextStyle(color: Colors.grey,fontSize: 15.sp),),
                            RSizedBox(width: 220,),
                            Container(
                              width: 50.w,
                              height: 50.h,
                              decoration: BoxDecoration(
                                color: Colors.blueGrey.shade100,
                                borderRadius: BorderRadius.circular(10)
                              ),
                              child: Center(
                                child: Text("حجز",style: TextStyle(color: Colors.black)),
                              ),
                            )
                          ],
                        ),
                        Text("    تاريخ النشر : ${formatter.format(widget.listH.post!.postDate as DateTime)}            ",style: TextStyle(color: Colors.grey,fontSize: 15.sp),),
                        RSizedBox(height: 7,),
                        Row(
                          children: [
                            Expanded(
                                flex: 1,
                                child:Container(
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.green[50],
                                  ),
                                  child: Padding(
                                    padding: REdgeInsetsDirectional.all(4),
                                    child: Column(
                                      children: [
                                        flutterImage.Image.asset('assets/images/house.png',width: 35.w,height: 35.h,),
                                        RSizedBox(height: 5,),
                                        Text("المساحة",style: TextStyle(fontSize: 10,color: Colors.green),),
                                        RSizedBox(height: 1,),
                                        Text("${widget.listH.post?.postsable?.space}",style: TextStyle(fontSize:15.sp,color: Colors.black),)
                                      ],
                                    ),
                                  ),
                                )
                            ),
                            RSizedBox(width: 10,),
                            Expanded(
                                flex: 1,
                                child:Container(
                                  height: 100.h,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.blue[50],

                                  ),
                                  child: Padding(
                                    padding: REdgeInsetsDirectional.all(4),
                                    child: Column(
                                      children: [
                                        flutterImage.Image.asset('assets/images/living-room (1).png',width: 35.w,height: 35.h,),
                                        RSizedBox(height: 5,),
                                        Text("عدد الغرف ",style: TextStyle(fontSize: 10.sp,color: Colors.blue),),
                                        RSizedBox(height: 1,),
                                        Text("${widget.listH.post?.postsable?.roomNumber}",style: TextStyle(fontSize:15.sp,color: Colors.black),)
                                      ],
                                    ),
                                  ),
                                )
                            ),
                           RSizedBox(width: 10,),
                            Expanded(
                                flex: 1,
                                child:Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    color: Colors.yellow[50],
                                  ),
                                  height: 100.h,
                                  child: Padding(
                                    padding:REdgeInsetsDirectional.all(4),
                                    child: Column(
                                      children: [
                                        flutterImage.Image.asset('assets/images/building.png',width: 35.w,height: 35.h,),
                                        RSizedBox(height: 5,),
                                        Text("الطابق",style: TextStyle(fontSize: 10.sp,color: Colors.orange),),
                                        RSizedBox(height: 1,),
                                        Text("${widget.listH.post?.postsable?.floor}",style: TextStyle(fontSize:15.sp,color: Colors.black),)
                                      ],
                                    ),
                                  ),

                                )
                            ),
                          ],
                        ),
                        RSizedBox(height: 10,),
                        Row(
                          children: [
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.red[50],
                                ),
                                height: 100.h,
                                child: Padding(
                                  padding: REdgeInsetsDirectional.all(4),
                                  child: Column(
                                    children: [
                                      flutterImage.Image.asset('assets/images/directions.png',width: 50.w,height: 30.h,),
                                      RSizedBox(height: 3,),
                                      Text("الاتجاه",style: TextStyle(fontSize: 12.sp,color: Colors.red),),
                                      RSizedBox(height: 2,),
                                      Text("${widget.listH.post?.postsable?.direction}",style: TextStyle(fontSize:15.sp,color: Colors.black),)
                                    ],
                                  ),
                                ),

                              ),
                            ),
                            RSizedBox(width: 10,),
                            Expanded(
                              child: Container(
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.brown[50],
                                ),
                                height: 100.h,
                                child: Padding(
                                  padding: REdgeInsetsDirectional.all(4),
                                  child: Column(
                                    children: [
                                      flutterImage.Image.asset('assets/images/salary.png',width: 50.w,height: 30.h,),
                                      RSizedBox(height: 3,),
                                      Text("العملية",style: TextStyle(fontSize: 12.sp,color: Colors.brown),),
                                      RSizedBox(height: 2,),
                                      Text("${widget.listH.operationId==1?"بيع":"شراء"}",style: TextStyle(fontSize:15.sp,color: Colors.black),)
                                    ],
                                  ),
                                ),

                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                  Container(
                      padding: REdgeInsetsDirectional.all(10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          Text("تفاصيل أكثر:",style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.w500),),
                          Text("${widget.listH.post?.postsable?.description}",style: TextStyle(color: Colors.black,fontSize: 15.sp),),

                        ],
                      )),
                  Container(
                    padding: REdgeInsetsDirectional.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("المالك",style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold),),
                        Container(
                          padding: REdgeInsetsDirectional.all(10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.blueGrey[50],
                          ),
                          height: 90.h,
                          width: double.infinity,
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              CircleAvatar(
                                backgroundImage: NetworkImage('${widget.listH.user?.img}'),
                                backgroundColor: ColorBlue,
                                radius: 30,
                              ),
                              RSizedBox(width: 15,),
                              Center(child: Text("${widget.listH.user?.name}",style: TextStyle(fontSize: 20.sp),)),
                              SizedBox(width: MediaQuery.of(context).size.width/4,),
                              IconButton(
                                  onPressed: () {
                                    calling(number: widget.listH.user?.phone);
                                  }, icon: Container(
                                  width: 35.w,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: ColorBlue
                                  ),
                                  child: Icon(Icons.phone,color: Colors.white,size: 17,)
                              )),
                              IconButton(
                                  onPressed: () {
                                    messege(m:widget.listH.user?.phone );
                                  }, icon: Container(
                                  width: 35.w,
                                  height: 35.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(7),
                                      color: ColorBlue
                                  ),
                                  child: Icon(Icons.mail,color: Colors.white,size: 17,)
                              ))
                            ],
                          ),

                        )
                      ],
                    ),
                  )


                ],
              ),
            ),
            fallback:(context) =>  Center(child: CircularProgressIndicator()),
          )
        );
      },
    );
  }
}
