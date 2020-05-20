import 'package:covidapp/HomeScreens/HomePage/pages/Stored_Images/Image_Display.dart';
import 'package:covidapp/common_variables/app_colors.dart';
import 'package:covidapp/common_variables/app_fonts.dart';
import 'package:covidapp/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:covidapp/common_widgets/offline_widgets/offline_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ViewImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_ViewImage(),
    );
  }
}

class F_ViewImage extends StatefulWidget {
  @override
  _F_ViewImage createState() => _F_ViewImage();
}

class _F_ViewImage extends State<F_ViewImage> {
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
          padding: const EdgeInsets.fromLTRB(10, 60, 10, 0),
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
                  Text("Day 1",style: highlightDescription,),
                  Text("22 Oct 2020",style: bigTitleStyle),
                ],
              ),
              SizedBox(height: 20.0,),
              Text("Morning",style: highlight,),
              SizedBox(height: 10,),
              _buildImage1("images/p1.jpg"),
              SizedBox(height: 20.0,),
              Text("Afternoon",style: highlight,),
              SizedBox(height: 10,),
              _buildImage1("images/p2.jpg"),
              SizedBox(height: 20.0,),
              Text("Evening",style: highlight,),
              SizedBox(height: 10,),
              _buildImage1("images/p3.jpg"),
              SizedBox(height: 100,),

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
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                DisplayImage(
                ),
          ),
        );
      },
      padding: EdgeInsets.only(
        top: 5,
      ),
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black54, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
            height: 200.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: AssetImage(imgPath), fit: BoxFit.fill))),
      ),
    );
  }

}