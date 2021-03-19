import 'package:dbproject3it1/function/colors.dart';
import 'package:dbproject3it1/function/constants.dart';
import 'package:dbproject3it1/screens/forgot-password.dart';
import 'package:dbproject3it1/screens/home_screen.dart';
import 'package:dbproject3it1/screens/register_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formkey = GlobalKey<FormState>();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: Form(
            key: _formkey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Stack(
                  children: [
                    Image.asset(
                      bgImage,
                      height: height * 0.40,
                      width: width,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: height * 0.450,
                      width: width,
                      decoration: BoxDecoration(),
                    ),
                    Positioned(
                      bottom: 35,
                      left: 0,
                      right: 0,
                      child: Center(
                          child: RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: TextStyle(
                                fontSize: 25, fontWeight: FontWeight.w700),
                            text: appName + "\n",
                            children: [
                              TextSpan(
                                  text: slogan,
                                  style: TextStyle(
                                      color: Colors.deepOrange, fontSize: 15))
                            ]),
                      )),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 22),
                  child: Container(
                    child: Text(
                      "  $loginString ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [Colors.orange, Colors.white70]),
                      border: Border(
                          left: BorderSide(color: Colors.deepOrange, width: 5)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    controller: _emailController,
                    validator: (email) {
                      if (email.isEmpty) {
                        return 'Enter Email Address';
                      } else if (!email.contains('@')) {
                        return 'Please enter a valid email address!';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: Colors.deepOrange,
                        ),
                        labelText: "E-mail Address",
                        labelStyle: TextStyle(fontSize: 16)),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 10.0, vertical: 10),
                  child: TextFormField(
                    controller: _passwordController,
                    validator: (value) {
                      if (value.isEmpty) {
                        return 'Enter Password';
                      } else if (value.length < 6) {
                        return 'Password must be atleast 6 characters!';
                      }
                      return null;
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        // focusedBorder: UnderlineInputBorder(
                        //     borderSide: BorderSide(color: primaryColor)),
                        prefixIcon: Icon(
                          Icons.lock_open,
                          color: Colors.deepOrange,
                        ),
                        labelText: "Your Password",
                        labelStyle: TextStyle(fontSize: 16)),
                  ),
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ForgotPassword()));
                    },
                    child: Text(forgetText),
                  ),
                ),
                Center(
                    child: SizedBox(
                        height: height * 0.08,
                        width: width - 30,
                        child: TextButton(
                            style: TextButton.styleFrom(
                              primary: Colors.white,
                              backgroundColor: Colors.green,
                              onSurface: Colors.grey,
                            ),
                            onPressed: () {
                              if (_formkey.currentState.validate()) {
                                setState(() {
                                  isLoading = false;
                                });
                                FirebaseAuth.instance
                                    .signInWithEmailAndPassword(
                                    email: _emailController.text, password: _passwordController.text)
                                    .then((result) {
                                  isLoading = false;
                                  Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => HomeScreen(uid: result.user.uid)),
                                  );
                                }).catchError((err) {
                                  print(err.message);
                                  showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("Error"),
                                          content: Text(err.message),
                                          actions: [
                                            TextButton(
                                              child: Text("Ok"),
                                              onPressed: () {
                                                Navigator.of(context).pop();
                                              },
                                            )
                                          ],
                                        );
                                      });
                                });
                              }
                            },
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                  color: Colors.white),
                            )))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Don't have an account?"),
                    TextButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => RegisterScreen()));
                        },
                        child: Text(
                          "Create Account",
                          style: TextStyle(color: primaryColor, fontSize: 16),
                        ))
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
