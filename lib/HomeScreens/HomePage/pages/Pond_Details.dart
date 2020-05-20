import 'package:covidapp/common_variables/app_colors.dart';
import 'package:covidapp/common_variables/app_fonts.dart';
import 'package:covidapp/common_variables/app_functions.dart';
import 'package:covidapp/common_widgets/button_widget/to_do_button.dart';
import 'package:covidapp/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:covidapp/common_widgets/offline_widgets/offline_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'EnterValuesPage.dart';
import 'Flush_screen.dart';

class PondDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_PondDetails(),
    );
  }
}

class F_PondDetails extends StatefulWidget {
  @override
  _F_PondDetails createState() => _F_PondDetails();
}

class _F_PondDetails extends State<F_PondDetails> {
  int _n = 0;
  @override
  Widget build(BuildContext context) {
    return offlineWidget(context);

  }

  Widget offlineWidget (BuildContext context){
    return CustomOfflineWidget(
      onlineChild: Padding(
        padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
        child: Scaffold(
          body: _buildContent(context),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {
    return Scaffold(
      body: Container(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(15, 60, 15, 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                      child: Icon(Icons.arrow_back,size: 40,color: subBackgroundColor,),
                      onTap: (){Navigator.pop(context, true);},
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Pond Star",style: bigTitleStyle),
                ],
              ),
              SizedBox(height: 15.0,),
              Text(
                "A pond is an area filled with water, either natural or artificial, that is smaller than a lake. It may arise naturally in floodplains as part of a river system.",
                style: descriptionStyle,
              ),
              Container(
                  height: 282.0,
                  child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        _buildImage1(
                          'images/p1.jpg',
                        ),
                        _buildImage1(
                          'images/p2.jpg',
                        ),
                        _buildImage1(
                          'images/p3.jpg',
                        ),
                        _buildImage1(
                          'images/p4.jpg',
                        ),
                      ])),
              subtext("Pond Name", "Star Pond"),
              subtext("Incharge Name", "Vasanth"),
              subtext("Pond Size", "30311sq.ft"),
              subtext("Pond Value", "₹ 30,50,232.00"),
              subtext("Location", "Coimbatore"),
              subtext("Pond Type", "Vernal pool"),
              subtext("Condition", "Maintained well with water"),
              SizedBox(height: 25.0,),
              ToDoButton(
                  assetName: 'images/google-lodgo.png',
                  text: 'Enter Values',
                  textColor: activeButtonTextColor,
                  backgroundColor: backgroundColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => EnterFeedValues(),),
                    );
                  }
              ),
              SizedBox(height: 10.0,),
              ToDoButton(
                  assetName: 'images/google-lodgo.png',
                  text: 'Flush Pond',
                  textColor: activeButtonTextColor,
                  backgroundColor: subBackgroundColor,
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FlushImage(),),
                    );
                  }
              ),
              SizedBox(height: 100.0,),
            ],
          ),
        ),
      ),

    );

  }
  _buildImage1(
      String imgPath,
      ) {
    return FlatButton(
      onPressed: () {
        print(imgPath);
      },
      padding: EdgeInsets.only(
        top: 5,
      ),
      child: Container(
          height: 230,
          width: 350,
          child: Column(children: <Widget>[
            Stack(children: [
              Container(
                height: 230.0,
              ),
              Positioned(
                  left: 10.0,
                  right: 10.0,
                  top: 5.0,
                  bottom: 30.0,
                  child: Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black54, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                        height: 120.0,
                        width: 220.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage(imgPath), fit: BoxFit.fill))),
                  )),
            ]),
          ])),
    );
  }
}

Widget subtext(String _left, String _right) {
  return Padding(
    padding: const EdgeInsets.all(10.0),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Text(
            '$_left :',
            style: subTitleStyle
        ),
        Text(
            '$_right',
            style: descriptionStyleDarkBlur
        ),
      ],
    ),
  );
}