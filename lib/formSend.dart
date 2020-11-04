import 'dart:async';
import 'dart:io';
import 'package:image/image.dart' as Img;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:payfromit/Constant/UpperConestant.dart';
import 'package:payfromit/Constant/listPlaces.dart';
import 'package:payfromit/home.dart';
import 'package:payfromit/mapLocted.dart';
import 'package:payfromit/model/government.dart';
import 'package:path/path.dart' as Path;

class FormApplication extends StatefulWidget {
  @override
  _FormApplicationState createState() => _FormApplicationState();
}

class _FormApplicationState extends State<FormApplication> {


  Completer<GoogleMapController> _controller = Completer();
  Future<File> _imageFile=null;
int CountImg=0;
bool loading=false;
bool checkPageSend=false;
  final _formKey = GlobalKey<FormState>();
List<String>imageUrl=[];

  @override
  void initState() {

    typeMarket=SelectPlace_arValue;



    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60.0),
        child: Directionality(
          textDirection: TextDirection.ltr,
          child: AppBar(
            title: Text("اشتري منه"),
            centerTitle: true,
            backgroundColor: Color(0xff00BED6),

            ),
          ),
        ),
      body:Form(
        key: _formKey,
        child: ListView(
          children: [
            Padding(
              padding:  EdgeInsets.only(top: 15,bottom: 10),
              child: selectGovernment(),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SignupLabelTitle(Title: "اسم المتجر"),
              ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                    ),
                ],
                ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  textDirection: TextDirection.rtl,
                  controller: name_controller,
                  cursorColor: Color(0xff00BED6),

                  validator: (value){
                    if(value.isEmpty){
                      return "يرجى التاكد من كتابة اسم المتجر";
                    }

                    else
                      return null;
                  },
                  decoration: new InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 0, horizontal: 8),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent, width: 0.0),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent, width: 0.0),
                          borderRadius: BorderRadius.circular(15)),
                      fillColor: Colors.black),
                  ),
                ),
              ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SignupLabelTitle(Title: "العنوان "),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 15,horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                    ),
                ],
                ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  keyboardType: TextInputType.text,
                  textDirection: TextDirection.rtl,
                  controller: address_controller,
                  cursorColor: Color(0xff00BED6),
                  maxLines: 8,
                  minLines: 4,
                  validator: (value){
                    if(value.isEmpty){
                      return "يرجى التاكد من كتابةالعنوان";
                    }
                    else
                      return null;
                  },
                  decoration: new InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 18, horizontal: 12),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent, width: 0.0),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent, width: 0.0),
                          borderRadius: BorderRadius.circular(15)),
                      fillColor: Colors.black),
                  ),
                ),
              ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SignupLabelTitle(Title: "رقم الهاتف "),
              ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 5,horizontal: 15),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                    ),
                ],
                ),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  textDirection: TextDirection.rtl,
                  controller: phone_controller,
                  cursorColor: Color(0xff00BED6),

                  validator: (value){
                    if(value.isEmpty){
                      return "يرجى التاكد من كتابة رقم المستلم";
                    }
                    else if(value.length < 11 ||
                        value.length > 11){
                      return "يرجى التاكد من رقم الهاتف";

                    }

                    else
                      return null;
                  },
                  decoration: new InputDecoration(
                      contentPadding: EdgeInsets.symmetric(
                          vertical: 0, horizontal: 8),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent, width: 0.0),
                          borderRadius: BorderRadius.circular(15)),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(
                              color: Colors.transparent, width: 0.0),
                          borderRadius: BorderRadius.circular(15)),
                      fillColor: Colors.black),
                  ),
                ),
              ),
            selectLocation(),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: SignupLabelTitle(Title: "إضافة صور المقاطعة"),
            ),

            SelectImg(),
            SizedBox(
              height: 10,
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    color:  loading
                        ?Colors.white:primarycolor,
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
                  height: 50,
                  margin: EdgeInsets.only(bottom: 10),
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: InkWell(
                    onTap: () async {

                      print( _formKey.currentState.validate());
                      if ( _formKey.currentState.validate()&&CountImg!=0) {
                        setState(() {
                          loading=true;
                        });
                        List<ImageUploadModel> imageSend = List<ImageUploadModel>();
                        imageUrl=[];
                        for(int index=0;index<images.length;index++){
                          if(images[index] is ImageUploadModel){
                            print("image index ${images[index]}");
                            imageSend.add(images[index]);
                            uploadFile(imageSend.last.imageFile,name_controller.text,index==images.length-1);
                          }
                        }



                      }


                     // images[index] is ImageUploadModel

                    },
                    child: Center(
                      child: loading
                          ? Image(
                        image: AssetImage(
                          'assets/loader.gif',
                          ),
                        fit: BoxFit.cover,
                        height: 300,
                        )
                          : Text(
                        "ارسال",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: width/25,
                            fontFamily: 'Almarai',
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                        ),
                      ),
                    ),
                  ),
              ],
            )


          ],
        ),
      ) ,
    );
  }

  Widget selectGovernment(){
    double widths = MediaQuery.of(context).size.width;
    double hights = MediaQuery.of(context).size.height;

    return  Padding(
      padding:  EdgeInsets.symmetric(horizontal: 15),
      child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Row(
                  textDirection: TextDirection.rtl,
                  children: [
                    SignupLabelTitle(Title: "اختر المحافظة"),
                  ],
                  ),
                Card(
                  elevation: 5,

                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: widths,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child:  DropdownButtonHideUnderline(
                        child: ButtonTheme(
                          alignedDropdown: true,
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
                                city=cityValue.id;
                                countryId=GovValue.id-1;
                                print(countryId);
                                print(cityValue.nameAr);
                                country=GovValue.id;



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
                        ),
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
                    SignupLabelTitle(Title: "اختر المدينة"),
                  ],
                  ),
                Card(
                  elevation: 5,
                  margin: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    width: widths-30,
                    child: Directionality(
                      textDirection: TextDirection.rtl,
                      child: DropdownButtonHideUnderline(
                          child: ButtonTheme(
                            alignedDropdown: true,
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
                                city=cityValue.id;
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
                        ),
                      ),
                    ),
                )
              ],
              ),
            selectTypeMarket(),


          ]),
      );
  }

  Widget selectTypeMarket(){
    double widths = MediaQuery.of(context).size.width;
    double hights = MediaQuery.of(context).size.height;

    return  Column(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        Row(
          textDirection: TextDirection.rtl,
          children: [
            SignupLabelTitle(Title: "أختر نوع المتجر"),
          ],
          ),
    Card(
    elevation: 5,
    margin: EdgeInsets.symmetric(vertical: 10),
    child: Container(
    width: widths-30,
    child: Directionality(
    textDirection: TextDirection.rtl,
    child: DropdownButtonHideUnderline(
    child: ButtonTheme(
    alignedDropdown: true,
              child: DropdownButton<String>(
                value: SelectPlace_arValue,
                icon: Icon(Icons.keyboard_arrow_down),

                isExpanded: true,
                iconSize: widths/20,
                underline: Container(
                  height: 0,
                  color: Colors.transparent,
                  ),
                onChanged: ( newValue) {
                  setState(() {

                    SelectPlace_arValue = newValue;
                    typeMarket=SelectPlace_arValue;
                  });
                },
                onTap: () {
                  FocusScope.of(context)
                      .requestFocus(FocusNode());
                },
                items: SelectPlace_ar.map<DropdownMenuItem<String>>(
                        ( value) {
                      return DropdownMenuItem<String>(
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
                                    value,
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
            ),
    )))
      ],
      );
  }

  Widget selectLocation(){
    double widths = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,

          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: SignupLabelTitle(Title: "موقع المتجر"),
            ),

          ],
          ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Card(
            elevation: 5,
            child: InkWell(
              onTap: () async {


                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => PickLocationOnMap(),
                  ));
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,

                children: [
                  Card(
                    color: Color(0xff00BED6),
                    elevation: 4,
                    child: Container(
                      padding: const EdgeInsets.all(4),

                      child: Center(
                        child: Icon(
                          Icons.add_location,
                          color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  Expanded(
                    child: new Container(
                      child: new Text(
                        marketLoction==null? "حدد موقع المتجر":"${nameLocation}-${subNameLocation}",
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.right,
                        style: new TextStyle(
                          fontSize: widths/30,
                          fontFamily: 'Almarai',
                          color: Color(0xff00BED6),
                          fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  Icon(
                    Icons.map_sharp,
                    color: Colors.transparent,
                    ),
                ],
                ),
              ),
          ),
        ),
//        checkValidateRow("تاكد من تحديد موقع التسليم",DeliveryLocationShipment.isEmpty,checkValidateShipment)
        SizedBox(
          height: 10,
          ),
//         DeliveryLocationShipment.isEmpty
//             ? SizedBox(
//           height: 0,
//         )
//             :

      ],
      );
  }

  Widget SignupLabelTitle ({String Title}){
    double widths=MediaQuery.of(context).size.width;
    return Text(Title,
                  textAlign: TextAlign.right,
                  style: TextStyle(
                    fontSize: widths/25,
                    fontFamily: 'Almarai',
                    fontWeight: FontWeight.bold,
                    color: Colors.black,),
                  overflow: TextOverflow.ellipsis,);
  }

  Widget SelectImg(){
    double widths=MediaQuery.of(context).size.width;

    return Column(
      children: [
        Container(
          width:widths ,
          height: 150,
          decoration: BoxDecoration(
              //color: primarycolor,
              borderRadius: BorderRadius.circular(30)),
          padding:
          EdgeInsets.symmetric(horizontal: 20, vertical: 5),
          child: buildGridView(),

        ),
        checkValidateRow("تاكد من اَضافة صورة على الاقل ",CountImg==0,checkPageSend)

      ],
    );
  }

  Widget buildGridView() {
    return GridView.count(
      shrinkWrap: true,
      crossAxisCount: 3,
      childAspectRatio: 1,
      children: List.generate(images.length, (index) {
        if (images[index] is ImageUploadModel) {
          ImageUploadModel uploadModel = images[index];
          return Card(
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: <Widget>[
                Image.file(
                  uploadModel.imageFile,
                  width: 300,
                  height: 300,
                  ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: InkWell(
                    child: Icon(
                      Icons.remove_circle,
                      size: 20,
                      color: Colors.red,
                      ),
                    onTap: () {
                      setState(() {
                        images.replaceRange(index, index + 1, ['Add Image']);
                        CountImg=CountImg-1;

                      });
                      print(CountImg);                    },
                    ),
                  ),
              ],
              ),
            );
        } else {
          return Card(
            child: IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                _onAddImageClick(index);
              },
              ),
            );
        }
      }),
      );
  }

  Future _onAddImageClick(int index) async {
    setState(() {
      _imageFile = ImagePicker.pickImage(source: ImageSource.gallery);
      getFileImage(index);
    });
  }

  void getFileImage(int index) async {
//    var dir = await path_provider.getTemporaryDirectory();

    _imageFile.then((file) async {
      file==null?
      print(CountImg)
      :setState(() {
        ImageUploadModel imageUpload = new ImageUploadModel();
        imageUpload.isUploaded = false;
        imageUpload.uploading = false;
        imageUpload.imageFile = file;
        imageUpload.imageUrl = '';
        images.replaceRange(index, index + 1, [imageUpload]);
        CountImg=CountImg+1;
      });
      print(CountImg);
    });
  }

  Widget checkValidateRow(String message,bool is_EmptyItem,bool checkPage){

    return  (checkPage&&is_EmptyItem)? Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(message,style: TextStyle(
              color: Colors.red
              ),),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8),
            child: Icon(Icons.error,color: Colors.red,),
          ),

        ],
        ),
    ):SizedBox(
      height: 0,
      width: 0,
      );
  }

  Future uploadFile(File image,String name,bool send) async {
    print("image index ${image}");
//
//    Img.Image image_temp = Img.decodeImage(image.readAsBytesSync());
//    Img.Image imageresize = Img.copyResize(image_temp,width: 800);
//    File resized_file = File('')
//      ..writeAsBytesSync(Img.encodeJpg(imageresize));
    StorageReference storageReference = FirebaseStorage.instance
        .ref()
        .child('Market/${Countrylist[country-1].nameEn}/${city}/${name}/${Path.basename(image.path)}}');
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;
    print('File Uploaded');
    storageReference.getDownloadURL().then((fileURL) {
      setState(() {
        imageUrl.add(fileURL);
      });

    }).whenComplete(() {
      print("imageUrl ${imageUrl}");
      Map<String,dynamic> bodysent = {
        'name':name_controller.text,
        'country': country,
        'city':city,
        'market_type': typeMarket,
        'address': address_controller.text,
        'phone':phone_controller.text,
        'Lat':marketLoction==null?null:marketLoction.latitude,
        'Lng':marketLoction==null?null:marketLoction.longitude,
        'images': imageUrl,
      };

      print("bodysent ${bodysent}");
      send? FirebaseFirestore.instance
          .collection("Markets")
          .doc('${Countrylist[country-1].nameEn}&${city}&${typeMarket}&${name}&${DateTime.now()}&')
          .setData(bodysent).whenComplete(() {
        setState(() {
          loading = false;
          marketLoction=null;
          imageUrl=[];
          phone_controller.text="";
          address_controller.text="";
          name_controller.text="";
          images = List<Object>();
          images.add("Add Image");
          images.add("Add Image");
          images.add("Add Image");
          Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Home(),));

        }
                 );
      }
                                          ):null;

    });

  }
}






