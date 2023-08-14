import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/src/widgets/image.dart' as flutterImage;
import 'package:real_new/profile.dart';
import 'package:real_new/secondry.dart';

import 'color/colorMain.dart';
import 'cubit/app_cubit.dart';
import 'jsons/housesJson.dart';
import 'package:intl/intl.dart';


class section extends StatefulWidget {
  List<Houses> ?ListHouses;

  section({Key? key,required this.ListHouses}) : super(key: key);

  @override
  State<section> createState() => _sectionState();
}

class _sectionState extends State<section> {
  List<Houses> _searchResult = [];

  @override
  void initState() {
    super.initState();
    _searchResult.addAll(widget.ListHouses as Iterable<Houses> );
  }

  void _filterList(String searchQuery) {
    _searchResult.clear();
    if (searchQuery.isNotEmpty) {
      widget.ListHouses?.forEach((item) {
        if (item.post!.postsable!.location!.contains(searchQuery)
            ||item.price.toString()!.contains(searchQuery)
            // ||item.post!.postsable!.roomNumber!.toString().contains(searchQuery)
        ) {
          setState(() {
            _searchResult.add(item);
          });
        }
        else
          {
           setState(() {
             // _searchResult.clear();
           });
            print("No Content");
          }
        // if (item.user!.name!.toLowerCase().contains(searchQuery.toLowerCase())) {
        //   _searchResult.add(item);
        // }
      });
    } else {
      setState(() {
        _searchResult.addAll(widget.ListHouses as Iterable<Houses>);
      });

    }

  }

  Widget build(BuildContext context) {
    DateFormat formatter = DateFormat('dd/MM/yyyy');

    return BlocBuilder<AppCubit, AppState>(
      builder: (context, state) {
        return Scaffold(
          backgroundColor:Colors.white,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
              automaticallyImplyLeading: false,
              toolbarHeight: 100.h,
              title: SizedBox(
                height: 70.h,
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xffF2F7FF)
                  ),
                  child: TextField(

                      onChanged: (value) {
                        print(value);
                        _filterList(value);
                      },
                      // AppCubit.get(context).functionSearch(value: value,context: context);

                      cursorColor: Colors.white,

                      decoration:InputDecoration(
                        filled: false,
                        fillColor: Color(0xffDEEAFD),
                        hintText: " ابحث هنا عن المنطقة أو السعر",
                        hintStyle: TextStyle(fontFamily: 'Vollkorn',color: Colors.black54,fontSize: 17.sp),
                        prefixIcon:  Icon(Icons.search,color: Color(0xffFFBDBDBD)),

                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xffDEEAFD))
                        ),
                        enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                            borderSide: BorderSide(color: Color(0xffDEEAFD))
                        ),
                      )
                  ),
                ),
              ),
                  actions: [
                    Padding(
                    padding: EdgeInsets.all(8.0),
                    child: InkWell(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => Profile(),));
                      },
                      child: CircleAvatar(
              backgroundImage: AssetImage('assets/images/person.png'),
              radius: 25,
            ),
                    ),
                  ),
                  ]

          ),
          body: Padding(
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
                                (_searchResult[index].post?.postsable?.images)!.isEmpty?
                            flutterImage.Image.asset('assets/images/empty.png',width: 150.w,height:160.h,fit: BoxFit.cover,)
                                :
                            flutterImage.Image.network('${_searchResult[index].post?.postsable?.images[0].img}'
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
                              bool x=AppCubit.get(context).listNote.any((element) {
                              y=element['id'];
                              return element['idx'] == index;
                              });
                              x?print("false"):print("true");
                              print("--------$y");
                              x?AppCubit.get(context).DeleteDataBase(id:y ):AppCubit.get(context).insertDataBase(idx: index);
                                },
                                child:  AppCubit.get(context).listNote.any((element) {
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
                            Text("العنوان ${_searchResult[index].post?.postsable?.location} ",style: TextStyle(fontWeight: FontWeight.bold, overflow:TextOverflow.ellipsis ,fontSize: 17.sp)),
                            RSizedBox(height: 7.h,),
                            Text("السعر ${_searchResult[index].price} مليون ل.س", style: TextStyle(fontSize: 17.sp)),
                            RSizedBox(height: 7.h,),
                            Text("تاريخ النشر ${formatter.format(_searchResult[index].post!.postDate as DateTime)}",style: TextStyle(color: Colors.grey,fontSize: 15.sp)),
                            RSizedBox(height: 5,),
                            TextButton(
                                onPressed: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => second(listH: _searchResult[index],index: index,)));
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
                itemCount: _searchResult.length),
          ),
        );
      },
    );
  }
}
