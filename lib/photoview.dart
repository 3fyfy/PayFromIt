import 'package:flutter/material.dart';
import 'package:payfromit/Constant/UpperConestant.dart';
import 'package:photo_view/photo_view.dart';

class PhotoViewPage extends StatelessWidget {
  final String img;

  const PhotoViewPage({Key key, this.img}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading:IconButton(icon: Icon(Icons.close,color: primarycolor,size: 30,),onPressed: (){
          Navigator.of(context).pop();
        },) ,

      ),
      body: Container(
          child: PhotoView(
            imageProvider: NetworkImage(img),
            backgroundDecoration: BoxDecoration(
                color: Colors.white
                ),
            )
          ),
    );
  }
}