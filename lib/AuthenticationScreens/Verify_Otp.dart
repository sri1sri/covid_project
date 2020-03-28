//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:covidapp/HomeScreens/HomePage/sidebar/sidebar_layout.dart';
import'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:covidapp/AuthenticationScreens/SignUp_Screen.dart';
//import 'package:covidapp/Models/otp_model.dart';
import 'package:covidapp/common_variables/app_colors.dart';
import 'package:covidapp/common_variables/app_fonts.dart';
import 'package:covidapp/common_variables/app_functions.dart';
import 'package:covidapp/common_widgets/button_widget/to_do_button.dart';
import 'package:covidapp/common_widgets/offline_widgets/offline_widget.dart';
import 'package:covidapp/common_widgets/platform_alert/platform_exception_alert_dialog.dart';
//import 'package:covidapp/firebase/auth.dart';
import 'package:provider/provider.dart';

import '../landing_page.dart';

class OTPPage extends StatelessWidget {
  OTPPage({@required this.phoneNo, @required this.newUser});
  String phoneNo;
  bool newUser;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_OTPPage(),
    );
  }
}

class F_OTPPage extends StatefulWidget {

  //F_OTPPage({@required this.model, @required this.phoneNo, @required this.newUser});
  //final OtpModel model;
  String phoneNo;
  bool newUser;

//  static Widget create(BuildContext context, String phoneNo, bool newUser) {
//
//    final AuthBase auth = Provider.of<AuthBase>(context);
//    return ChangeNotifierProvider<OtpModel>(
//      create: (context) => OtpModel(auth: auth),
//      child: Consumer<OtpModel>(
//        builder: (context, model, _) => F_OTPPage(model: model, phoneNo: phoneNo, newUser: newUser,),
//      ),
//    );
//  }

  @override
  _F_OTPPageState createState() => _F_OTPPageState();
}

class _F_OTPPageState extends State<F_OTPPage> {

  final TextEditingController _otpController = TextEditingController();
  final FocusNode _otpFocusNode = FocusNode();

 // OtpModel get model => widget.model;

  @override
  void dispose() {
    _otpController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      body:Padding(
        padding: const EdgeInsets.only(top:100.0,bottom: 20,left: 20,right: 20),
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
                Text("Verify OTP",style: bigTitleStyle,),
                SizedBox(height: 15.0,),
                Text("Please enter the otp which is sent to +91-9585753459",style: descriptionStyleDarkBlur,),
              ],
            ),

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
                    keyboardType: TextInputType.number,
                    controller: _otpController,
                    textInputAction: TextInputAction.done,
                    obscureText: false,
                    focusNode: _otpFocusNode,
                   // onEditingComplete:() =>_submit(),
                   // onChanged: model.updateOtp,
                    decoration: new InputDecoration(
                      prefixIcon: Icon(
                        Icons.lock,
                        color: subBackgroundColor,
                      ),
                      labelText: "Enter OTP",
                      border: new OutlineInputBorder(
                        borderRadius: new BorderRadius.circular(5.0),
                        borderSide: new BorderSide(
                        ),
                      ),
                    ),

                    validator: (val) {
                      if(val.length==0) {
                        return "One Time Password cannot be empty";
                      }else{
                        return null;
                      }
                    },
                    style: new TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
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
                                  Text("LOG IN", style: subTitleStyleWhite),
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

            Container(
              child: Padding(
                padding: const EdgeInsets.only(bottom:20.0),
                child: RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text:
                        'By continuing, You accept the Terms & Conditions Of the',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' Terms of use',
                        style: TextStyle(
                          color: backgroundColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      TextSpan(
                        text: ' and',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.0,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      TextSpan(
                        text: ' Privacy Policies',
                        style: TextStyle(
                          color: backgroundColor,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

//  @override
//  Future<void> _submit() async {
//    try {
//      print('otp${widget.newUser}');
//      if(widget.newUser){
//        await model.submit();
//        GoToPage(context, SignUpPage(phoneNo: widget.phoneNo));
//      }else{
//        await model.submit();
//        GoToPage(context, LandingPage());
//      }
//    } on PlatformException catch (e) {
//      PlatformExceptionAlertDialog(
//        title: 'Otp Verification failed',
//        exception: e,
//      ).show(context);
//    }
//  }
}