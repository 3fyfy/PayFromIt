import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:geolocator/geolocator.dart';
import 'package:payfromit/Constant/UpperConestant.dart';
import 'package:payfromit/Constant/listPlaces.dart';
import 'package:payfromit/ListDrawer.dart';
import 'package:payfromit/information.dart';
import 'package:payfromit/map.dart';
import 'package:payfromit/model/government.dart';
import 'package:payfromit/photoview.dart';
import 'package:share/share.dart';


class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
 int Catigory_marker = 0;
 var tripDistance=100;

 int show=-1;
 ScrollController _scrollController = ScrollController();
 List<DocumentSnapshot> _products=[];
 DocumentSnapshot _lastDocument;
 int morelimit=5;

 bool _loadingProducts=true;
 bool loading_more=true;

 final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  void initState() {
    Catigory_marker = 0;
//    getLocation();
//    _scrollController.addListener(() {
//      double maxScroll=_scrollController.position.maxScrollExtent;
//      double currentScroll=_scrollController.position.pixels;
//      double delta=MediaQuery.of(context).size.height*.25;
//      if (_scrollController.position.pixels ==
//          _scrollController.position.maxScrollExtent){
//      }
//    });
    // TODO: implement initState
    super.initState();
  }

// getLocation()async{
//   Position position = await Geolocator()
//       .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
//   Lat = position.latitude;
//   Lang = position.longitude;
// }
  @override
  Widget build(BuildContext context) {
    double widths = MediaQuery.of(context).size.width;

    print(Lat);
    print(Lang);
    return  Scaffold(
      key: _scaffoldKey,

      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: AppBar(
            title: Text("اشتري منه"),
            centerTitle: true,
            backgroundColor: Color(0xff00BED6),
            actions: [
              IconButton(icon: Icon(Icons.menu), onPressed: (){
                _scaffoldKey.currentState.openEndDrawer();

              })
            ],

          ),
        ),
      ),
      body: Directionality(
        textDirection: TextDirection.ltr,
        child: Container(
            width: double.infinity,
            height: double.infinity,
            color: Colors.white,
            child:HomeTab(context)),
      ),

      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Information(),));
          // Add your onPressed code here!
        },
        label: Text('اتبع سنته',style: TextStyle(fontSize: 20),),
       // icon: Image(image: AssetImage("asset/supermrket.png"),),
        backgroundColor: primarycolor,
        ),

      endDrawer: DrawerList(),
    );
  }

  SingleChildScrollView HomeTab(BuildContext context) {
    double widths = MediaQuery.of(context).size.width;
    double hights = MediaQuery.of(context).size.height;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [

          Padding(
            padding:  EdgeInsets.only(top: 15,bottom: 10),
            child: selectGovernment(),
          ),
          Column(
            children: [
              Divider(
                height: 1,
                color: Colors.grey,
                endIndent: 15,
                indent: 15,
                ),
              SizedBox(
                height: 15,
                ),
            ],
            ),
         // Divider(),

          Padding(
            padding: const EdgeInsets.only(right: 23.0, bottom: 5),
            child: Text(
              "المتاجر المقاطِعة",
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: 'Almarai',
                  fontWeight: FontWeight.w300,
                  fontSize: widths / 25),
              ),
            ),
          Padding(
            padding: const EdgeInsets.only(right: 15.0, left: 15.0),
            child: SizedBox(
              height: 30,
              child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  shrinkWrap: true,
                  reverse: true,
                  itemCount: Place_ar[0] == null ? 0 : Place_ar.length,
                  itemBuilder: (context, int index) {
                    return InkWell(
                      onTap: () async {


                     setState(() {
                          Catigory_marker = index;

                        });
                      },
                      child: Container(
                       // height: 200,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Catigory_marker == index
                              ? Color(0xff00BED6)
                              : Color(0xffEEEEEE).withOpacity(0.5),
                          ),
                        margin: EdgeInsets.only(left: 8.0),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 0, horizontal: 20),
                          child: Text(
                            Place_ar[index].toString(),
                            textAlign: TextAlign.center,
                            style: TextStyle(
                                color: Catigory_marker == index
                                    ? Colors.white
                                    : Color(0xff00BED6),
                                fontFamily: 'Almarai',
                                fontWeight: FontWeight.w300,
                                fontSize: widths / 30),
                            ),
                          ),
                        ),
                      );
                  }),
              ),
            ),
          Container(

              margin: EdgeInsets.only(bottom: 50, top: 10, left: 15, right: 15),
              child :
              StreamBuilder<QuerySnapshot>(
                  stream: Catigory_marker==0?Firestore.instance.collection('Markets').where("country", isEqualTo:GovValue.id)
        .where("city", isEqualTo: cityValue.id)
        .snapshots():Firestore.instance.collection('Markets').where("country", isEqualTo:GovValue.id)
        .where("city", isEqualTo: cityValue.id).where("market_type", isEqualTo:Place_ar[Catigory_marker])
        .snapshots(),
                  //Place_ar
                  builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
                    if (!snapshot.hasData) return Center(child: CircularProgressIndicator(backgroundColor: Colors.black26,));
                    else {
                      var data=snapshot.data.documents;

                      return ListView.builder(
                    controller: _scrollController,
                      padding: EdgeInsets.only(
                        bottom: 100,
                        ),
                      itemCount:data.length,
//                  Places_List.length == 0 ? 0 : Places_List.length,
                      shrinkWrap: true,
                      physics: ClampingScrollPhysics(),
                      itemBuilder: (context, int index) {
                        return AnimationConfiguration.staggeredList(
                            position: index,
                            duration: const Duration(milliseconds: 150),
                        child: SlideAnimation(
                        horizontalOffset: 20,
                        verticalOffset: 50.0,
                        child: FadeInAnimation(
                        child:itemMarket(data[index]['name'],data[index]['address'],data[index]['images'],data[index]['Lat'],data[index]['Lng'],data[index]['market_type'],index))
                        ));
                      });

                    };
                }
              )),
        ],
        ),
      );
  }


  Widget selectGovernment(){
    double widths = MediaQuery.of(context).size.width;
    double hights = MediaQuery.of(context).size.height;

    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [

      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
      children: [
      Row(
      textDirection: TextDirection.rtl,
      children: [
      SignupLabelTitle(Title: "اختر المدينة"),
      ],
      ),
      Container(
        width: widths/3,
        child: Directionality(
        textDirection: TextDirection.rtl,
        child: DropdownButton<Cities>(
        value: cityValue,
        icon: Icon(Icons.keyboard_arrow_down),

        isExpanded: true,
        iconSize: widths/20,
        underline: Container(
        height: 0,
        color: Colors.transparent,
        ),
        onChanged: ( newValue) {
        setState(() {

        cityValue = newValue;
        });
        },
        onTap: () {
        FocusScope.of(context)
            .requestFocus(FocusNode());
        },
        items: Countrylist[countryId].cities.map<DropdownMenuItem<Cities>>(
        ( value) {
        return DropdownMenuItem<Cities>(
        value: value,
        child:  Directionality(
          textDirection:  TextDirection.rtl,
          child: Row(
           // textDirection: TextDirection.ltr,
          children: [
          Padding(
          padding: const EdgeInsets.only(
          left: 8.0),
          child: Container(
            alignment: Alignment.centerRight,
            child: Text(
            value.nameAr,
            style: TextStyle(
            fontSize: widths/26,
            fontFamily: 'Almarai',
            fontWeight: FontWeight.bold,
            color: Colors.black,
            ),
            ),
          ),
          ),
          ],
          ),
        ),
        );
        }).toList(),
        ),
        ),
      )
      ],
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            textDirection: TextDirection.rtl,
            children: [
              SignupLabelTitle(Title: "اختر المحافظة"),
            ],
            ),
          Container(
            width: widths/3,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: DropdownButton<Governmet>(
                value: GovValue,
                icon: Icon(Icons.keyboard_arrow_down),

                isExpanded: true,
                iconSize: widths/20,
                underline: Container(
                  height: 0,
                  color: Colors.transparent,
                  ),

                onChanged: (newValue) {

                  setState(() {
                    GovValue = newValue;
                    cityValue=Countrylist[GovValue.id-1].cities[0];
                    countryId=GovValue.id-1;
                    print(countryId);
                    print(cityValue.nameAr);



                  });

                },
                onTap: () {
                  FocusScope.of(context)
                      .requestFocus(FocusNode());
                },
                items: Countrylist.map<DropdownMenuItem<Governmet>>(
                        (value) {
                      return DropdownMenuItem<Governmet>(
                        value: value,
                        child: Directionality(
                          textDirection:  TextDirection.rtl,
                          child: Row(
                            // textDirection: TextDirection.ltr,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(
                                    left: 8.0),
                                child: Text(
                                  value.nameAr,
                                  style: TextStyle(
                                      fontSize:widths/26,
                                      fontFamily: 'Almarai',
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black),
                                  ),
                                ),
                            ],
                            ),
                          ),
                        );
                    }).toList(),
                ),
              ),
            )
        ],
        ),

        ]),
    );
  }

  Widget SignupLabelTitle ({String Title}){
    double widths=MediaQuery.of(context).size.width;
    return Text(Title,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: widths/35,
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,),
                  overflow: TextOverflow.ellipsis,);
  }


