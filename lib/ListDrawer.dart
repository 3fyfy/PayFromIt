import 'package:flutter/material.dart';
import 'package:payfromit/aboutUs.dart';
import 'package:payfromit/boycott.dart';
import 'package:payfromit/formSend.dart';
import 'package:payfromit/home.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';



class DrawerList extends StatefulWidget {
  @override
  _DrawerListState createState() => new _DrawerListState();
}

class _DrawerListState extends State<DrawerList> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;

    return  Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        color: Colors.lightBlue,
        child: Drawer(

          child: Container(
            color: Color(0xff00BED6),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    height: height*.2,
                    decoration: BoxDecoration(
                    image: DecorationImage(image:AssetImage('assets/mqdefault.jpg'),fit: BoxFit.cover )
                      ),


                    ),
                  drawerItem("الصفحة الرئيسية",Icons.home,(){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Home(),));

                  },true),
                  drawerItem("اضافة متجر ",Icons.add_box,(){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => FormApplication(),));

                  },true),
                  drawerItem("قائمة المقاطعة",Icons.assignment,(){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => boycott(),));


                  },false),
                  drawerItem("مشاركة التطبيق",Icons.share,(){
                    Share.share('https://play.google.com/store/apps/details?id=com.webview.sevenplusclinics');

                  },false),


                  drawerItem("عن التطبيق",Icons.error,(){
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => AboutUs(),));

                  },false),
                drawerItem("تواصل معنا",Icons.error,(){
                  _launchURL();


                  },false),//AboutUs

                ],
                ),
              ),
          ),
          ),
      ),
    );
  }


  Widget drawerItem(String title,IconData icon,Function function,bool active){

    return InkWell(
      onTap:function ,
      child: Container(
        height: 50,
        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
        child: Row(
          children: [
            Icon(icon,color: Colors.white,),
            SizedBox(width: 10,),
            Text(title,style: TextStyle(fontSize: 18,color:Colors.white,),),

          ],
          ),
        ),
      );

  }



  SizedBox EmptyWidget(){
    return SizedBox(
      height: 0,
      width: 0,
      );
  }

  _launchURL() async {
    const url = 'https://m.me/Eshtrymeno';
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'هاتفك لا يدعم تطبيق الماسنجر';
    }
  }

}
