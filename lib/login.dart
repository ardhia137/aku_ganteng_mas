import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'stacked_icons.dart';
import 'home.dart';
import 'package:http/http.dart' as http;
import 'pin.dart';
import 'register.dart';

class LoginPage extends StatefulWidget{
  
  @override
  _LoginPageState createState()=>_LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

TextEditingController user = TextEditingController();
TextEditingController pass = TextEditingController();

Future<Widget>login() async{
  var url = "http://10.5.50.91:8090/Server/test";
  Map<String,String> headers={"Content-type":"application/json"};
  var json = '{"kdid":"LGN","userid":"diski","traceid":"3284284","data":{"user":"'+user.text+'","pas":"'+pass.text+'"}}';
  http.post(url,headers:headers,body:json).then((response){
   var rp = response.body;
   var test = jsonDecode(rp);
   print(test['rc']);
   if(test['rc']=='000'){
     Navigator.pushReplacement(
      context, MaterialPageRoute(builder: (BuildContext context) => Pin()));
   }
   else{
     print('g');
   }
  //  var p = parsedJson[rp];
  // print(response.body)
  });
}

 @override
 void initState(){
   super.initState();
   SystemChrome.setPreferredOrientations([
     DeviceOrientation.portraitUp
   ]);
 } 
  @override
  Widget build(BuildContext context) {
    
SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
  statusBarColor: Colors.orange, //or set color with: Color(0xFF0000FF)
));
    return new Scaffold(
      appBar: new AppBar(
        backgroundColor:Colors.transparent,
          elevation: 0.0,
          iconTheme: new IconThemeData(color: Color(0xFF18D191))),
      body: Container(
        width: double.infinity,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            new StakedIcons(),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(top: 8.0, bottom: 80.0),
                  child: new Text(
                    "Quick Bee",
                    style: new TextStyle(fontSize: 30.0),
                  ),
                )
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextField(
                controller: user,
                decoration: new InputDecoration(labelText: 'Username'),
              ),
            ),
            new SizedBox(
              height: 15.0,
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextField(
                controller: pass,
                obscureText: true,
                decoration: new InputDecoration(labelText: 'Password'),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 20.0, right: 5.0, top: 10.0),
                    child: GestureDetector(
                      onTap: () {
                        login();
                        // Navigator.push(context, MaterialPageRoute(
                        //   builder: (context) => HomePage()
                        // ));
                      },
                                          child: new Container(
                            alignment: Alignment.center,
                            height: 60.0,
                            decoration: new BoxDecoration(
                                color: Color(0xFF18D191),
                                borderRadius: new BorderRadius.circular(9.0)),
                            child: new Text("Login",
                                style: new TextStyle(
                                    fontSize: 20.0, color: Colors.white))),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10.0, right: 20.0, top: 10.0),
                    child: new Container(
                        alignment: Alignment.center,
                        height: 60.0,
                        child: new Text("Forgot Password?",
                            style: new TextStyle(
                                fontSize: 17.0, color: Color(0xFF18D191)))),
                  ),
                )
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(bottom:18.0),
                    child:MaterialButton(
                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(
                          builder: (context) => RegisterPage()
                        ));
                      },
                       child:Text("Create A New Account ",style: new TextStyle(fontSize: 17.0, color: Color(0xFF18D191),fontWeight: FontWeight.bold)),
                    )
                                
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
