import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_polyline_points/flutter_polyline_points.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'dart:async';
import 'Constant/UpperConestant.dart';
import 'dart:ui' as ui;


Uint8List markerIcon1;

class MapPage extends StatefulWidget {
  final   double  targetLat;
  final  double targetLang ;
  final  String tiltle;
  final String snippet;
  const MapPage(this.targetLat, this.targetLang,this.tiltle,this.snippet);
  @override
  _MapPageState createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {




  Future<Uint8List> getBytesFromAsset(String path, int width) async {
    ByteData data = await rootBundle.load(path);
    ui.Codec codec = await ui.instantiateImageCodec(data.buffer.asUint8List(),
                                                        targetWidth: width);
    ui.FrameInfo fi = await codec.getNextFrame();
    return (await fi.image.toByteData(format: ui.ImageByteFormat.png))
        .buffer
        .asUint8List();
  }



  Completer<GoogleMapController> _controller = Completer();
    final Set<Polyline> polyline = {};
    List<LatLng> routeCoords;

    Map<PolylineId, Polyline> polylines = {};
    List<LatLng> polylineCoordinates = [];
    PolylinePoints polylinePoints = PolylinePoints();
    String googleAPiKey = "AIzaSyD0juAp4qYUdiT6zfUZbx1SUbjlkjckOvg";
   // String googleAPiKey = "AIzaSyD0juAp4qYUdiT6zfUZbx1SUbjlkjckOvg";


    @override
    void initState() {
    //  loading = false;
    //  checker.InternetcheckerState().Internetcheckk();



  //    getLocation();

      markers.clear();
      _addMarker(LatLng(Lat, Lang), "origin",
                     BitmapDescriptor.defaultMarker,"موقعك الحالي","");
      _addMarker(LatLng(widget.targetLat, widget.targetLang), "destination",BitmapDescriptor.fromBytes(markerIcon1),widget.tiltle,widget.snippet);
    //  _goToTheLake();
      _getPolyline();
      // TODO: implement initState
      super.initState();
    }


    getLocation()async{
      Position position = await Geolocator()
          .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      Lat = position.latitude;
      Lang = position.longitude;
    }



    Future<void> _addMarker(LatLng position, String id, BitmapDescriptor descriptor,String tiltle,String snippet) async {
      markerIcon1 = await getBytesFromAsset('assets/map-marker.png', 80);

      final MarkerId markerId = MarkerId(id);

      // creating a new MARKER
      final Marker marker = Marker(
        icon: descriptor,
        markerId: markerId,
        position: position,
        infoWindow: InfoWindow(title: tiltle, snippet: snippet),
        );

      setState(() {
        // adding a new marker to map
        markers[markerId] = marker;
      });
    }


    @override
    Widget build(BuildContext context) {
      double width = MediaQuery.of(context).size.width;
      return Scaffold(
        body: SafeArea(
          child: GoogleMap(
          compassEnabled: true,
          myLocationEnabled: true,
          scrollGesturesEnabled: true,
          rotateGesturesEnabled: true,
          tiltGesturesEnabled: true,
          zoomGesturesEnabled: true,
          onTap: (LatLng) async {
          //  _getPolyline();
          },

//            indoorViewEnabled: true,
          myLocationButtonEnabled: true,
          buildingsEnabled: true,
          mapToolbarEnabled: true,
          mapType: MapType.normal,
          initialCameraPosition:
          CameraPosition(target: LatLng(Lat, Lang), zoom: 15.5),
          onMapCreated: (GoogleMapController controller) {
            _controller.complete(controller);
          },
          markers: Set<Marker>.of(markers.values),
          polylines:  Set<Polyline>.of(polylines.values),
          ),
      ),
      );
    }

    Future<void> _goToTheLake() async {
      CameraPosition _kLake = CameraPosition(
          bearing: 192.8334901395799,
          target: LatLng(Lat, Lang),
          tilt: 59.440717697143555,
          zoom: 14.4746);
      GoogleMapController controller = await _controller.future;
      controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
    }

    _addPolyLine() {
      PolylineId id = PolylineId("poly");
      Polyline polyline = Polyline(
          polylineId: id, color:primarycolor, points: polylineCoordinates,width: 2);
      polylines[id] = polyline;
      setState(() {});
    }

    _getPolyline() async {
      PolylineResult result = await polylinePoints.getRouteBetweenCoordinates(
          googleAPiKey ,
          PointLatLng(Lat, Lang),
          PointLatLng(widget.targetLat, widget.targetLang),
          travelMode: TravelMode.driving,
//          wayPoints: [PolylineWayPoint(location: "Sabo, Yaba Lagos Nigeria")]
          );
      if (result.points.isNotEmpty) {
        result.points.forEach((PointLatLng point) {
          polylineCoordinates.add(LatLng(point.latitude, point.longitude));
        });
      }
      _addPolyLine();
    }

}
