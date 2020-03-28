import 'package:covidapp/common_variables/app_fonts.dart';
import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';

class YourIdeaPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
          child: SingleChildScrollView(
            child: Container(
              child: Padding(
                padding: EdgeInsets.only(top: 100),
                child: Column(
                  children: <Widget>[
                    Text("Your Ideas",style: bigTitleStyle,),
                    Container(
                      height: 900,
                    )

                  ],
                ),
              ),
            ),
          )
      ),
    );
  }
}
