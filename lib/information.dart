
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:payfromit/Constant/Governmwntjson.dart';
import 'package:payfromit/Constant/UpperConestant.dart';
import 'package:payfromit/ListDrawer.dart';
import 'package:payfromit/home.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:android_intent/android_intent.dart';
import 'package:permission_handler/permission_handler.dart';

class Information extends StatefulWidget {
  @override
  _InformationState createState() => _InformationState();
}

class _InformationState extends State<Information> {

  @override
  void initState() {

    // TODO: implement initState
    super.initState();
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
              title: Text("اتبع سنته"),
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
                horizontal: 15,
                ),
              width: MediaQuery.of(context).size.width,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 20,),
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
                            image: DecorationImage(image: AssetImage('assets/mqdefault.jpg'),fit: BoxFit.cover)
                            ),
                        width: 150,
                        height: 150,
                        ),
                      ),


                    SizedBox(
                      height: 20,
                      ),
                    Container(
                        width: width,
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
                        padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
                        child: StreamBuilder<QuerySnapshot>(
                            stream:Firestore.instance.collection('Information').snapshots(),
                            //Place_ar
                            builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                              if (!snapshot.hasData) return  Center(child: CircularProgressIndicator(backgroundColor: Colors.black26,));
                              else {
                                var data=snapshot.data.docs;

                               return Column(children:
    data.map((item){
      print(item['text']);

      return Card(
                                    color: primarycolor,
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          right: 10, top: 5, bottom: 5, left: 0
                                          ),
                                      child: Text(item['text'].toString(),
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        height: 1.5,
                                                        color: Colors.white
                                                        ),
                                                    textAlign: TextAlign.right,
                                                  ),

                                      ),
                                    );
    }).toList());
                                print(data[2]['text']);

                                }

                              }

                            )),


                  ]),
              ),
            ),
          ));
  }
}