import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

import 'AppointmentPage.dart';

class MyLoginPage extends StatefulWidget {
  MyLoginPage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyLoginPage> {

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: screenSize.width,
        height: screenSize.height,

        child: Stack(
          children: <Widget>[
            //make curves for desgining

            ClipPath(
              child: Container(
                color: Colors.blue[400],
                height: 140,
                width: screenSize.width,
              ),
              clipper: WaveClipperOne(),
            ),

            ClipPath(
              child: Container(
                color: Colors.blue[600],
                height: 120,
                width: screenSize.width,
              ),
              clipper: WaveClipperTwo(),
            ),

            //curves for bottom
            Positioned(
              child: ClipPath(
                child: Container(
                  color: Colors.blue[400],
                  height: 80,
                  width: screenSize.width,
                ),
                clipper: WaveClipperOne(reverse: true),
              ),
              bottom: 0,
              left: 0,
            ),
            Positioned(
              child: ClipPath(
                child: Container(
                  color: Colors.blue[600],
                  height: 90,
                  width: screenSize.width,
                ),
                clipper: WaveClipperTwo(reverse: true),
              ),
              bottom: 0,
              left: 0,
            ),

            //lets make content
            //lets first make content for small screens that is less than 580

            screenSize.width < 580 ?
            Container(
              //for small
              width: screenSize.width,
              height: screenSize.height,
              child: Column(
                children: <Widget>[
                  //Lets make container for picture

                  Container(
                    margin: EdgeInsets.only(top: 64),
                    height: 240,
                    child: Image.asset("assets/web.png", fit: BoxFit.contain,),
                  ),

                  SizedBox(height: 16,),
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(horizontal: 64),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text("Appointment Management", style: TextStyle(fontSize: kIsWeb ? 40 : 20, fontWeight: FontWeight.bold, color: Colors.lightBlue),),
                          SizedBox(height: 8,),
                          //Text("", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, letterSpacing: 1.0, color: Colors.grey[800]),),
                          usernameField(context),
                          passwordField(),
                          SizedBox(height: 16,),
                          loginButton(),
                          // FlatButton.icon(
                          //     onPressed: (){
                          //       // Navigator.of(context).push(MaterialPageRoute(
                          //       //     builder: (context) => VideoScreen()
                          //       // ));
                          //     },
                          //     icon: Icon(Icons.video_label), 
                          //     label: Text("LogIn"),
                          //   color: Colors.grey[800],
                          //   textColor: Colors.white,
                          //   shape: RoundedRectangleBorder(
                          //     borderRadius: BorderRadius.all(Radius.circular(32))
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  )


                ],
              ),

            ) :

            Container(
              //for large screens
              height: screenSize.height,
              width: screenSize.width,
              child: Column(
                children: <Widget>[
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Expanded(
                          child: Container(
                            child: Image.asset("assets/web.png", fit: BoxFit.contain,),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(horizontal: 64),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[

                                Text("Appointment Management", style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold, color: Colors.lightBlue),),
                                SizedBox(height: 8,),
                                usernameField(context),
                                passwordField(),
                                //Text("", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w300, letterSpacing: 1.0, color: Colors.grey[800]),),
                                SizedBox(height: 16,),
                                loginButton(),

                                // FlatButton.icon(
                                //   onPressed: (){
                                //     // Navigator.of(context).push(MaterialPageRoute(
                                //     //   builder: (context) => VideoScreen()
                                //     // ));
                                //   },
                                //   icon: Icon(Icons.video_library),
                                //   label: Text("See all Videos"),
                                //   color: Colors.grey[800],
                                //   textColor: Colors.white,
                                //   shape: RoundedRectangleBorder(
                                //       borderRadius: BorderRadius.all(Radius.circular(32))
                                //   ),
                                // )

                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )



          ],
        ),

      ),
    );
  }
  Widget usernameField(BuildContext context){
    return TextFormField(
      decoration: InputDecoration(
        labelText: "USER NAME",
        labelStyle: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.grey
        ),
      ),
      onSaved: (String value){
      },
    );
  }

  Widget passwordField(){
    return TextFormField(
      decoration: InputDecoration(
        labelText: "PASSWORD",
        labelStyle: TextStyle(fontSize: 17.0,fontWeight: FontWeight.bold,color: Colors.grey),
      ),
      obscureText: true,
        onSaved: (String value) {
        },
    );
  }

    Widget loginButton(){
    return Container(
      
      padding: EdgeInsets.only(top: 20.0),
      child: FlatButton(
          child: Text(
            "LOGIN",
            style: TextStyle(fontSize: 22.0),
          ),
          color: Colors.blueGrey,
          textColor: Colors.white,
          splashColor: Colors.green,
          onPressed: (){
              // if(user.username=="username" && user.userpass=="user@123") {
                Navigator.push(context,
                    MaterialPageRoute(
                        builder: (context) => MyAppointmentPage(title: 'Euro Rail')));
              // }
          },
      ),
    );
  }
}
