import 'package:url_launcher/url_launcher.dart';

 calling ({ number})async{
  var url='tel:$number';
  if(await canLaunch(url) )
  {
    await launch(url);
  }else
  {
    throw 'could not launch $url';
  }
}
messege ({m})async{
  var url='sms:$m';
  if(await canLaunch(url) )
  {
    await launch(url);
  }else
  {
    throw 'could not launch $url';
  }
}