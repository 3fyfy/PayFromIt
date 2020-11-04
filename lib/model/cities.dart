//import 'package:flutter/material.dart';
//import 'package:geolocator/geolocator.dart';
//import 'package:payfromit/Constant/Constant.dart';
//import 'package:payfromit/Constant/UpperConestant.dart';
//import 'package:payfromit/Constant/listPlaces.dart';
//import 'package:payfromit/map.dart';
//
//
//class Home extends StatefulWidget {
//  @override
//  _HomeState createState() => _HomeState();
//}
//
//class _HomeState extends State<Home> {
// int Catigory_marker = 0;
// var tripDistance=100;
//
//  @override
//  void initState() {
//    Catigory_marker = 0;
//    getLocation();
//
//    // TODO: implement initState
//    super.initState();
//  }
//
// getLocation()async{
//   Position position = await Geolocator()
//       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   Lat = position.latitude;
//   Lang = position.longitude;
// }
//  @override
//  Widget build(BuildContext context) {
//   print( Countrylist);
//    return  Scaffold(
//      appBar: PreferredSize(
//        preferredSize: Size.fromHeight(60.0),
//        child: Directionality(
//          textDirection: TextDirection.rtl,
//          child: AppBar(
//            title: Text("اشتري منه"),
//            centerTitle: true,
//            backgroundColor: Color(0xff00BED6),
//
//          ),
//        ),
//      ),
//      body: Container(
//          width: double.infinity,
//          height: double.infinity,
//          color: Colors.white,
//          child:HomeTab(context)),
//
//      drawer: Drawer(),
//    );
//  }
//
//  SingleChildScrollView HomeTab(BuildContext context) {
//    double widths = MediaQuery.of(context).size.width;
//    double hights = MediaQuery.of(context).size.height;
//    return SingleChildScrollView(
//      child: Column(
//        crossAxisAlignment: CrossAxisAlignment.end,
//        children: [
//          SizedBox(
//            height: 5,
//            ),
//         // selectGovernment(),
//          SizedBox(
//            height: 5,
//            ),
//          Padding(
//            padding: const EdgeInsets.only(right: 23.0, bottom: 5),
//            child: Text(
//              "المتاجر المقاطِعة",
//              style: TextStyle(
//                  color: Colors.black,
//                  fontFamily: 'Cairo',
//                  fontWeight: FontWeight.w300,
//                  fontSize: widths / 25),
//              ),
//            ),
//          Padding(
//            padding: const EdgeInsets.only(right: 15.0, left: 15.0),
//            child: SizedBox(
//              height: 30,
//              child: ListView.builder(
//                  scrollDirection: Axis.horizontal,
//                  shrinkWrap: true,
//                  reverse: true,
//                  itemCount: Place_ar[0] == null ? 0 : Place_ar.length,
//                  itemBuilder: (context, int index) {
//                    return InkWell(
//                      onTap: () async {
////                        Places_List = new List();
////                        setState(() {
////                          Catigory_marker = index;
////                          Places_List = [];
////                          getdatanow = true;
////                        });
////                        if (index != 0) {
////                          var response = await http.get(
////                              "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$Lat,$Lang&keyword=${Place_en[index]}&key=AIzaSyCrlhK92MhG3urFsESy3u1b5TGAxoFv6RA&rankby=distance");
////                          var jsonResponse = convert.jsonDecode(response.body);
////                          setState(() {
////                            Urlgooglesearch =
////                            "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$Lat,$Lang&keyword=${Place_en[index]}&key=AIzaSyCrlhK92MhG3urFsESy3u1b5TGAxoFv6RA&rankby=distance";
////                            Places_List = jsonResponse['results'];
////                            Nextpage = jsonResponse['next_page_token'];
////                            getdatanow = false;
////                          });
////                        } else {
////                          var response = await http.get(
////                              "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$Lat,$Lang&key=AIzaSyCrlhK92MhG3urFsESy3u1b5TGAxoFv6RA&rankby=distance");
////                          var jsonResponse = convert.jsonDecode(response.body);
////                          setState(() {
////                            Urlgooglesearch =
////                            "https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=$Lat,$Lang&key=AIzaSyCrlhK92MhG3urFsESy3u1b5TGAxoFv6RA&rankby=distance";
////                            Places_List = jsonResponse['results'];
////                            Nextpage = jsonResponse['next_page_token'];
////                            getdatanow = false;
////                          });
////                        }
//
//                     setState(() {
//                          Catigory_marker = index;
//
//                        });
//                      },
//                      child: Container(
//                        decoration: BoxDecoration(
//                          borderRadius: BorderRadius.circular(30),
//                          color: Catigory_marker == index
//                              ? Color(0xff00BED6)
//                              : Color(0xffEEEEEE).withOpacity(0.5),
//                          ),
//                        margin: EdgeInsets.only(left: 8.0),
//                        child: Padding(
//                          padding: const EdgeInsets.symmetric(
//                              vertical: 0, horizontal: 20),
//                          child: Text(
//                            Place_ar[index].toString(),
//                            textAlign: TextAlign.center,
//                            style: TextStyle(
//                                color: Catigory_marker == index
//                                    ? Colors.white
//                                    : Color(0xff00BED6),
//                                fontFamily: 'Cairo',
//                                fontWeight: FontWeight.w300,
//                                fontSize: widths / 30),
//                            ),
//                          ),
//                        ),
//                      );
//                  }),
//              ),
//            ),
//          Container(
//              height: hights -100,
//              margin: EdgeInsets.only(bottom: 50, top: 10, left: 15, right: 15),
//              child :
////              Center(
////                child: Image(
////                  image: AssetImage('lib/assets/loader_places.gif'),
////                  fit: BoxFit.cover,
////                  height: widths,
////                  ),
////                )
////                  :
//         ListView.builder(
//                  padding: EdgeInsets.only(
//                    bottom: 100,
//                    ),
//                  itemCount:10,
////                  Places_List.length == 0 ? 0 : Places_List.length,
//                  shrinkWrap: true,
//                  physics: ClampingScrollPhysics(),
//                  itemBuilder: (context, int index) {
////                    var locationlat =
////                    Places_List[index]['geometry']['location']['lat'];
////                    var locationlng =
////                    Places_List[index]['geometry']['location']['lng'];
////                    var p = 0.017453292519943295;
////                    var c = cos;
////                    var a = 0.5 -
////                        c((locationlat - Lat) * p) / 2 +
////                        c(Lat * p) *
////                            c(locationlat * p) *
////                            (1 - c((locationlng - Lang) * p)) /
////                            2;
////                    var tripDistance = (12742 * asin(sqrt(a)));
//                    return Card(
//                      child: InkWell(
//                        onTap: () {
////                          setState(() {
////                            PickedLocationMap = Places_List[index];
////                            PickedLocationMap['lat'] = Places_List[index]
////                            ['geometry']['location']['lat'];
////                            PickedLocationMap['lng'] = Places_List[index]
////                            ['geometry']['location']['lng'];
////                            DeliveryLocation = {};
////                          });
////                          DeliveryLocation.clear();
////                          Imagagepath=Imageupload="";
////                          PickedHour=0;
//                          Navigator.push(
//                            context,
//                            MaterialPageRoute(
//                                builder: (context) => MapPage()),
//                            );
//                          // Navigator.push(
//                          //   context,
//                          //   MaterialPageRoute(
//                          //       builder: (context) => MapPage()),
//                          // );
//                        },
//                        child: Container(
//                          decoration: BoxDecoration(
//                              borderRadius: BorderRadius.circular(4),
//                              border: Border.all(
//                                color: Colors.black12.withOpacity(0.05),
//                                )),
//                          child: Directionality(
//                            textDirection: TextDirection.rtl,
//                            child: ListTile(
//                              title: Text("اسم المتجر",
//                                              style: TextStyle(
//                                                  fontFamily: 'Cairo',
//                                                  fontWeight: FontWeight.w300,
//                                                  fontSize: widths / 29)),
//                              subtitle: Text(
//                               "العنوان بالتفصيل",
//                                style: TextStyle(
//                                    fontFamily: 'Cairo',
//                                    fontSize: widths / 33,
//                                    color: Color(0xff00BED6)),
//                                ),
//                              leading: Container(
//                                height: 55,
//                                width: 55,
//                                decoration: BoxDecoration(
//                                    color: Colors.white,
//                                    borderRadius: BorderRadius.circular(60),
//                                    border: Border.all(
//                                        color: Color(0xff00BED6))),
//                                child: Center(
//                                  child: Container(
//                                    width: 30,
//                                    height: 30,
//                                    child: Image.asset(
//                                      "assets/iconSuperMarket.png",
//                                      fit: BoxFit.fill,
//                                     // color: Color(0xff00BED6),
//                                      ),
//                                    ),
//                                  )
//                                ),
//                              trailing: Column(
//                                mainAxisAlignment:
//                                MainAxisAlignment.spaceBetween,
//                                children: [
//                                  Text(
//                                    "المسافة",
//                                    textAlign: TextAlign.center,
//                                    style: TextStyle(
//                                        fontSize: widths / 35,
//                                        fontFamily: 'Cairo',
//                                        fontWeight: FontWeight.bold,
//                                        color: Colors.black),
//                                    ),
//                                  Text(
//                                    (tripDistance * 1000).round() >= 1000
//                                        ? (tripDistance)
//                                        .toStringAsFixed(2) +
//                                        " كم "
//                                        : (tripDistance * 1000)
//                                        .toInt()
//                                        .toString() +
//                                        " م ",
//                                    textAlign: TextAlign.center,
//                                    style: TextStyle(
//                                        fontSize: widths / 38,
//                                        fontFamily: 'Cairo',
//                                        fontWeight: FontWeight.bold,
//                                        color: Colors.black),
//                                    ),
//                                ],
//                                ),
//                              ),
//                            ),
//                          ),
//                        ),
//                      );
//                  })),
//        ],
//        ),
//      );
//  }
//
//
////  Widget selectGovernment(){
////    double widths = MediaQuery.of(context).size.width;
////    double hights = MediaQuery.of(context).size.height;
////
////    return  Column(
////      children: [
////        Column(
////          children: [
////            Row(
////              textDirection: TextDirection.rtl,
////              children: [
////                SignupLabelTitle(Title: "أختر المحافظة"),
////              ],
////              ),
////            Directionality(
////              textDirection: TextDirection.rtl,
////              child: DropdownButton<String>(
////                value: GovValue,
////                icon: Icon(Icons.keyboard_arrow_down),
////                isExpanded: true,
////                iconSize: widths/20,
////                underline: Container(
////                  height: 0,
////                  color: Colors.transparent,
////                  ),
////                onChanged: (String newValue) {
////
////                  setState(() {
////                    GovValue = newValue;
////
////                  });
////
////                },
////                onTap: () {
////                  FocusScope.of(context)
////                      .requestFocus(FocusNode());
////                },
////                items: Govlist.map<DropdownMenuItem<String>>(
////                        (String value) {
////                      return DropdownMenuItem<String>(
////                        value: value,
////                        child: Row(
////                          textDirection: TextDirection.ltr,
////                          children: [
////                            Padding(
////                              padding: const EdgeInsets.only(
////                                  left: 8.0),
////                              child: Text(
////                                value,
////                                style: TextStyle(
////                                    fontSize:widths/26,
////                                    fontFamily: 'cairo',
////                                    fontWeight: FontWeight.bold,
////                                    color: Colors.black),
////                                ),
////                              ),
////                          ],
////                          ),
////                        );
////                    }).toList(),
////                ),
////              )
////          ],
////          ),
////
////    Column(
////    children: [
////    Row(
////    textDirection: TextDirection.rtl,
////    children: [
////    SignupLabelTitle(Title: "أختر المدينة"),
////    ],
////    ),
////    Directionality(
////    textDirection: TextDirection.rtl,
////    child: DropdownButton<String>(
////    value: AreaValue,
////    icon: Icon(Icons.keyboard_arrow_down),
////    isExpanded: true,
////    iconSize: widths/20,
////    underline: Container(
////    height: 0,
////    color: Colors.transparent,
////    ),
////    onChanged: (String newValue) {
////    setState(() {
////    var id1, id2, id3;
////    id1 = Countrylist.indexOf(CountryValue);
////    id2 = Govlist.indexOf(GovValue);
////    id3 = Arealist.indexOf(newValue);
////    print(Countrylistmaster[id1]['states']
////    [id2]['cities'][id3]);
////    Area_id = (Countrylistmaster[id1]
////    ['states'][id2]['cities'][id3]['id']);
////
////    AreaValue = newValue;
////    });
////    },
////    onTap: () {
////    FocusScope.of(context)
////        .requestFocus(FocusNode());
////    },
////    items: Arealist.map<DropdownMenuItem<String>>(
////    (String value) {
////    return DropdownMenuItem<String>(
////    value: value,
////    child: Row(
////    textDirection: TextDirection.ltr,
////    children: [
////    Padding(
////    padding: const EdgeInsets.only(
////    left: 8.0),
////    child: Text(
////    value,
////    style: TextStyle(
////    fontSize: widths/26,
////    fontFamily: 'cairo',
////    fontWeight: FontWeight.bold,
////    color: Colors.black),
////    ),
////    ),
////    ],
////    ),
////    );
////    }).toList(),
////    ),
////    )
////    ],
////    )]);
////  }
//
//  Widget SignupLabelTitle ({String Title}){
//    double widths=MediaQuery.of(context).size.width;
//    return Padding(
//      padding: const EdgeInsets.symmetric(horizontal: 14),
//      child: Text(Title,
//                    textAlign: TextAlign.right,
//                    style: TextStyle(
//                      fontSize: widths/35,
//                      fontFamily: 'cairo',
//                      fontWeight: FontWeight.bold,
//                      color: Colors.black,),
//                    overflow: TextOverflow.ellipsis,),
//      );
//  }
//
//
//
//}
