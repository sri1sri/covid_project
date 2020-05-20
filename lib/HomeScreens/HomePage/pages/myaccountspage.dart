import 'package:covidapp/common_variables/app_fonts.dart';
import 'package:flutter/material.dart';

import '../bloc.navigation_bloc/navigation_bloc.dart';

class MyAccountsPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: Container(
            child: Padding(
              padding: EdgeInsets.only(top: 60),
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  children: <Widget>[
                    Container(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(height: 40,),
                            CircleAvatar(
                              backgroundImage: AssetImage("images/image2.jpg"),
                              radius: 80,
                            ),
                            SizedBox(height: 40,),
                            Text("Vasanthakumar VG",style: topNavigationBarTitleStyle,),
                            SizedBox(height: 15,),
                            Text("v.g.vasanthakumar@gmail.com",style: subTitleStyle,),
                            SizedBox(height: 40,),
                            subtext("Born On", "29 October 1996"),
                            subtext("Gender", "Male"),
                            subtext("Contents Posted", "13"),
                            subtext("Contents Viewed", "267")



                          ],
                        ),
                      ),
                    )

                  ],
                ),
              ),
            ),
          ),
      ),
    );
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
}
