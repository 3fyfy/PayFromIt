import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:payfromit/ListDrawer.dart';

class boycott extends StatefulWidget {
  @override
  _boycottState createState() => _boycottState();
}

class _boycottState extends State<boycott> {

  int show=-1;

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
              title: Text("قائمة المقاطعة"),
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
                SizedBox(height: 50,),
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
                      image: DecorationImage(image: AssetImage('assets/boycott-france.jpg'),fit: BoxFit.contain)
                      ),
                    width: 150,
                    height: 150,
                    ),
                  ),


                SizedBox(
                  height: 50,
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
                  padding: EdgeInsets.symmetric(horizontal: 10,vertical: 5),
                  child: StreamBuilder<QuerySnapshot>(
                  stream:Firestore.instance.collection('ListBoyCotts').snapshots(),
    //Place_ar
    builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
      if (!snapshot.hasData)
        return  Center(child: CircularProgressIndicator(backgroundColor: Colors.black26,));
      else {
        var data = snapshot.data.docs;
        print(data[0]);

        return Column(
            children:[
        for (int index=0;index<data.length;index++) ...[
          Card(
                child: Padding(
                  padding: const EdgeInsets.only(
                      right: 10, top: 2, bottom: 2, left: 0
                      ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(icon: Icon(show==index?Icons.keyboard_arrow_up:Icons.keyboard_arrow_down
                                                ),
                                       onPressed: () {
    setState(() {
      show ==index?show=-1:show=index;
      });
      },
                                       padding: EdgeInsets.all(0
                                                               ),
                                     ),
                          Expanded(
                            // flex: 3,
                            child: Text(data[index]['title'], style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.bold,
                              ), textAlign: TextAlign.end, maxLines: 2,
                                        )
                            ),

                          //Icons.keyboard_arrow_up:
                        ],
                        ),
      show==index?Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 0
                            ),
                        child: Column(
                          children: [   for (var list in data[index]['subtitle'])
                             Padding(
                              padding: const EdgeInsets.symmetric(vertical: 2),
                              child: Text(list.toString(), style: TextStyle(
                                  fontSize: 18, height: 1.5
                                  ),
                                          ),
                              )
                         ] )


                          ):SizedBox(
      height: 0,
      width: 0,
      ),

                    ],
                    ),
                  ),
                )


          ]
      ]
      );
      }
    }
    )
    )
    ]
    )
              ),
            ),

      ));
  }

}
