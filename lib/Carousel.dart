import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'color/colorMain.dart';

class carousel extends StatelessWidget {
  const carousel({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(10))
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                child: AspectRatio(
                  aspectRatio: 10/9,
                  child: Container(
                    color: Colors.orange,
                    margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
                    child: Image.asset('assets/images/mainhouse.jpg',fit:BoxFit.cover),
                  ),
                ),
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
                top: 30,
                right: 1,
                child: IconButton(onPressed: () {

                },icon: Icon(Icons.favorite_sharp,color: Colors.red[300]),
                ))
          ],
        ),
        SizedBox(height: 15,),
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [

                  CircleAvatar(radius: 3,backgroundColor: Colors.black,),
                  SizedBox(width: 2,),
                  CircleAvatar(radius: 3,backgroundColor: Colors.black,),
                  SizedBox(width: 2,),
                  CircleAvatar(radius: 3,backgroundColor: Colors.black,),
                  SizedBox(width: 2,),
                  CircleAvatar(radius: 3,backgroundColor: Colors.black,)
                ],
              ),
              SizedBox(height: 10,),
              Text("السعر 50 مليون سوري",style: TextStyle(color: benlight,fontSize: 19),),
              SizedBox(height: 4,),
              Row(
                children: [
                  Icon(Icons.location_on_sharp,color: Colors.grey,size: 13),
                  SizedBox(width: 2,),
                  Text("العنوان الفرقان , جانب كلية الهندسة",style: TextStyle(color: Colors.grey,fontSize: 13),),
                ],
              ),
              SizedBox(height: 10,),
              Row(
                children: [
                  Expanded(
                      flex: 1,
                      child:Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.purple[50],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset('assets/images/house.png',width: 30,height: 30,),
                              SizedBox(height: 10,),
                              Text("المساحة",style: TextStyle(fontSize: 10,color: Colors.purple),),
                              SizedBox(height: 3,),
                              Text("500 كيلو مربع",style: TextStyle(fontSize:11,color: Colors.black),)
                            ],
                          ),
                        ),
                      )
                  ),
                  SizedBox(width: 10,),
                  Expanded(
                      flex: 1,
                      child:Container(
                        height: 100,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.blue[50],

                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset('assets/images/house.png',width: 30,height: 30,),
                              SizedBox(height: 10,),
                              Text("عدد غرف النوم",style: TextStyle(fontSize: 10,color: Colors.blue),),
                              SizedBox(height: 3,),
                              Text("2",style: TextStyle(fontSize:15,color: Colors.black),)
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
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [
                              Image.asset('assets/images/house.png',width: 30,height: 30,),
                              SizedBox(height: 10,),
                              Text("عدد غرف الجلوس",style: TextStyle(fontSize: 10,color: Colors.orange),),
                              SizedBox(height: 3,),
                              Text("2",style: TextStyle(fontSize:15,color: Colors.black),)
                            ],
                          ),
                        ),
                        height: 100,

                      )
                  ),
                ],
              )
            ],
          ),
        )

      ],
    );
  }
}
