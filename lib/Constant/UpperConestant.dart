import 'dart:io';

import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:payfromit/model/government.dart';

List<Placemark> placemark;


double Lat=0.0,Lang=0.0;


Governmet GovValue;
Cities cityValue;
List<Governmet> Countrylist;
int countryId=0;



//List<Countries> posts = List<Countries>.from(res).map((model)=> Countries.fromJson(model)).toList();
Map Governmen;





var Imageupload="";
Color primarycolor=Color(0xff00BED6);

Map<MarkerId, Marker> markers =
<MarkerId, Marker>{
};
Marker marker ;
TimeOfDay timeOfDay = TimeOfDay.now();
TextEditingController SearchTextController = TextEditingController();

int country=1;
int city=1;
String typeMarket="";
LatLng locationMarket;
List<Object> images = List<Object>();
TextEditingController address_controller=TextEditingController();
TextEditingController phone_controller=TextEditingController();
TextEditingController name_controller=TextEditingController();
LatLng marketLoction;
String nameLocation="";
String subNameLocation="";

class ImageUploadModel {
  bool isUploaded;
  bool uploading;
  File imageFile;
  String imageUrl;

  ImageUploadModel({
    this.isUploaded,
    this.uploading,
    this.imageFile,
    this.imageUrl,
  });
}