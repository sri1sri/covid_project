import 'package:covidapp/HomeScreens/HomePage/pages/Stored_Images/View_Image.dart';
import 'package:covidapp/common_variables/app_colors.dart';
import 'package:covidapp/common_variables/app_fonts.dart';
import 'package:covidapp/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:covidapp/common_widgets/offline_widgets/offline_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DaySelection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_DaySelection(),
    );
  }
}

class F_DaySelection extends StatefulWidget {
  @override
  _F_DaySelection createState() => _F_DaySelection();
}

class _F_DaySelection extends State<F_DaySelection> {
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
                  Text("Star Pond",style: highlightDescription,),
                  Text("Day Selection",style: bigTitleStyle),
                ],
              ),
              SizedBox(height: 20.0,),
              SizedBox(height: 10,),
              _Notificationcard(1,"22 October 2020"),
              _Notificationcard(2,"23 October 2020"),
              _Notificationcard(3,"24 October 2020"),
              _Notificationcard(4,"25 October 2020"),
              SizedBox(height: 20,),

            ],
          ),
        ),
      ),

    );
  }

  _Notificationcard(int day,String date)
  {
    return GestureDetector(
      onTap: (){
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) =>
                ViewImage(
                ),
          ),
        );
      },
      child: Card(
        elevation: 8,
        child: Container(
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text("Day $day",style: topNavigationBarTitleStyle,),
                SizedBox(height: 5,),
                Text(date,style: titleStyleTheam,),
              ],
            ),
          ),
        ),
      ),
    );

  }

}