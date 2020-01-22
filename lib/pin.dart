import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:pin_entry_text_field/pin_entry_text_field.dart';
import 'stacked_icons.dart';
import 'register.dart';
import 'package:http/http.dart' as http;



Future<Widget>login(pin) async{
  var url = "http://10.5.50.91:8090/Server/test";
  Map<String,String> headers={"Content-type":"application/json"};
  var json = '{"kdid":"AKT","userid":"hp","traceid":"3284284","data":{"kdreg":"8BSFGOWMR","kdakt":"'+pin+'"}}';
  http.post(url,headers:headers,body:json).then((response){
   var rp = response.body;
   var test = jsonDecode(rp);
   print(test['rc']);
   if(test['rc']=='000'){
     print("suksess");
   }
   else{
     print('g');
   }
  //  var p = parsedJson[rp];
  // print(response.body)
  });
}

class Pin extends StatelessWidget {
  final String value;
Pin({Key key, this.value}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            // children: <Widget>[
            // Center(

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                    top: 120.0,
                  ),
                  child: Column(
                    children: <Widget>[
                      StakedIcons(),
                      Padding(
                          padding: const EdgeInsets.only(
                            top: 30.0,
                          ),
                          child: Column(
                            children: <Widget>[
                              Text(
                                "Silakan datang ke BPRS Terdekat.",
                                style: new TextStyle(fontSize: 20.0),
                              ),
                              Text("Kode Reg: ${value}",
                                  style: TextStyle(
                                      fontSize: 20.0,
                                      fontWeight: FontWeight.bold)),
                              Padding(
                                padding: const EdgeInsets.only(
                                    top: 25.0, bottom: 20.0),
                                child: Column(
                                  children: <Widget>[
                                    Text(
                                      "OTP",
                                      style: TextStyle(fontSize: 25),
                                    ),
                                   
                                  ],
                                ),
                              )
                            ],
                          ))
                    ],
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.all(8.0),
              child: PinEntryTextField(
                
                showFieldAsBox: false,
                onSubmit: (String pin) {
                  
                  login(pin);
                  // showDialog(
                  //     context: context,
                  //     builder: (context) {
                  //       return AlertDialog(
                  //         title: Text("Pin"),
                  //         content: Text('Pin entered is $pin'),
                  //       );
                  //     }); //end showDialog()
                }, // end onSubmit
              ),
            ),
          ], // end PinEntryTextField()
        ),
        // ],
        // end Padding()
      ),
      //  ), // end Container()
    );
  }
}
