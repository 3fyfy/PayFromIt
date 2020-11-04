//import 'dart:io';
//
//
//import 'package:flutter/material.dart';
//import 'package:connectivity/connectivity.dart';
//import 'package:payfromit/Constant/UpperConestant.dart';
//import 'package:payfromit/splash.dart';
//
//class Internetchecker extends StatefulWidget {
//  @override
//  State<StatefulWidget> createState() {
//    // TODO: implement createState
//    return InternetcheckerState();
//  }
//
//
////}
//
//class InternetcheckerState extends State<Internetchecker> {
//  void initState() {
//    super.initState();
//  }
//  var fristin,fristaccess=2;
//  Internetcheckk() async {
//     Connectivity()
//        .onConnectivityChanged
//        .listen((ConnectivityResult result) async {
//      if(fristin==null){
//        fristin==result;
//        fristaccess=1;
//      }
//      if(fristin == result){
//        if(fristaccess==1){
//          if (result.index != 2) {
//            try {
//              final result = await InternetAddress.lookup('google.com');
//              if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//                runApp(MaterialApp(
//                  debugShowCheckedModeBanner: false,
//                  home: Splash(),
//                ));
//                print('connected 1');
//
//                // Navigator.of(context).pop();
//              }
//            } on SocketException catch (_) {
//              runApp(MaterialApp(
//                debugShowCheckedModeBanner: false,
//                home: Internetchecker(),
//              ));
//              print('not connected 1');
//            }
//          }
//          else {
//            runApp(MaterialApp(
//              debugShowCheckedModeBanner: false,
//              home: Internetchecker(),
//            ));
//            print('not connected 2');
//          }
//        }
//
//      }else{
//        if (result.index != 2) {
//          try {
//            final result = await InternetAddress.lookup('google.com');
//            if (result.isNotEmpty && result[0].rawAddress.isNotEmpty) {
//              runApp(MaterialApp(
//                debugShowCheckedModeBanner: false,
//                home: Splash(),
//              ));
//              print('connected 2');
//
//              // Navigator.of(context).pop();
//            }
//          } on SocketException catch (_) {
//            runApp(MaterialApp(
//              debugShowCheckedModeBanner: false,
//              home: Internetchecker(),
//            ));
//            print('not connected 3');
//          }
//        }
//        else {
//          runApp(MaterialApp(
//            debugShowCheckedModeBanner: false,
//            home: Internetchecker(),
//          ));
//          print('not connected 4');
//        }
//      }
//    });
//  }
//  @override
//  Widget build(BuildContext context) {
//    // TODO: implement build
//    return  ;
//  }
//  Widget ShowDialog(){
//    showDialog(
//        context: context,
//        builder: (BuildContext context) {
//      return AlertDialog(
//          titlePadding: EdgeInsets.zero,
//          // contentPadding:EdgeInsets.zero ,
//
//          actionsPadding: EdgeInsets.zero,
//          buttonPadding: EdgeInsets.zero,
//          insetPadding: EdgeInsets.zero,
//
//          backgroundColor: Colors.white,
//          content:Text("تأكد من اتصالك بالانترنت"),
//        actions: [],
//
//          )});
//  }
//
//}
