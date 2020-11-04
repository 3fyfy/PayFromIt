import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:payfromit/ListDrawer.dart';


class AboutUs extends StatefulWidget {
  @override
  _AboutUsState createState() => _AboutUsState();
}

class _AboutUsState extends State<AboutUs> {

  DocumentSnapshot docSnap=null;
  @override
  void initState()
  {
    getdata();

    // TODO: implement initState
    super.initState();
  }

  getdata()async{
    DocumentReference doc_ref=Firestore.instance.collection("About Us").document("About Us");
     docSnap = await doc_ref.get().then((value) => value);
     setState(() {
     });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    // TODO: implement build
    return Scaffold(
      resizeToAvoidBottomPadding: true,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60.0),
          child: Directionality(
            textDirection: TextDirection.ltr,
            child: AppBar(
              title: Text("عن التطبيق"),
              centerTitle: true,
              backgroundColor: Color(0xff00BED6),

              ),
            ),
          ),
        endDrawer: DrawerList(),

        body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            margin: EdgeInsets.symmetric(
              horizontal: 25,
              ),
            width: MediaQuery.of(context).size.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50,),
                Center(
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color(0xfff2f5fc),
                      borderRadius: BorderRadius.circular(150),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 2,
                          blurRadius: 7,
                          offset: Offset(
                              0, 3), // changes position of shadow
                          ),
                      ],
                      image: DecorationImage(image: AssetImage('assets/logo.png'))
                      ),
                    width: 150,
                    height: 150,
                    ),
                  ),


                SizedBox(
                  height: 50,
                  ),
                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 7,
                        offset: Offset(0, 3), // changes position of shadow
                        ),
                    ],
                    ),
                  padding: EdgeInsets.all(15),
                  child:docSnap==null?Center(child:CircularProgressIndicator()):Text(docSnap['text'],style: TextStyle(fontSize: 15,height: 1.5),textAlign: TextAlign.right,) ,


              ),
            ]),
          ),
        ),
      ));
  }

}

//Text("صفحة اشتري منه هي صفحة عاملينها عشان نتجمع عليها كلنا وندعم أي تاجر يقاطع المنتجات الفرنسية.\nأي تاجر أو محل أو مكان هيقاطع فرنسا وينزل المنتجات الفرنسية من على الرف يصور نفسه وهو بيعمل كده وينشر الصور على هاشتاج #اشتري_منه ويبعتلنا عنوانه واسمه على رسايل صفحة اشتري منه، وهننشر عنه ع الصفحة، بمجرد ما ننشر: أي حد فينا قريب منه ينزل يدعمه في مقاطعته لفرنسا ويشتري منه، ويمنشن لصحابه يشتروا منه.\nهنعمل مجتمع يدعم بعض في مقاطعته لفرنسا.\nقاطع.. ادعس.. مرّغ مناخير فرنسا ف التراب.",style: TextStyle(fontSize: 15,height: 1.5),textAlign: TextAlign.right,) ,