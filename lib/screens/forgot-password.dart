import 'package:dbproject3it1/function/colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {


  final firebase = FirebaseAuth.instance;
  String _email;

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;
    double height = MediaQuery.of(context).size.height;
    print(height);
    double width = MediaQuery.of(context).size.width;
    return Stack(
      children: [
        // BackgroundImage(image: 'assets/images/login_bg.png'),
        Scaffold(
          backgroundColor: Colors.transparent,
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.grey,
              ),
            ),
            title: Text(
              'Reset Password',
              style: TextStyle(color: Colors.grey),
            ),
            centerTitle: true,
          ),
          body: SingleChildScrollView(
            child: Column(
              children: [
                Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.1,
                      ),

                      Container(
                        width: size.width * 0.8,
                        child: Text(
                          'Enter your email we will send instruction to reset your password',
                          style: TextStyle(color: Colors.grey, fontSize: 20),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Container(
                          width: size.width * 0.9,
                          padding: EdgeInsets.symmetric(horizontal: 10),
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                          ),
                          child: TextFormField(
                            keyboardType: TextInputType.emailAddress,
                            decoration: InputDecoration(
                                focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                    BorderSide(color: primaryColor)),
                                prefixIcon: Icon(
                                  Icons.email,
                                  color: primaryColor,
                                ),
                                labelText: "E-mail Address",
                                labelStyle: TextStyle(
                                    fontSize: 18, color: primaryColor)
                            ),
                            onChanged: (value) {
                              setState(() {
                                _email = value;
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Center(
                          child: SizedBox(
                              height: height * 0.08,
                              width: width - 30,
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    primary: Colors.green,
                                    onPrimary: Colors.white,
                                    onSurface: Colors.grey,
                                  ),
                                  onPressed: () {
                                    firebase.sendPasswordResetEmail(email: _email);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text(
                                    "Send",
                                    style: TextStyle(
                                        letterSpacing: 0.5,
                                        fontWeight: FontWeight.w500,
                                        fontSize: 22,
                                        color: Colors.white),
                                  )
                              )
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
