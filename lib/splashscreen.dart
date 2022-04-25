

import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tik_tak_toe_game/home_page.dart';

class splash_screen extends StatefulWidget {
  const splash_screen({Key? key}) : super(key: key);

  @override
  _splash_screenState createState() => _splash_screenState();
}

class _splash_screenState extends State<splash_screen> {


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), ()=> Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>HomePage()), (route) => false));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Color(0xFF9ABCA7),

      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,

        children: [
          SizedBox(width: MediaQuery.of(context).size.width/1,),

          Card(
            color: Colors.transparent,
            elevation: 0,
            shadowColor: Colors.black,

            child: Container(
              height: 160,
              width: 160,

              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(90),
                  image: DecorationImage(image: NetworkImage("https://img.poki.com/cdn-cgi/image/quality=78,width=600,height=600,fit=cover,f=auto/c3942550783f954de418d4e4e3146386.jpeg"),fit: BoxFit.fill)
              ),
            ),
          ),
          SizedBox(height: 15,),

          Text("Tic Tac Toe",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold,color: Colors.black),)
        ],
      ),
    );
  }
}
