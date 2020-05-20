import 'package:covidapp/common_variables/app_colors.dart';
import 'package:covidapp/common_variables/app_fonts.dart';
import 'package:covidapp/common_widgets/button_widget/to_do_button.dart';
import 'package:covidapp/common_widgets/custom_appbar_widget/custom_app_bar.dart';
import 'package:covidapp/common_widgets/offline_widgets/offline_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class FlushImage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_FlushImage(),
    );
  }
}

class F_FlushImage extends StatefulWidget {
  @override
  _F_FlushImage createState() => _F_FlushImage();
}

class _F_FlushImage extends State<F_FlushImage> {
  final TextEditingController _questionController = TextEditingController();
  int _questionCountIndex = 0;

  List<String> questions = [
    "",
    "images/p1.jpg",
    "images/p2.jpg",
    "images/p3.jpg",
    "images/p4.jpg",

  ];



  changeQuestion() {
    int questionCount = questions.length;

    setState(() {
      if (_questionCountIndex == questionCount - 1) {
        _questionCountIndex = 0;
      } else {
        _questionCountIndex += 1;
      }
      _questionController.text = questions[_questionCountIndex];
    });
  }
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
                  Text("Flush Pond",style: bigTitleStyle),
                ],
              ),
              SizedBox(height: 20.0,),
              ToDoButton(
                  assetName: 'images/google-lodgo.png',
                  text: 'Flush Pond',
                  textColor: activeButtonTextColor,
                  backgroundColor: subBackgroundColor,
                  onPressed: () {
                    print(questions[_questionCountIndex]);
                    changeQuestion();
                  }
              ),
              SizedBox(height: 20,),
              _buildImage1(
                questions[_questionCountIndex],
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
      child: Container(
          height: 240.0,
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              image: DecorationImage(
                  image: AssetImage(imgPath), fit: BoxFit.fill))),
    );
  }
}