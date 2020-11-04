import 'dart:async';


import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:flutter/services.dart';
import 'package:payfromit/Constant/UpperConestant.dart';
import 'package:payfromit/formSend.dart';



class PickLocationOnMap extends StatefulWidget {


  @override
  State<PickLocationOnMap> createState() => PickLocationOnMapState();
}

class PickLocationOnMapState extends State<PickLocationOnMap> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  void initState() {
    marketLoction=LatLng(Lat, Lang);
    markers.clear();
    _addMarker();
    _goToTheLake();
    // TODO: implement initState
    super.initState();
  }
  Future<void> _addMarker() async {
    final MarkerId markerId = MarkerId("${LatLng(Lat,Lang).toString()}");
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(Lat, Lang);
    var first = placemark.first;
    // creating a new MARKER
    final Marker marker = Marker(
      icon: BitmapDescriptor.defaultMarker,
      //  icon:BitmapDescriptor.defaultMarkerWithHue(10),
      markerId: markerId,
      position: LatLng(Lat, Lang),
      infoWindow: InfoWindow(  title: first.name.toString(),
                                 snippet: first.subAdministrativeArea.toString(),),
      );

    setState(() {
      // adding a new marker to map
      nameLocation=first.name.toString();
      subNameLocation=first.subAdministrativeArea.toString();
      markers[markerId] = marker;
    });
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff00BED6),
        title: Text(
         "حدد موقع المتجر",
          style: TextStyle(fontFamily: 'Tajawal', color: Colors.white),
          ),
        centerTitle: true,
        iconTheme: IconThemeData(color: Colors.white),
        ),
      body: GoogleMap(
          compassEnabled: true,
          myLocationEnabled: true,
          scrollGesturesEnabled: true,
          rotateGesturesEnabled: true,
          tiltGesturesEnabled: true,
          zoomGesturesEnabled: true,
          onTap: (LatLng) async {
            marketLoction=LatLng;
            List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(LatLng.latitude,LatLng.longitude);
            var first = placemark.first;

            CameraPosition _kLakee = CameraPosition(
                bearing: 192.8334901395799,
                target: LatLng,
                tilt: 59.440717697143555,
                zoom: 17.4746);
            GoogleMapController controller = await _controller.future;
            controller.animateCamera(CameraUpdate.newCameraPosition(_kLakee));
            setState(() {
              markers.clear();
              marker = Marker(
                markerId: MarkerId("${LatLng.latitude.toString()}"),
                position: LatLng,
                icon: BitmapDescriptor.defaultMarker,
                infoWindow: InfoWindow(
                  title: first.name.toString(),
                  snippet: first.subAdministrativeArea.toString(),
                  ),
                onTap: () {},
                );
              markers[marker.markerId] = marker;
              nameLocation=first.name.toString();
              subNameLocation=first.subAdministrativeArea.toString();
            });
          },

//            indoorViewEnabled: true,
          myLocationButtonEnabled: true,
          buildingsEnabled: true,
          mapToolbarEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition: CameraPosition(

              target: LatLng(Lat,Lang),
              zoom: 15.5),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: Set<Marker>.of(markers.values),
      ),
    bottomSheet: Container(
    width: MediaQuery.of(context).size.width,
    color: Colors.white,
    padding: EdgeInsets.symmetric(vertical: 15),
    child: Column(
    mainAxisSize: MainAxisSize.min,

    children: [



    Container(
    decoration: BoxDecoration(
    color: Color(0xff00BED6), borderRadius: BorderRadius.circular(30)),
    height: 40,
    margin: EdgeInsets.only(bottom: 10),
    width: MediaQuery.of(context).size.width / 2,
    child: InkWell(
    onTap: () async {

      print(marketLoction);
   Navigator.pushReplacement(
    context,
    MaterialPageRoute(
    builder: (context) => FormApplication()),
    );


//LatLng(31.56097412775019, 31.08846042305231)

//    31.5583078
//    I/flutter (13405): 31.0939232
    },
    child: Center(
    child: Text(
   "تأكيد موقع المتجر",
    textAlign: TextAlign.center,
    style: TextStyle(
    fontSize: width/27,
    fontFamily: 'Almarai',
    fontWeight: FontWeight.bold,
    color: Colors.white),
    ),
    ),
    ),
    )
    ],
    ),
    ),
    );
  }

  Future<void> _goToTheLake() async {
    List<Placemark> placemark = await Geolocator().placemarkFromCoordinates(Lat, Lang);
    var first = placemark.first;
    CameraPosition _kLake = CameraPosition(
        bearing: 192.8334901395799,
        target: LatLng(Lat, Lang),
        tilt: 59.440717697143555,
        zoom: 14.4746);
    GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}
