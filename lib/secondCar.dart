import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:real_new/widgetConst.dart';
import 'color/colorMain.dart';
import 'cubit/app_cubit.dart';
import 'jsons/cars.dart';
import 'package:flutter/src/widgets/image.dart' as flutterImage;

class secondCar extends StatefulWidget {
  Cars car;
  int index;
   secondCar({Key? key,required this.car,required this.index}) : super(key: key);

  @override
  State<secondCar> createState() => _secondCarState();
}
CarouselController carouselController=CarouselController();
int currentIndex=0;
class _secondCarState extends State<secondCar> {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body:  SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    CarouselSlider(
                      items: widget.car.post?.postsable?.images.map((e) {
                        return Container(
                          margin: REdgeInsetsDirectional.all(2),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: (widget.car.post?.postsable?.images)!.isEmpty?
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
                            bool x=AppCubit.get(context).listNote2.any((element) {
                              y=element['id'];
                              return element['idx'] == widget.index;
                            });
                            x?print("false"):print("true");
                            print("--------$y");
                            x?AppCubit.get(context).DeleteDataBase2(id:y ):AppCubit.get(context).insertDataBase2(idx: widget.index);
                          },
                          child:Container(
                            child:
                            AppCubit.get(context).listNote2.any((element) {
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

                  ],
                ),
                SizedBox(height: 10,),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(widget.car.post!.postsable!.images.length, (index) =>  Padding(
                            padding: REdgeInsetsDirectional.all(1),
                            child: CircleAvatar(radius: 3,backgroundColor:currentIndex==index? ColorBlue:Colors.black38,),
                          ),)
                      ),
                      SizedBox(height: 10,),
                      Text("السعر ${widget.car.price} مليون سوري",style: TextStyle(color: benlight,fontSize: 19),),
                      SizedBox(height: 4,),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                              flex: 1,
                              child:Container(
                                height: 85,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.teal[50],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Column(
                                    children: [
                                      Image.asset('assets/images/car (6).png',width: 30,height: 25,),
                                      SizedBox(height: 2,),
                                      Text(" الاسم",style: TextStyle(fontSize: 10,color: Colors.green),),
                                      SizedBox(height: 3,),
                                      Text("${widget.car.post?.postsable?.name}",style: TextStyle(fontSize:11,color: Colors.black),)
                                    ],
                                  ),
                                ),
                              )
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                              flex: 1,
                              child:Container(
                                height: 85,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.blue[50],

                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(4),
                                  child: Column(
                                    children: [
                                      Image.asset('assets/images/plate.png',width: 30,height: 25,),
                                      SizedBox(height:2 ,),
                                      Text("الموديل ",style: TextStyle(fontSize: 10,color: Colors.blue),),
                                      SizedBox(height: 3,),
                                      Text("${widget.car.post?.postsable?.model} ",style: TextStyle(fontSize:13,color: Colors.black),)
                                    ],
                                  ),
                                ),
                              )
                          ),
                          SizedBox(width: 10,),
                          Expanded(
                              flex: 1,
                              child:Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.yellow[100],
                                ),
                                height: 90,
                                child: Padding(
                                  padding: const EdgeInsets.all(5),
                                  child: Column(
                                    children: [
                                      Image.asset('assets/images/calendar (1).png',width: 30,height: 25,),
                                      SizedBox(height: 2,),
                                      Text("سنة الصنع",style: TextStyle(fontSize: 10,color: Colors.orange),),
                                      SizedBox(height: 3,),
                                      Text("${widget.car.post?.postsable?.year}",style: TextStyle(fontSize:13,color: Colors.black),)
                                    ],
                                  ),
                                ),

                              )
                          ),
                        ],
                      ),
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
                              width: double.infinity,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.red[50],
                              ),
                              height: 75,
                              child: Padding(
                                padding: const EdgeInsets.all(2.0),
                                child: Column(
                                  children: [
                                    Image.asset('assets/images/cars.png',width: 70,height: 27,),
                                    SizedBox(height: 1,),
                                    Text("مستعمل /  جديد",style: TextStyle(fontSize: 10,color: Colors.red),),
                                    SizedBox(height: 2,),
                                    Text("مستعمل",style: TextStyle(fontSize:12,color: Colors.black),)
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
                                    Text("${widget.car.operationId==1?"بيع":"شراء"}",style: TextStyle(fontSize:15.sp,color: Colors.black),)
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
                        Text("تفاصيل أكثر:",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.w500),),
                        Text("${widget.car.post?.postsable?.description}",style: TextStyle(color: Colors.black,fontSize: 12),),
                      ],
                    )),
                Container(
                  padding: EdgeInsets.all(10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("المالك",style: TextStyle(color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold),),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blueGrey[50],
                        ),
                        height: 70,
                        width: double.infinity,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            CircleAvatar(
                              // backgroundImage: AssetImage('assets/images/person.png'),
                              backgroundImage: NetworkImage('${widget.car.user?.img}'),
                              radius: 30,
                            ),
                            SizedBox(width: 10,),
                            Center(child: Text("${widget.car.user?.name}",style: TextStyle(fontSize:20.sp),)),
                            SizedBox(width: MediaQuery.of(context).size.width/4,),
                            IconButton(
                                onPressed: () {
                                   calling(number:  widget.car.user?.phone);

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
                                  messege(m: widget.car.user?.phone);
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
        );
      },
    );
  }
}
