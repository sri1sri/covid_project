import 'package:covidapp/common_variables/app_colors.dart';
import 'package:covidapp/common_variables/app_fonts.dart';
import 'package:covidapp/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:covidapp/common_widgets/offline_widgets/offline_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DisplayImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_DisplayImage(),
    );
  }
}

class F_DisplayImage extends StatefulWidget {
  @override
  _F_DisplayImage createState() => _F_DisplayImage();
}

class _F_DisplayImage extends State<F_DisplayImage> {
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
      backgroundColor: Colors.black,
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
                      child: Icon(Icons.arrow_back,size: 40,color: Colors.white,),
                      onTap: (){Navigator.pop(context, true);},
                    )
                  ],
                ),
              ),
              SizedBox(height: 20.0,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  SizedBox(height: 100.0,),
                  Container(
                      height: 400.0,
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
                ],
              ),

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
      child: Card(
        elevation: 20,
        shape: RoundedRectangleBorder(
          side: BorderSide(color: Colors.black54, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
            height: 250.0,
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                image: DecorationImage(
                    image: AssetImage(imgPath), fit: BoxFit.fill))),
      ),
    );
  }

}