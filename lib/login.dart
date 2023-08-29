import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hive_database/signup.dart';
import 'home page.dart';


class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  bool processRun = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black12,
      body: SafeArea(
        child: Stack(
          children: [
            Image.asset("assets/images/Sky_Blue_Wallpaper.jpeg",
                height: double.infinity,width: MediaQuery.of(context).size.width,fit: BoxFit.fill),
            SingleChildScrollView(
              child: Form(key: formKey,
                child: Column(
                  children: [
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(right: 8.0, top: 5),
                        child: TextButton(onPressed: () {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(),), (route) => false);
                        },
                          child: Text(
                            "Skip",
                            style: TextStyle(
                              color: Colors.white70,
                              fontSize: 13,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 40),
                      child: Center(
                        child: Text(
                          "TASK APP",
                          style: TextStyle(
                            color: Colors.white70,
                            fontSize: 30,
                            fontWeight: FontWeight.w700,
                            fontFamily: "Audiowide",
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(
                        top: 70,
                      ),
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                          color: Colors.white60,
                          fontSize: 28,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(top: 40, left: 25),
                        child: Text(
                          "Your Email",
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 10, right: 20, left: 20, bottom: 15),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter Email address";
                          } else if (!RegExp(
                              r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
                              .hasMatch(value)) {
                            return "enter valid email address";
                          }
                        },
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        style: TextStyle(
                            color: Color(0xff103C78),
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Color(0xff103C78)),
                                borderRadius: BorderRadius.circular(35)),
                            enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color: Color(0xffE4E4E4).withOpacity(0.60)),
                                borderRadius: BorderRadius.circular(35)),
                            hintText: " please enter email address",
                            hintStyle: TextStyle(
                              color: Colors.white54,
                              fontWeight: FontWeight.w300,
                              fontSize: 13,
                            )),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: EdgeInsets.only(left: 25),
                        child: Text(
                          "Password",
                          style: TextStyle(
                            color: Colors.white60,
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10.0, left: 20, right: 20),
                      child: TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter password";
                          } else if (!RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                              .hasMatch(value)) {
                            return "enter valid password\npassword length must be 8 char\nMinimum 1 Upper case\nMinimum 1 lowercase\nMinimum 1 Numeric Number\nMinimum 1 Special Character\nCommon Allow Character ( ! @ # \$ & * ~ )";
                          }
                        },
                        controller: passController,
                        keyboardType: TextInputType.visiblePassword,
                        onFieldSubmitted: (value) => print(value),
                        style: TextStyle(
                            color: Color(0xff103C78),
                            fontWeight: FontWeight.w400,
                            fontSize: 16),
                        decoration: InputDecoration(
                          focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xff06172d)),
                              borderRadius: BorderRadius.circular(35)),
                          enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                  color: Color(0xffE4E4E4).withOpacity(0.60)),
                              borderRadius: BorderRadius.circular(35)),
                          hintText: "please enter password",
                          hintStyle: TextStyle(
                            color: Colors.white54,
                            fontWeight: FontWeight.w300,
                            fontSize: 13,
                          ),
                          suffixIcon: IconButton(
                            onPressed: () {

                            },
                            icon: Icon(Icons.remove_red_eye_rounded),
                          ),

                        ),
                      ),
                    ),
                    Container(
                      height: 50,
                      width: MediaQuery
                          .of(context)
                          .size
                          .width,
                      margin: const EdgeInsets.only(
                          left: 100, right: 100, top: 70, bottom: 20),
                      padding: const EdgeInsets.only(top: 15, bottom: 13),
                      decoration: BoxDecoration(
                        gradient: LinearGradient(colors: [
                          Color(0xff447CB7),
                          Color(0xff447CB7),
                          Color(0xff89C2FE),
                          Color(0xff447CB7)
                        ]),
                        borderRadius: BorderRadius.circular(35),
                      ),
                      child:  Center(
                        child: InkWell(onTap:() {
                          if(formKey.currentState!.validate()){
                            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context) => HomePage(),), (route) => false);
                          }
                          setState(() {

                          });
                        },
                          child: Text(
                            "Sign In",
                            style: TextStyle(
                              color: Color(0xFFFFFFFF),
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ),
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(
                            color: Colors.white54,
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                          children: [
                            TextSpan(text: "Sign up",style: TextStyle( color: Color(0xff006F57),
                              fontSize: 15,
                              fontWeight: FontWeight.w600,),
                                recognizer: TapGestureRecognizer()..onTap=(){
                                  Navigator.push(context, MaterialPageRoute(builder: (context) => Signup(),));
                                })
                          ]
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
