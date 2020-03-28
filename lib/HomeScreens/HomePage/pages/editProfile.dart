import 'package:covidapp/common_variables/app_colors.dart';
import 'package:covidapp/common_variables/app_fonts.dart';
import 'package:covidapp/common_widgets/offline_widgets/offline_widget.dart';
import 'package:flutter/material.dart';
import '../bloc.navigation_bloc/navigation_bloc.dart';
import 'package:flutter/services.dart';
import 'package:intl/intl.dart';


class EditProfilePage extends StatelessWidget with NavigationStates{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: F_EditProfilePage(),
    );
  }
}

class F_EditProfilePage extends StatefulWidget {
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
  _F_EditProfilePageState createState() => _F_EditProfilePageState();
}

class _F_EditProfilePageState extends State<F_EditProfilePage> {

  //File _profilePic;
  DateTime selectedDate = DateTime.now();
  var customFormat = DateFormat("dd MMMM yyyy 'at' HH:mm:ss 'UTC+5:30'");
  var customFormat2 = DateFormat("dd MMMM yyyy");

//  final FirebaseStorage _storage =
//  FirebaseStorage(storageBucket: FIREBASE_STORAGE_URL);
//  StorageUploadTask _uploadTask;
  String _profilePicPathURL;

  bool _loading;
  double _progressValue;

  int group =1;


  @override
  void initState() {
    super.initState();
    _loading = false;
    _progressValue = 0.0;
  }

  Future<Null> showPicker(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: DateTime(2010),
      firstDate: DateTime(1930),
      lastDate: DateTime(2010),
    );
    if (picked != null) {
      setState(() {
        print(customFormat.format(picked));
        selectedDate = picked;
      });
    }
  }

  final TextEditingController _usernameController = TextEditingController();
  final FocusNode _usernameFocusNode = FocusNode();
  final TextEditingController _ageController = TextEditingController();
  final FocusNode _ageFocusNode = FocusNode();
  final TextEditingController _aadharController = TextEditingController();
  final FocusNode _aadharFocusNode = FocusNode();

  // SignUpModel get model => widget.model;

  @override
  void dispose() {
    _usernameController.dispose();
    _usernameFocusNode.dispose();
    _ageController.dispose();
    _ageFocusNode.dispose();
    _aadharController.dispose();
    _aadharFocusNode.dispose();

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
      body:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top:80.0,bottom: 20,left: 20,right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: SizedBox(height: 50,)
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Edit Profile",style: bigTitleStyle),
                ],
              ),
              SizedBox(height: 20.0,),
              Column(
                children: <Widget>[
                  Container(
                    width: 120,
                    height: 120,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 50, left: 25),
                      child: Text(
                        'Add Photo',
                        style: descriptionStyleDark,
                      ),
                    ),
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      shape: BoxShape.circle,
                    ),
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
                          controller: _usernameController,
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          focusNode: _usernameFocusNode,
                          //onEditingComplete: () => _imageUpload(),
                          // onChanged: model.updateUsername,
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.account_circle,
                              color: subBackgroundColor,
                            ),
                            labelText: "Enter your Name",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          validator: (val) {
                            if (val.length == 0) {
                              return "Username cannot be empty";
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
                          controller: _ageController,
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          focusNode: _ageFocusNode,
                          //onEditingComplete: () => _imageUpload(),
                          // onChanged: model.updateUsername,
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.donut_large,
                              color: subBackgroundColor,
                            ),
                            labelText: "Enter your Age",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          validator: (val) {
                            if (val.length == 0) {
                              return "Age cannot be empty";
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
                          controller: _aadharController,
                          textInputAction: TextInputAction.done,
                          obscureText: false,
                          focusNode: _aadharFocusNode,
                          //onEditingComplete: () => _imageUpload(),
                          //onChanged: model.updateUsername,
                          decoration: new InputDecoration(
                            prefixIcon: Icon(
                              Icons.description,
                              color: subBackgroundColor,
                            ),
                            labelText: "Enter your Aadhar",
                            border: new OutlineInputBorder(
                              borderRadius: new BorderRadius.circular(5.0),
                              borderSide: new BorderSide(),
                            ),
                          ),
                          validator: (val) {
                            if (val.length == 0) {
                              return "Username cannot be empty";
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
                  SizedBox(height: 20.0,),
                  Row(
                    children: <Widget>[
                      SizedBox(width: 10,),
                      Text("Gender",style: subTitleStyleLight,),
                      Radio(
                        value: 1,
                        groupValue: group,
                        onChanged: (T){
                          print(T);
                          setState(() {
                            group=T;
                          });
                        },
                      ),Radio(
                        value: 2,
                        groupValue: group,
                        onChanged: (T){
                          print(T);
                          setState(() {
                            group=T;
                          });
                        },
                      )
                    ],
                  ),
                  SizedBox(height: 10.0,),
                  Padding(
                    padding: EdgeInsets.only(top: 0, bottom: 10),
                    child: Container(
                      child: RaisedButton(
                        color: Colors.white,
                        child: Container(
                          height: 70,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: <Widget>[
                              Text(
                                'Select your date of birth.',
                                style: subTitleStyleLight,
                                textAlign: TextAlign.center,
                              ),
                              SizedBox(height: 5,),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Container(
                                    child: Row(
                                      children: <Widget>[
                                        Icon(
                                          Icons.date_range,
                                          size: 18.0,
                                          color: backgroundColor,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                            '${customFormat2.format(selectedDate)}',
                                            style: subTitleStyle),
                                      ],
                                    ),
                                  ),
                                  Text('Change', style: subTitleStyle),
                                ],
                              ),
                              SizedBox(
                                width: 10,
                              ),
                            ],
                          ),
                        ),
                        onPressed: () => showPicker(context),
                      ),
                    ),
                  ),
                  SizedBox(height: 20.0,),
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
                                    Text("EDIT",style: subTitleStyleWhite),
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

                        },
                      ),

                    ],
                  ),
                ],
              ),

            ],
          ),
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
