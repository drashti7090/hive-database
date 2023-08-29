import 'dart:async';

import 'package:flutter/material.dart';

import 'login.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override

  Widget build(BuildContext context) {

    Timer(
        Duration(seconds: 3),
            () =>
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (BuildContext context) => Login())));
    return Scaffold(
      body: Stack(
        children: [
          Image.asset("assets/images/Sky_Blue_Wallpaper.jpeg",
              height: double.infinity,
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              fit: BoxFit.fill),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: Container(
                  height: 85,
                  width: 85,
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(color: Color(0xff103C78),
                            blurRadius: 5,
                            offset: Offset(5, 5))
                      ],
                      image: DecorationImage(
                          image: AssetImage(
                            "assets/images/blue q.jpeg",
                          ),
                          fit: BoxFit.fill)),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                "TASK APP",
                style: TextStyle(
                  color: Color(0xff103C78),
                  fontSize: 30,
                  fontWeight: FontWeight.w700,
                  fontFamily: "Audiowide",
                ),
              ),

            ],
          ),
        ],
      ),
    );
  }
}
