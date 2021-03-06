//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidapp/AuthenticationScreens/Verify_Otp.dart';
import 'package:covidapp/AuthenticationScreens/signup_screen.dart';
import 'package:covidapp/HomeScreens/HomePage/sidebar/sidebar_layout.dart';
import'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:covidapp/AuthenticationScreens/Verify_Otp.dart';
//import 'package:covidapp/Models/phone_number_page_model.dart';
import 'package:covidapp/common_variables/app_colors.dart';
import 'package:covidapp/common_variables/app_fonts.dart';
import 'package:covidapp/common_variables/app_functions.dart';
import 'package:covidapp/common_widgets/button_widget/to_do_button.dart';
import 'package:covidapp/common_widgets/offline_widgets/offline_widget.dart';
import 'package:covidapp/common_widgets/platform_alert/platform_exception_alert_dialog.dart';
//import 'package:covidapp/firebase/auth.dart';

import 'package:provider/provider.dart';

class PhoneNumberPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_PhoneNumberPage(),
    );
  }
}

class F_PhoneNumberPage extends StatefulWidget {
 // F_PhoneNumberPage({@required this.model});
  //final PhoneNumberModel model;

//  static Widget create(BuildContext context) {
//    final AuthBase auth = Provider.of<AuthBase>(context);
//    return ChangeNotifierProvider<PhoneNumberModel>(
//      create: (context) => PhoneNumberModel(auth: auth),
//      child: Consumer<PhoneNumberModel>(
//        builder: (context, model, _) => F_PhoneNumberPage(model: model),
//      ),
//    );
//  }


  @override
  _F_PhoneNumberPageState createState() => _F_PhoneNumberPageState();
}

class _F_PhoneNumberPageState extends State<F_PhoneNumberPage> {

  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();
  final TextEditingController _passwordController = TextEditingController();
  final FocusNode _passwordFocusNode = FocusNode();
//  PhoneNumberModel get model => widget.model;

  Future<bool> didCheckPhoneNumber;

  @override
  void dispose() {
    _emailController.dispose();
    _emailFocusNode.dispose();
    _passwordController.dispose();
    _passwordFocusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return offlineWidget(context);
  }

  Widget offlineWidget (BuildContext context) {
    return CustomOfflineWidget(
      onlineChild: Padding(
        padding: const EdgeInsets.fromLTRB( 0, 0, 0, 0 ),
        child: Scaffold(
          body:_buildContent( context ),
        ),
      ),
    );
  }

  Widget _buildContent(BuildContext context) {

    return Scaffold(
      body:Padding(
        padding: const EdgeInsets.only(top:80.0,bottom: 20,left: 20,right: 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              child: Row(
                children: <Widget>[
                  GestureDetector(
                    child: Icon(Icons.arrow_back,size: 40,),
                    onTap: (){Navigator.pop(context, true);},
                  )
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Login",style: bigTitleStyle,),
                  SizedBox(height: 15.0,),
                  Text("Please enter your Email & Password to continue.",style: descriptionStyleDarkBlur,),
                ],
            ),

            Column(
              children: <Widget>[
                SizedBox(height: 20.0,),
                Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0XFFEFF3F6),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                offset: Offset(3, 3),
                                blurRadius: 2.0,
                                spreadRadius: 2.0
                            ),
                            BoxShadow(
                                color: Color.fromRGBO(255, 255, 255, 0.9),
                                offset: Offset(-6, -2),
                                blurRadius: 2.0,
                                spreadRadius: 3.0
                            )
                          ]
                      ),
                      child: new TextFormField(
                        controller: _emailController,
                        textInputAction: TextInputAction.done,
                        obscureText: false,
                        focusNode: _emailFocusNode,
                        //onEditingComplete: () => _imageUpload(),
                        // onChanged: model.updateUsername,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.mail,
                            color: subBackgroundColor,
                          ),
                          labelText: "Enter your Email",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "Email cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.number,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20.0,),
                Column(
                  children: <Widget>[
                    Container(
                      decoration: BoxDecoration(
                          color: Color(0XFFEFF3F6),
                          borderRadius: BorderRadius.circular(10.0),
                          boxShadow: [
                            BoxShadow(
                                color: Color.fromRGBO(0, 0, 0, 0.1),
                                offset: Offset(3, 3),
                                blurRadius: 2.0,
                                spreadRadius: 2.0
                            ),
                            BoxShadow(
                                color: Color.fromRGBO(255, 255, 255, 0.9),
                                offset: Offset(-6, -2),
                                blurRadius: 2.0,
                                spreadRadius: 3.0
                            )
                          ]
                      ),
                      child: new TextFormField(
                        controller: _passwordController,
                        textInputAction: TextInputAction.done,
                        obscureText: false,
                        focusNode: _passwordFocusNode,
                        //onEditingComplete: () => _imageUpload(),
                        //onChanged: model.updateUsername,
                        decoration: new InputDecoration(
                          prefixIcon: Icon(
                            Icons.lock,
                            color: subBackgroundColor,
                          ),
                          labelText: "Enter your Password",
                          border: new OutlineInputBorder(
                            borderRadius: new BorderRadius.circular(5.0),
                            borderSide: new BorderSide(),
                          ),
                        ),
                        validator: (val) {
                          if (val.length == 0) {
                            return "Password cannot be empty";
                          } else {
                            return null;
                          }
                        },
                        keyboardType: TextInputType.text,
                        style: new TextStyle(
                          fontFamily: "Poppins",
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 30.0,),
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(child: Text(""),),
                    GestureDetector(
                      child: Container(
                        width: 200,
                        padding: EdgeInsets.all(15.0),
                        child: Center(
                            child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Container(),
                             Text("Log In",style: subTitleStyleWhite),
                              Icon(Icons.arrow_forward,color: Colors.white,),
                              Container(),
                        ])),
                        decoration: BoxDecoration(
                            color: backgroundColor,
                            borderRadius: BorderRadius.circular(100.0),
                            boxShadow: [
                              BoxShadow(
                                  color: subBackgroundColor,
                                  offset: Offset(2,1),
                                  blurRadius: 1.0,
                                  spreadRadius: 1.0
                              ),

                            ]
                        ),
                      ),
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                SideBarLayout(
                                ),
                          ),
                        );
                      },
                    ),

                  ],
                ),
              ],
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Don't have an account?",
                  style: subTitleStyleLight
                ),
                FlatButton(
                  child: Text(
                    'Sign Up',
                    style: titleStyleTheam,
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) =>
                            SignupScreen(
                            ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }


//  Future<void> _submit(BuildContext context) async {
//    try {
//      await Firestore.instance
//          .collection('users')
//          .where('user_contact_number',
//          isEqualTo: '+91${_phoneNumberController.value.text}')
//          .snapshots()
//          .listen((data) => {
//        print('data=${data}'),
//        if (data.documents.length == 0)
//          {
//            model.submit(),
//            GoToPage(context, OTPPage(phoneNo: _phoneNumberController.value.text, newUser: true)),
//          }
//        else
//          {
//            model.submit(),
//            GoToPage(context, OTPPage(phoneNo: _phoneNumberController.value.text, newUser: false)),
//          }
//      });
//    } on PlatformException catch (e) {
//      PlatformExceptionAlertDialog(
//        title: 'Phone number failed',
//        exception: e,
//      ).show(context);
//    }
//  }
}