
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:payfromit/Constant/Governmwntjson.dart';
import 'package:payfromit/Constant/UpperConestant.dart';
import 'package:payfromit/home.dart';
import 'dart:async' show Future;
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter/material.dart';
import 'package:android_intent/android_intent.dart';
import 'package:permission_handler/permission_handler.dart';

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  List<List<dynamic>> data = [];
Api api=Api();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Countrylist=api.getAllGovernmet();
    GovValue=Countrylist[0];
    cityValue=Countrylist[0].cities[0];

    Timer(Duration(seconds: 3), ()=>Navigator.of(context).pushReplacement((MaterialPageRoute(builder: (context)=>AskForPermission()))));
  }





  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,

      decoration: BoxDecoration(
          color: Colors.white
      ),
      child:   Center(
        child: Container(
          decoration: BoxDecoration(
              color: Color(0xfff2f5fc),
              borderRadius: BorderRadius.circular(150),
              boxShadow: [
                BoxShadow(
                  color: primarycolor.withOpacity(0.2),
                  spreadRadius: 2,
                  blurRadius: 10,
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
    );
  }
}



class AskForPermission extends StatefulWidget {
  @override
  _AskForPermissionState createState() => _AskForPermissionState();
}
class _AskForPermissionState extends State<AskForPermission> {
  bool checkgps=false;


  final PermissionHandler permissionHandler = PermissionHandler();
  Map<PermissionGroup, PermissionStatus> permissions;
  void initState() {
    super.initState();
    requestLocationPermission();
    _gpsService();

    images.add("Add Image");
    images.add("Add Image");
    images.add("Add Image");
  }
  Future<bool> _requestPermission(PermissionGroup permission) async {
    final PermissionHandler _permissionHandler = PermissionHandler();
    var result = await _permissionHandler.requestPermissions([permission]);
    if (result[permission] == PermissionStatus.granted) {
      return true;
    }
    return false;
  }
/*Checking if your App has been Given Permission*/
  Future<bool> requestLocationPermission({Function onPermissionDenied}) async {
    var granted = await _requestPermission(PermissionGroup.location);
    if (granted!=true) {
      requestLocationPermission();
    }
    debugPrint('requestContactsPermission $granted');
    return granted;
  }
/*Show dialog if GPS not enabled and open settings location*/
  Future _checkGps() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      if (Theme.of(context).platform == TargetPlatform.android) {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text("لتجربة افضل"),

                content:const Text('يجب تفعيل الموقع الجفرافي للجهاز '),
                actions: <Widget>[
                  FlatButton(child: Text('حسناً'),
                                 onPressed: () {
                                   final AndroidIntent intent = AndroidIntent(
                                       action: 'android.settings.LOCATION_SOURCE_SETTINGS');
                                   intent.launch();
                                   _gpsService();

                                   Navigator.of(context, rootNavigator: true).pop();
                                 })],
                );
            });
      }
    }
  }
  getLocation()async{
    Position position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
    Lat = position.latitude;
    Lang = position.longitude;
  }

/*Check if gps service is enabled or not*/
  Future _gpsService() async {
    if (!(await Geolocator().isLocationServiceEnabled())) {
      _checkGps();
      return null;
    } else{

      checkgps=true;
      getLocation();
      return true;

    }
  }
  @override
  Widget build(BuildContext context) {
    return Home();
  }
}