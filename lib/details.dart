import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'color/colorMain.dart';

class Details extends StatelessWidget {
  const Details({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorBlue,
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsetsDirectional.all(20),
          child: Column(
            children: [
              const RSizedBox(
                height: 100,
              ),
              Text("معلومات و ميزات عن التطبيق", style: TextStyle(
                  color: Colors.white,fontWeight: FontWeight.w600,fontSize: 25.sp
              ),),
              const RSizedBox(
                height: 50,
              ),
              Text(
                "التطبيق قادر على توفير خيارات بحث متقدمة للمستخدمين للعثور على العقارات  أو السيارات أو الأراضي المناسبة وفقًا لاحتياجاتهم الخاصة مثل الموقع، والسعر، والمساحة، وغيرها.",
                style: TextStyle(
                  color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18.sp
                ),
              ),
              size(),
              const Divider(
                color: Colors.grey,
                indent: 30,
                endIndent: 30,
              ),
              size(),
              Text(
                "يتيح التطبيق عرض تفاصيل شاملة عن العقارات أو السيارات أو الأراضي المتاحة، بما في ذلك الصور، ووصف العقار، ومزاياه",
                style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18.sp
                ),
              ),
              size(),
              const Divider(
                color: Colors.grey,
                indent: 30,
                endIndent: 30,
              ),
              size(),
              Text(
                " يتيح التطبيق للمستخدمين حفظ العقارات المفضلة لديهم في قائمة مفضلاتهم للرجوع إليها لاحقًا.",
                style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18.sp
                ),
              ),
              size(),
              const Divider(
                color: Colors.grey,
                indent: 30,
                endIndent: 30,
              ),
              size(),
              Text(
                "يتيح التطبيق للمستخدم نشر بوستات و عرض أملاكه إن كانت أراضي أو سيارات أو بيوت للبيع أو للأجار  و بالإضافة لإمكانية الحذف أو التعديل على تلك البوستات و يقوم الأدمن بالموافقة على ذلك البوست قبل النشر أو رفضه. ",
                style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18.sp
                ),
              ),
              size(),
              const Divider(
                color: Colors.grey,
                indent: 30,
                endIndent: 30,
              ),
              size(),
              Text(
                "إمكانية حجز العقار أو السيارة أو الأرض حتى لا يتمكن شخص آخر من شراءه أو استأجاره ",
                style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18.sp
                ),
              ),
              size(),
              const Divider(
                color: Colors.grey,
                indent: 30,
                endIndent: 30,
              ),
              size(),
              Text(
                "باستخدام هذا التطبيق، يمكن للمستخدمين توفير الوقت والجهد في عملية البحث عن العقارات المناسبة لهم. يعد هذا التطبيق أداة قوية للوسطاء العقاريين والشركات العقارية للترويج للعقارات وزيادة فرص البيع والإيجار. ",
                style: TextStyle(
                    color: Colors.white,fontWeight: FontWeight.w400,fontSize: 18.sp
                ),
              ),
              size(),
              size(),

            ],
          ),
        ),
      ),
    );
  }
}

Widget size()=>RSizedBox(
  height: 20,
);

