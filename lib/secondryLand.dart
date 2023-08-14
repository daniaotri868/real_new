import 'package:carousel_slider/carousel_slider.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_new/widgetConst.dart';
import 'package:flutter/src/widgets/image.dart' as flutterImage;

import 'color/colorMain.dart';
import 'cubit/app_cubit.dart';
import 'jsons/land.dart';

class secondryLand extends StatefulWidget {
  Lands land;
   secondryLand({Key? key,required this.land}) : super(key: key);


  @override
  State<secondryLand> createState() => _secondryLandState();
}
class _secondryLandState extends State<secondryLand> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  CarouselController carouselController=CarouselController();
  int currentIndex=0;
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body:Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CarouselSlider(
                    items: widget.land.post?.postsable?.images==[]?[]:widget.land.post?.postsable?.images.map((e) {
                      return Container(
                        margin: REdgeInsetsDirectional.all(2),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5)
                        ),
                   child: ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child:
                       (widget.land.post?.postsable?.images)==[]?
                          flutterImage.Image.asset('assets/images/empty.png', height: 300.h,width: double.infinity,fit: BoxFit.cover,)
                              :
                          flutterImage.Image.network('${e.img}'
                            , height: 300.h,width: double.infinity,fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }).toList(),
                    carouselController: carouselController,
                    options: CarouselOptions(
                      scrollPhysics: BouncingScrollPhysics(),
                      height: 430.h,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          currentIndex=index;
                        });
                      },
                    ),
                  ),
                  Positioned(
                    left: 1.w,
                    top: 25.h,
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        }, icon: Icon(Icons.arrow_forward_outlined,color: Colors.black54,)),
                  ),
                  Positioned(
                      top: 30.h,
                      right: 1.w,
                      child: IconButton(onPressed: () {
                        AppCubit.get(context).ChangeIconFavorite();
                      },icon:AppCubit.get(context).iconFavorite==false?Icon(AppCubit.get(context).iconFavorite==false?Icons.favorite:Icons.favorite_sharp,color: Colors.white):Icon(AppCubit.get(context).iconFavorite==false?Icons.favorite_border:Icons.favorite_sharp,color: Colors.red[300]),
                      )),

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
                        children: List.generate(
                          widget.land.post!.postsable!.images.isEmpty?1:widget.land.post!.postsable!.images.length, (index) =>  Padding(
                          padding: const EdgeInsets.all(1),
                          child: CircleAvatar(radius: 3,backgroundColor:currentIndex==index? ColorBlue:Colors.black38,),
                        ),)
                    ),
                    SizedBox(height: 10.h,),
                    Text("السعر ${widget.land.price} مليون سوري",style: TextStyle(color: benlight,fontSize: 19),),
                    SizedBox(height: 4.h,),
                    Row(
                      children: [
                        Icon(Icons.location_on_sharp,color: Colors.grey,size: 13),
                        SizedBox(width: 2.w,),
                        Text("العنوان ${widget.land.post?.postsable?.location}",style: TextStyle(color: Colors.grey,fontSize: 13),),
                      ],
                    ),
                    SizedBox(height: 15.h,),
                    // Row(
                    //   children: [
                    //     Expanded(
                    //         flex: 1,
                    //         child:Container(
                    //           height: 85,
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(10),
                    //             color: Colors.teal[50],
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(4.0),
                    //             child: Column(
                    //               children: [
                    //                 Image.asset('assets/images/land (1).png',width: 30,height: 30,),
                    //                 SizedBox(height: 5,),
                    //                 Text("المساحة",style: TextStyle(fontSize: 10,color: Colors.green),),
                    //                 SizedBox(height: 1,),
                    //                 Text("500 كيلو مربع",style: TextStyle(fontSize:11,color: Colors.black),)
                    //               ],
                    //             ),
                    //           ),
                    //         )
                    //     ),
                    //     SizedBox(width: 10,),
                    //     Expanded(
                    //         flex: 1,
                    //         child:Container(
                    //           height: 85,
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(10),
                    //             color: Colors.blue[50],
                    //
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(4.0),
                    //             child: Column(
                    //               children: [
                    //                 Image.asset('assets/images/living-room (1).png',width: 30,height: 30,),
                    //                 SizedBox(height: 5,),
                    //                 Text("عدد الغرف ",style: TextStyle(fontSize: 10,color: Colors.blue),),
                    //                 SizedBox(height: 1,),
                    //                 Text("2",style: TextStyle(fontSize:15,color: Colors.black),)
                    //               ],
                    //             ),
                    //           ),
                    //         )
                    //     ),
                    //     SizedBox(width: 10,),
                    //     Expanded(
                    //         flex: 1,
                    //         child:Container(
                    //           decoration: BoxDecoration(
                    //             borderRadius: BorderRadius.circular(10),
                    //             color: Colors.yellow[100],
                    //           ),
                    //           child: Padding(
                    //             padding: const EdgeInsets.all(4.0),
                    //             child: Column(
                    //               children: [
                    //                 Image.asset('assets/images/building.png',width: 30,height: 30,),
                    //                 SizedBox(height: 5,),
                    //                 Text("الطابق",style: TextStyle(fontSize: 10,color: Colors.orange),),
                    //                 SizedBox(height: 1,),
                    //                 Text("2",style: TextStyle(fontSize:15,color: Colors.black),)
                    //               ],
                    //             ),
                    //           ),
                    //           height: 85,
                    //
                    //         )
                    //     ),
                    //   ],
                    // ),
                    // SizedBox(height: 10,),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            width: double.infinity,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.red[50],
                            ),
                            height: 85,
                            child: Padding(
                              padding: REdgeInsetsDirectional.all(5),
                              child: Column(
                                children: [
                                  Image.asset('assets/images/land (1).png',width: 60.w,height: 33.h,),
                                  SizedBox(height: 3,),
                                  Text("المساحة",style: TextStyle(fontSize: 10.sp,color: Colors.red),),
                                  SizedBox(height: 2,),
                                  Text("${widget.land.post?.postsable?.space} كيلو متر مربع",style: TextStyle(fontSize:13.sp,color: Colors.black),)
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
                                  Text("${widget.land.operationId==1?"بيع":"شراء"}",style: TextStyle(fontSize:15.sp,color: Colors.black),)
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
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("تفاصيل أكثر:",style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.w500),),
                      Text("${widget.land.post?.postsable?.description} ....",style: TextStyle(color: Colors.black,fontSize: 15.sp),),
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
                      height: 95.h,
                      width: double.infinity,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          CircleAvatar(
                            backgroundImage: NetworkImage('${widget.land.user?.img}'),
                            radius: 30,
                            backgroundColor: ColorBlue,
                          ),
                          SizedBox(width: 10.w,),
                          Center(child: Text("${widget.land.user?.name}",style: TextStyle(fontSize: 20.sp),)),
                          SizedBox(width: MediaQuery.of(context).size.width/4,),
                          IconButton(
                              onPressed: () {
                                calling(number: widget.land.user?.phone);

                              }, icon: Container(
                              width: 35.h,
                              height: 35.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(7),
                                  color: ColorBlue
                              ),
                              child: Icon(Icons.phone,color: Colors.white,size: 17,)
                          )),
                          IconButton(
                              onPressed: () {
                                messege(m:widget.land.user?.phone );
                              }, icon: Container(
                              width: 35.h,
                              height: 35.w,
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

          // ConditionalBuilder(
          //   condition:AppCubit.get(context).houses.isNotEmpty ,
          //   builder:(context) => SingleChildScrollView(
          //     child: Column(
          //       mainAxisSize: MainAxisSize.min,
          //       crossAxisAlignment: CrossAxisAlignment.start,
          //       children: [
          //         Stack(
          //           children: [
          //             CarouselSlider(
          //               items: [1,2,3,4,5].map((e) {
          //                 return Container(
          //                   margin: REdgeInsetsDirectional.all(2),
          //                   decoration: BoxDecoration(
          //                       borderRadius: BorderRadius.circular(5)
          //                   ),
          //                   child: ClipRRect(
          //                       borderRadius: BorderRadius.circular(5),
          //                       child: Image.asset('assets/images/mainland.png',height: 300.h,width: double.infinity,fit: BoxFit.fitHeight)),
          //                 );
          //               }).toList(),
          //               carouselController: carouselController,
          //               options: CarouselOptions(
          //                 scrollPhysics: BouncingScrollPhysics(),
          //                  height: 430.h,
          //                 viewportFraction: 1,
          //                 onPageChanged: (index, reason) {
          //                   setState(() {
          //                     currentIndex=index;
          //                   });
          //                 },
          //               ),
          //             ),
          //             Positioned(
          //               left: 1.w,
          //               top: 25.h,
          //               child: IconButton(
          //                   onPressed: () {
          //                     Navigator.pop(context);
          //                   }, icon: Icon(Icons.arrow_forward_outlined,color: Colors.black54,)),
          //             ),
          //             Positioned(
          //                 top: 30.h,
          //                 right: 1.w,
          //                 child: IconButton(onPressed: () {
          //                   AppCubit.get(context).ChangeIconFavorite();
          //                 },icon:AppCubit.get(context).iconFavorite==false?Icon(AppCubit.get(context).iconFavorite==false?Icons.favorite:Icons.favorite_sharp,color: Colors.white):Icon(AppCubit.get(context).iconFavorite==false?Icons.favorite_border:Icons.favorite_sharp,color: Colors.red[300]),
          //                 )),
          //
          //           ],
          //         ),
          //         SizedBox(height: 10.h,),
          //         Container(
          //           padding: REdgeInsetsDirectional.all(10),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Row(
          //                   mainAxisAlignment: MainAxisAlignment.center,
          //                   children: List.generate(5, (index) =>  Padding(
          //                     padding: const EdgeInsets.all(1),
          //                     child: CircleAvatar(radius: 3,backgroundColor:currentIndex==index? MainDark:Colors.black38,),
          //                   ),)
          //               ),
          //               SizedBox(height: 10.h,),
          //               Text("السعر 50 مليون سوري",style: TextStyle(color: benlight,fontSize: 19),),
          //               SizedBox(height: 4.h,),
          //               Row(
          //                 children: [
          //                   Icon(Icons.location_on_sharp,color: Colors.grey,size: 13),
          //                   SizedBox(width: 2.w,),
          //                   Text("العنوان الفرقان , جانب كلية الهندسة",style: TextStyle(color: Colors.grey,fontSize: 13),),
          //                 ],
          //               ),
          //               SizedBox(height: 15.h,),
          //               // Row(
          //               //   children: [
          //               //     Expanded(
          //               //         flex: 1,
          //               //         child:Container(
          //               //           height: 85,
          //               //           decoration: BoxDecoration(
          //               //             borderRadius: BorderRadius.circular(10),
          //               //             color: Colors.teal[50],
          //               //           ),
          //               //           child: Padding(
          //               //             padding: const EdgeInsets.all(4.0),
          //               //             child: Column(
          //               //               children: [
          //               //                 Image.asset('assets/images/land (1).png',width: 30,height: 30,),
          //               //                 SizedBox(height: 5,),
          //               //                 Text("المساحة",style: TextStyle(fontSize: 10,color: Colors.green),),
          //               //                 SizedBox(height: 1,),
          //               //                 Text("500 كيلو مربع",style: TextStyle(fontSize:11,color: Colors.black),)
          //               //               ],
          //               //             ),
          //               //           ),
          //               //         )
          //               //     ),
          //               //     SizedBox(width: 10,),
          //               //     Expanded(
          //               //         flex: 1,
          //               //         child:Container(
          //               //           height: 85,
          //               //           decoration: BoxDecoration(
          //               //             borderRadius: BorderRadius.circular(10),
          //               //             color: Colors.blue[50],
          //               //
          //               //           ),
          //               //           child: Padding(
          //               //             padding: const EdgeInsets.all(4.0),
          //               //             child: Column(
          //               //               children: [
          //               //                 Image.asset('assets/images/living-room (1).png',width: 30,height: 30,),
          //               //                 SizedBox(height: 5,),
          //               //                 Text("عدد الغرف ",style: TextStyle(fontSize: 10,color: Colors.blue),),
          //               //                 SizedBox(height: 1,),
          //               //                 Text("2",style: TextStyle(fontSize:15,color: Colors.black),)
          //               //               ],
          //               //             ),
          //               //           ),
          //               //         )
          //               //     ),
          //               //     SizedBox(width: 10,),
          //               //     Expanded(
          //               //         flex: 1,
          //               //         child:Container(
          //               //           decoration: BoxDecoration(
          //               //             borderRadius: BorderRadius.circular(10),
          //               //             color: Colors.yellow[100],
          //               //           ),
          //               //           child: Padding(
          //               //             padding: const EdgeInsets.all(4.0),
          //               //             child: Column(
          //               //               children: [
          //               //                 Image.asset('assets/images/building.png',width: 30,height: 30,),
          //               //                 SizedBox(height: 5,),
          //               //                 Text("الطابق",style: TextStyle(fontSize: 10,color: Colors.orange),),
          //               //                 SizedBox(height: 1,),
          //               //                 Text("2",style: TextStyle(fontSize:15,color: Colors.black),)
          //               //               ],
          //               //             ),
          //               //           ),
          //               //           height: 85,
          //               //
          //               //         )
          //               //     ),
          //               //   ],
          //               // ),
          //               // SizedBox(height: 10,),
          //               Container(
          //                 width: double.infinity,
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(10),
          //                   color: Colors.red[50],
          //                 ),
          //                 child: Padding(
          //                   padding: REdgeInsetsDirectional.all(5),
          //                   child: Column(
          //                     children: [
          //                       Image.asset('assets/images/land (1).png',width: 60.w,height: 33.h,),
          //                       SizedBox(height: 3,),
          //                       Text("المساحة",style: TextStyle(fontSize: 10.sp,color: Colors.red),),
          //                       SizedBox(height: 2,),
          //                       Text("500 كيلو متر مربع",style: TextStyle(fontSize:13.sp,color: Colors.black),)
          //                     ],
          //                   ),
          //                 ),
          //                 height: 85,
          //
          //               )
          //             ],
          //           ),
          //         ),
          //         Container(
          //             padding: EdgeInsets.all(10),
          //             child: Column(
          //               crossAxisAlignment: CrossAxisAlignment.start,
          //               children: [
          //                 Text("تفاصيل أكثر:",style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.w500),),
          //                 Text("تربة خصبة صالحة للزراعة ....",style: TextStyle(color: Colors.black,fontSize: 15.sp),),
          //               ],
          //             )),
          //         Container(
          //           padding: REdgeInsetsDirectional.all(10),
          //           child: Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text("المالك",style: TextStyle(color: Colors.black,fontSize: 18.sp,fontWeight: FontWeight.bold),),
          //               Container(
          //                 padding: REdgeInsetsDirectional.all(10),
          //                 decoration: BoxDecoration(
          //                   borderRadius: BorderRadius.circular(10),
          //                   color: ColorbackgroundDark,
          //                 ),
          //                 height: 95.h,
          //                 width: double.infinity,
          //                 child: Row(
          //                   crossAxisAlignment: CrossAxisAlignment.stretch,
          //                   children: [
          //                     CircleAvatar(
          //                       backgroundImage: AssetImage('assets/images/person.png'),
          //                       radius: 30,
          //                     ),
          //                     SizedBox(width: 10.w,),
          //                     Center(child: Text("دانية عطري",style: TextStyle(fontSize: 12),)),
          //                     SizedBox(width: 120.w),
          //                     IconButton(
          //                         onPressed: () {
          //                           calling();
          //
          //                         }, icon: Container(
          //                         width: 35.h,
          //                         height: 35.w,
          //                         decoration: BoxDecoration(
          //                             borderRadius: BorderRadius.circular(7),
          //                             color: MainDark
          //                         ),
          //                         child: Icon(Icons.phone,color: Colors.white,size: 17,)
          //                     )),
          //                     IconButton(
          //                         onPressed: () {
          //                           messege();
          //                         }, icon: Container(
          //                         width: 35.h,
          //                         height: 35.w,
          //                         decoration: BoxDecoration(
          //                             borderRadius: BorderRadius.circular(7),
          //                             color: MainDark
          //                         ),
          //                         child: Icon(Icons.mail,color: Colors.white,size: 17,)
          //                     ))
          //                   ],
          //                 ),
          //
          //               )
          //             ],
          //           ),
          //         )
          //
          //
          //       ],
          //     ),
          //   ),
          //   fallback:(context) => Center(child: CircularProgressIndicator()),
          // ),
        );
      },
    );
  }
}
