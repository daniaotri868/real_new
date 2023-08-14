import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../cubit/app_cubit.dart';
import '../jsons/housesJson.dart' ;
import '../secondry.dart';
import 'package:flutter/src/widgets/image.dart' as flutterImage;

class list extends StatefulWidget {
  List<Houses> ?ListHouses;

   list({Key? key, required this.ListHouses}) : super(key: key);

  @override
  State<list> createState() => _listState();

}

class _listState extends State<list> {
  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AppCubit, AppState>(
  builder: (context, state) {
    return Container(
      height: 200.h,
      child: ListView.separated(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          // List<Houses> h=;
          return InkWell(
            onTap: () {
              print(index);
              Navigator.push(context, MaterialPageRoute(builder: (context) => second(listH: widget.ListHouses![index],index: index,)));
            },
            child: Container(
              width: 200.w,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(25),
                color:Colors.transparent,

              ),
              child: Stack(
                children: [
                  ClipRRect(
                      borderRadius: const BorderRadius.only(topLeft:Radius.circular(25) ,topRight:Radius.circular(25),bottomLeft: Radius.circular(25),bottomRight: Radius.circular(25) ),
                      child:
                      (widget.ListHouses?[index].post?.postsable?.images)!.isEmpty?
                          flutterImage.Image.asset('assets/images/empty.png', height: 200.h, width:200.w,fit: BoxFit.cover,)
                          :
                      flutterImage.Image.network('${widget.ListHouses?[index].post?.postsable?.images[0].img}'
                        , height: 200.h, width:200.w,fit: BoxFit.cover,
                      )
                  ),
                  // child: Image.asset('assets/images/mainhouse.jpg', height: 300, width:250,fit: BoxFit.cover,)),
                  Positioned(
                    right: 1.w,
                    bottom: 1.h,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: const BorderRadius.only(topLeft: Radius.circular(10),topRight: Radius.circular(10),bottomRight: Radius.circular(25),bottomLeft: Radius.circular(25)),
                        color: Colors.black.withOpacity(0.3),
                      ),
                      width: 200.w,
                      child: Padding(
                        padding:REdgeInsetsDirectional.only(start: 8),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            RSizedBox(height: 5,),
                            Text("المساحة ${widget.ListHouses?[index].post?.postsable?.space} ",style: TextStyle(color:Colors.white,fontSize: 13.sp,fontWeight: FontWeight.bold)),
                            RSizedBox(height: 2,),
                            Text("   عدد الغرف   ${widget.ListHouses?[index].post?.postsable?.roomNumber}    ",style: TextStyle(color: Colors.white,fontSize: 10.sp,fontWeight: FontWeight.bold)),
                            RSizedBox(height: 2,),
                            Text("    ${widget.ListHouses?[index].post?.postsable?.location}   ",style: TextStyle(color: Colors.white,fontSize: 10.sp,fontWeight: FontWeight.bold)),
                            RSizedBox(height: 2,),
                          ],),
                      ),
                    ),
                  ),
                  Positioned(
                      top: 7.h,
                      right: 10.w,
                      child:InkWell(
                        onTap: () {
                          // AppCubit.get(context).DeleteAll();
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
                        child:Container(
                          child:
                          AppCubit.get(context).listNote.any((element) {
                            return element['idx'] == index;
                          })?// AppCubit.get(context).listNote[index]['fav']==1?
                          CircleAvatar(
                            backgroundColor: Colors.white,
                            radius: 13,
                            child: RSizedBox(
                              height: 20.h,
                              width: 20.w,
                              child:   flutterImage.Image.asset('assets/images/heart.png',),
                            ),
                          ):
                          CircleAvatar(
                            backgroundColor: Colors.black,
                            radius: 13,
                            child: RSizedBox(
                              height: 20.h,
                              width: 20.w,
                              child: flutterImage.Image.asset('assets/images/heart (3).png', color: Colors.white),
                            ),
                          ),
                        ) ,
                      )
                  )

                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(width: 10),
        itemCount:widget.ListHouses!.length ,
        scrollDirection: Axis.horizontal,
      ),
    );
  },
);
  }
}
