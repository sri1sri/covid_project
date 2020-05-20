import 'package:covidapp/common_variables/app_fonts.dart';
import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'Stored_Images/Day_Selection.dart';

class PersonalDataPage extends StatelessWidget with NavigationStates {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Container(
          child: Padding(
            padding: EdgeInsets.only(top: 80),
            child: Column(
              children: <Widget>[
                Text("Pond Images",style: bigTitleStyle,),
                SizedBox(height: 50,),
                Container(
                  child: Column(
                    children: [
                      PondlistCard(context,"images/p1.jpg","Star Pond","This is the pond with is more big"),
                      PondlistCard(context,"images/p2.jpg","Moon Pond","This is the pond with is more big"),
                      PondlistCard(context,"images/p3.jpg","Sun Pond","This is the pond with is more big"),
                      PondlistCard(context,"images/p4.jpg","Earth Pond","This is the pond with is more big"),
                    ],
                  ),
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
Widget PondlistCard(BuildContext context,String imgPath,String title,String description)
{
  return GestureDetector(
    onTap: (){
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) =>
              DaySelection(
              ),
        ),
      );
    },
    child: Card(
      child: Container(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Card(
                    elevation: 20,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(color: Colors.black54, width: 2),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Container(
                        height: 60.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            image: DecorationImage(
                                image: AssetImage(imgPath), fit: BoxFit.fill))),
                  ),
//                  CircleAvatar(
//                    backgroundColor: Colors.black26,
//                    radius: 30,
//                    child: Container(
//                        width: 50.0,
//                        height: 50.0,
//                        decoration: new BoxDecoration(
//                          color: Colors.orange,
//                          shape: BoxShape.circle,
//                        ),
//                        child: Image.asset(imgPath,fit: BoxFit.contain,)),
//                  ),
                  SizedBox(width: 20,),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,style: highlightDescription,),
                      Text(description,style: descriptionStyleDarkBlur,),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
