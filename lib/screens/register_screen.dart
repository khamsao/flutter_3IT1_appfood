import 'package:dbproject3it1/function/colors.dart';
import 'package:dbproject3it1/function/constants.dart';
import 'package:dbproject3it1/screens/home_screen.dart';
import 'package:dbproject3it1/screens/login_screen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class RegisterScreen extends StatefulWidget {
  @override
  _RegisterScreenState createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _formkey = GlobalKey<FormState>();
  final firebaseAuth = FirebaseAuth.instance;
  String _email,_password;

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
                      "  $registerString ",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 22,
                      ),
                    ),
                    decoration: BoxDecoration(
                      gradient: LinearGradient(colors: [
                        primaryColor.withOpacity(0.3),
                        Colors.transparent
                      ]),
                      border: Border(
                          left: BorderSide(color: primaryColor, width: 5)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _email = value.trim();
                      });
                    },
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        prefixIcon: Icon(
                          Icons.email,
                          color: primaryColor,
                        ),
                        labelText: "E-mail Address",
                        labelStyle:
                            TextStyle(color: primaryColor, fontSize: 16),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(10),
                  child: TextFormField(
                    onChanged: (value) {
                      setState(() {
                        _password = value.trim();
                      });
                    },
                    obscureText: true,
                    decoration: InputDecoration(
                        focusedBorder: UnderlineInputBorder(
                            borderSide: BorderSide(color: primaryColor)),
                        prefixIcon: Icon(
                          Icons.lock_open,
                          color: primaryColor,
                        ),
                        labelText: "Your Password",
                        labelStyle:
                            TextStyle(color: primaryColor, fontSize: 16)),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Center(
                    child: SizedBox(
                        height: height * 0.08,
                        width: width - 30,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              primary: Colors.green,
                              onSurface: Colors.grey,
                            ),
                            onPressed: () => _registerFb(_email,_password),
                            child: Text(
                              "Register",
                              style: TextStyle(
                                  letterSpacing: 0.5,
                                  fontWeight: FontWeight.w500,
                                  fontSize: 22,
                                  color: Colors.white),
                            )))),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("Already have an account!!!  "),
                    ElevatedButton(
                        onPressed: () {
                          Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=> LoginScreen()));
                        },
                        child: Text(
                          "Login",
                          style: TextStyle(color: primaryColor, fontSize: 16),
                        ),
                      style: ElevatedButton.styleFrom(
                        primary: Colors.white
                      ),
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
    _registerFb(String _email, String _password) async{
    try{
      await firebaseAuth.createUserWithEmailAndPassword(email: _email, password: _password);
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>LoginScreen()));
    } on FirebaseAuthException catch (error){
     Fluttertoast.showToast(msg: error.message, gravity: ToastGravity.TOP);
    }
  }

}