Widget itemMarket(String title,String subTitle,List<dynamic>imageUrl,double lat,double lang,String typeMarke,int index){
  double widths=MediaQuery.of(context).size.width;


  return Card(
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
            border: Border.all(
              color: Colors.black12.withOpacity(0.05),
              )),
        child: Directionality(
          textDirection: TextDirection.rtl,
          child: ListTile(
            title: Row(
              children: [
                Expanded(
                  flex:1,
                  child: Container(
                    padding: const EdgeInsets.all(2),

                    child: Image.asset("assets/supermarket.png",width: 20,color: primarycolor,)
                    ),
                ),
                Expanded(
                  flex:8,
                  child: Text(title,
                                  style: TextStyle(
                                      fontFamily: 'Almarai',
                                      fontWeight: FontWeight.w300,
                                      fontSize: widths / 25)),
                ),
              ],
            ),
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [

                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: Text(
                   "${subTitle}",
                    style: TextStyle(
                        fontFamily: 'Almarai',
                        fontSize: widths / 33,
                        color: Color(0xff00BED6)),
                    maxLines:show==index?null:2,
                    ),
                ),
                show==index?Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InkWell(
                    onTap: (){
                      lat==null||lang==null?null: Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => MapPage(lat,lang,title,typeMarke)),
                        );

                    },
                    child: Card(
                      color:lat==null||lang==null?Colors.black26:primarycolor,
                      elevation:lat==null||lang==null?0: 5,
                      child: Row(
                        children: [
                          Container(
                           // padding: const EdgeInsets.all(2),

                            child: Icon(
                              Icons.location_on,
                              color: Colors.white,
                              ),
                            ),
                          Expanded(
                            child: Text(" الموقع الجغرافي المتجر",style: TextStyle(
                                     fontFamily: 'Almarai',
                                     fontSize: widths / 30,
                                    // decoration: TextDecoration.underline,
                                     color: Colors.white),),
                          )
                        ],
                      ),
                    ),
                  ),
                ):EmptyWidgt(),

                show==index?Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5),
                  child: InkWell(
                    onTap: (){
                      Share.share("قرر ${title} مقاطعة المنتجات الفرنسية .\n العنوان : ${subTitle}\nلو ساكن قريب اشتري منه، ولو تعرف اصحابك ساكنين قريب منشنهم في التعليقات وشجعهم إنهم يشتروا منه.\n #اشتري_منه");

                    },
                    child: Card(
                      color:primarycolor ,
                      elevation: 5,
                      child: Row(
                        children: [
                          Container(
                            // padding: const EdgeInsets.all(2),

                            child: Icon(
                              Icons.share,
                              color: Colors.white,
                              ),
                            ),
                          Expanded(
                            child: Text("شارك المتجر مع اصدقائك",style: TextStyle(
                                fontFamily: 'Almarai',
                                fontSize: widths / 30,
                                // decoration: TextDecoration.underline,
                                color: Colors.white),),
                          )
                        ],
                        ),
                      ),
                    ),
                ):EmptyWidgt(),

                show==index?Container(
                  width: widths,
                  height: 100,
                  child: buildGridView(imageUrl),
                ):EmptyWidgt()

              ],
            ),
            leading: Container(
                height: 55,
                width: 55,
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(60),
                    border: Border.all(
                        color: Color(0xff00BED6))),
                child: Center(
                  child: Container(
                    width: 30,
                    height: 30,
                    child: Image.asset(
                      "assets/iconSuperMarket.png",
                      fit: BoxFit.fill,
                      // color: Color(0xff00BED6),
                      ),
                    ),
                  )
                ),
            trailing:InkWell(
              onTap: (){
                setState(() {

                  if(show==index){
                    show=-1;
                  }
                  else{
                    show=index;

                  }
                  //  show==index?-1:index;
                });
                print(index);
                print(show);
              },
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                       Icon( show==index?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down),
                ],
              ),
            )
            ),
          ),
        ),
      );
}


  Widget buildGridView(List<dynamic>imageUrl) {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(imageUrl.length, (index) {
         // ImageUploadModel uploadModel = images[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            child: InkWell(
              onTap: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => PhotoViewPage(img:imageUrl[index]),));
              },
              child: Container(
                width: 100,
                height: 100,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(imageUrl[index]),
                    fit: BoxFit.cover
                  )
                ),

              ),
            ),
            );

      }),
      );
  }

  Widget EmptyWidgt(){
    return SizedBox(
      height: 0,
      width: 0,
    );
  }

}
