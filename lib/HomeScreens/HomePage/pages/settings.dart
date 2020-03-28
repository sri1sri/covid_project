import 'package:covidapp/HomeScreens/EditProfile.dart';
import 'package:covidapp/HomeScreens/SettingsOptions/how_to_use.dart';
import 'package:covidapp/HomeScreens/SettingsOptions/privacy_policy.dart';
import 'package:covidapp/HomeScreens/SettingsOptions/terms_conditions.dart';
import 'package:covidapp/common_variables/app_fonts.dart';
import 'package:covidapp/common_widgets/offline_widgets/offline_widget.dart';
import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

//class SettingsPage extends StatelessWidget with NavigationStates {
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//      child: Center(
//          child: SingleChildScrollView(
//            child: Container(
//              child: Padding(
//                padding: EdgeInsets.only(top: 100),
//                child: Column(
//                  children: <Widget>[
//                    Text("Settings",style: bigTitleStyle,),
//                    Container(
//                      height: 900,
//                    )
//
//                  ],
//                ),
//              ),
//            ),
//          )
//      ),
//    );
//  }
//}

class SettingsPage extends StatelessWidget with NavigationStates{

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_SettingsPage(),
    );
  }
}

class F_SettingsPage extends StatefulWidget {

  @override
  _F_SettingsPageState createState() => _F_SettingsPageState();
}

class _F_SettingsPageState extends State<F_SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return offlineWidget( context );
  }

  Widget offlineWidget(BuildContext context) {
    return CustomOfflineWidget(
      onlineChild: Padding(
        padding: const EdgeInsets.fromLTRB( 0,0,0,0 ),
        child: Scaffold(
          body: _buildContent( context ),
        ),
      ),

    );
  }

  Widget _buildContent(BuildContext context) {
    return SingleChildScrollView(
      child: Center(

        child:
        Column(
          children: <Widget>[
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB( 10,100,10,0 ),
                child: Column(
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text("Settings",style: bigTitleStyle),
                        SizedBox(height: 15.0,),
                      ],
                    ),
                    SizedBox(height: 20.0,),
                    _editProfile(),
                    _reportAnIssue( ),
                    _howToUse( ),
                    _privacyPolicy( ),
                    _termsAndConditions( ),
                  ],
                ),
              ),
            ),
            Container(
              child: Padding(
                padding: EdgeInsets.fromLTRB( 30,20,30,20 ),
                child: Column(

                  children: <Widget>[
                    Text(
                      'Version 1.0.0',
                      style: TextStyle(
                        color: Colors.black45,
                        fontFamily: 'Montserrat',
                        fontSize: 15.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),


                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _reportAnIssue() {
    return Container(
      width: double.infinity,
      child: FlatButton(
        onPressed: () => print( 'Report an Issue Button Pressed' ),
        padding: EdgeInsets.all( 15.0 ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular( 0.0 ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text( 'Report an Issue',
                  style: TextStyle(
                    color: Colors.black87,
                    letterSpacing: 1.5,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    //fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],

            ),
            Column(
              children: <Widget>[
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black54,
                  size: 30,
                ),
              ],

            ),

          ],

        ),
      ),

    );
  }
  Widget _editProfile() {
    return Container(
      width: double.infinity,
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EditProfilePage( ) ),
          );
        },
        padding: EdgeInsets.all( 15.0 ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular( 0.0 ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text( 'Edit Profile',
                  style: TextStyle(
                    color: Colors.black87,
                    letterSpacing: 1.5,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    //fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],

            ),
            Column(
              children: <Widget>[
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black54,
                  size: 30,
                ),
              ],

            ),

          ],

        ),
      ),

    );
  }
  Widget _privacyPolicy() {
    return Container(
      width: double.infinity,
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => PrivacyPolicy( ) ),
          );
        },
        padding: EdgeInsets.all( 15.0 ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular( 0.0 ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[
                Text( 'Privacy Policy',
                  style: TextStyle(
                    color: Colors.black87,
                    letterSpacing: 1.5,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    //fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],

            ),
            Column(
              children: <Widget>[
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black54,
                  size: 30,
                ),
              ],

            ),

          ],

        ),
      ),

    );
  }

  Widget _howToUse() {
    return Container(
      width: double.infinity,
      child: FlatButton(

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => HowToUse( ) ),
          );
        },

        padding: EdgeInsets.all( 15.0 ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular( 0.0 ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[

                Text( 'How To Use',
                  style: TextStyle(
                    color: Colors.black87,
                    letterSpacing: 1.5,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    //fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],

            ),
            Column(
              children: <Widget>[
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black54,
                  size: 30,
                ),
              ],

            ),

          ],

        ),
      ),

    );
  }

  Widget _termsAndConditions() {
    return Container(
      width: double.infinity,
      child: FlatButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => TermsAndServices( ) ),
          );
        },
        padding: EdgeInsets.all( 15.0 ),

        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular( 0.0 ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Column(
              children: <Widget>[

                Text( 'Terms & Conditions',
                  style: TextStyle(
                    color: Colors.black87,
                    letterSpacing: 1.5,
                    fontSize: 18.0,
                    fontWeight: FontWeight.w600,
                    //fontWeight: FontWeight.bold,
                    fontFamily: 'Montserrat',
                  ),
                ),
              ],

            ),
            Column(
              children: <Widget>[
                Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.black54,
                  size: 30,
                ),
              ],

            ),

          ],

        ),
      ),

    );
  }
}