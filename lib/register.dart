import 'dart:convert' show jsonDecode;
// import 'dart:html';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'stacked_icons.dart';
import 'home.dart';
import 'package:http/http.dart' as http;
import 'pin.dart';
import 'package:imei_plugin/imei_plugin.dart';


class RegisterPage extends StatefulWidget {
  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController user = TextEditingController();
  TextEditingController pass = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController hp = TextEditingController();

  Future<Widget> register() async {
    var url = "http://10.5.50.91:8090/Server/test";
    String platformImei = await ImeiPlugin
    .getImei( shouldShowRequestPermissionRationale: false );
    Map<String, String> headers = {"Content-type": "application/json"};
    var json =
        '{"kdid":"REG","userid":"REG","traceid":"3284284444","data":{"user":"' +user.text +'","pass":"' +pass.text +'","email":"'+email.text+'","hp":"'+hp.text+'","imei":"7975656759454545"}}';
    http.post(url, headers: headers, body: json).then((response) async {
      var rp = response.body;
    var uuid = await ImeiPlugin.getId();
      var test = jsonDecode(rp);
      String kdr = test['kdreg'];
      print(test['rc']);
      if (test['rc'] == '000') {
        var route = new MaterialPageRoute(
                  builder: (BuildContext context) =>
                      new Pin(value:kdr),
                );
                Navigator.of(context).push(route);
      } else {
        print("g");
      }
      //  var p = parsedJson[rp];
      // print(response.body)
    });
  }

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark.copyWith(
      statusBarColor: Colors.orange, //or set color with: Color(0xFF0000FF)
    ));
    return new Scaffold(
      resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
          backgroundColor: Colors.transparent,
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
                    "Registrasi",
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
                decoration: new InputDecoration(labelText: 'Usrname'),
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
                // obscureText: true,
                decoration: new InputDecoration(labelText: 'Password'),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextField(
                controller: email,
                // obscureText: true,
                decoration: new InputDecoration(labelText: 'Email'),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 0.0),
              child: new TextField(
                controller: hp,
                // obscureText: true,
                decoration: new InputDecoration(labelText: 'Hp'),
              ),
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 20.0,
                      right: 20.0,
                      top: 25.0,
                    ),
                    child: MaterialButton(
                      onPressed: () {
                        register();
                        print("object");
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
                          child: new Text("Register",
                              style: new TextStyle(
                                  fontSize: 20.0, color: Colors.white))),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Padding(
                      padding: const EdgeInsets.only(bottom: 18.0),
                      child: MaterialButton(
                        onPressed: () {
                          print("diski");
                        },
                        child: Text("Create A New Account ",
                            style: new TextStyle(
                                fontSize: 17.0,
                                color: Color(0xFF18D191),
                                fontWeight: FontWeight.bold)),
                      )),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
