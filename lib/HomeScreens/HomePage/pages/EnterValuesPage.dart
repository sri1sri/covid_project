import 'package:covidapp/common_variables/app_colors.dart';
import 'package:covidapp/common_variables/app_fonts.dart';
import 'package:covidapp/common_widgets/button_widget/to_do_button.dart';
import 'package:covidapp/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:covidapp/common_widgets/offline_widgets/offline_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Pond_Details.dart';

class EnterFeedValues extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_EnterFeedValues(),
    );
  }
}

class F_EnterFeedValues extends StatefulWidget {
  @override
  _F_EnterFeedValues createState() => _F_EnterFeedValues();
}

class _F_EnterFeedValues extends State<F_EnterFeedValues> {
  final TextEditingController _feedValueController = TextEditingController();
  final FocusNode _feedValueFocusNode = FocusNode();
  int group =1;
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
                  Text("Feeding Entry",style: bigTitleStyle),
                ],
              ),
              SizedBox(height: 50.0,),
              Text("Feed Value",style: subTitleStyleLight,),
              SizedBox(height: 10.0,),
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
                      controller: _feedValueController,
                      textInputAction: TextInputAction.done,
                      obscureText: false,
                      focusNode: _feedValueFocusNode,
                      //onEditingComplete: () => _imageUpload(),
                      // onChanged: model.updateUsername,
                      decoration: new InputDecoration(
                        prefixIcon: Icon(
                          Icons.library_books,
                          color: subBackgroundColor,
                        ),
                        labelText: "Enter Feeder value",
                        border: new OutlineInputBorder(
                          borderRadius: new BorderRadius.circular(5.0),
                          borderSide: new BorderSide(),
                        ),
                      ),
                      validator: (val) {
                        if (val.length == 0) {
                          return "Feeder value cannot be empty";
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
              SizedBox(height: 20,),
              Text("Feed Range",style: subTitleStyleLight,),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15),
                  color: subBackgroundColor.withOpacity(0.1),
                ),
                height: 200,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("0 - 1",style: subTitleStyleLight,),
                        SizedBox(width: 10,),
                        Radio(
                          value: 1,
                          groupValue: group,
                          onChanged: (T){
                            print(T);
                            setState(() {
                              group=T;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("1 - 2",style: subTitleStyleLight,),
                        SizedBox(width: 10,),
                        Radio(
                          value: 2,
                          groupValue: group,
                          onChanged: (T){
                            print(T);
                            setState(() {
                              group=T;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("2 - 3",style: subTitleStyleLight,),
                        SizedBox(width: 10,),
                        Radio(
                          value: 3,
                          groupValue: group,
                          onChanged: (T){
                            print(T);
                            setState(() {
                              group=T;
                            });
                          },
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text("3 - 4",style: subTitleStyleLight,),
                        SizedBox(width: 10,),
                        Radio(
                          value: 4,
                          groupValue: group,
                          onChanged: (T){
                            print(T);
                            setState(() {
                              group=T;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 25.0,),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ToDoButton(
                    assetName: 'images/google-lodgo.png',
                    text: 'Enter Values',
                    textColor: activeButtonTextColor,
                    backgroundColor: backgroundColor,
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PondDetails(),),
                      );
                    }
                ),
              ),

            ],
          ),
        ),
      ),

    );
  }
}