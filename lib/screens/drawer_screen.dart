import 'package:dbproject3it1/screens/addproduct_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({Key key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.grey,
            ),
            child: Column(
              children: [
                Container(
                  child: Padding(
                    padding: EdgeInsets.only(top: 5.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        CircleAvatar(
                          radius: 45.0,
                          backgroundImage: AssetImage("assets/food_logo.jpg")
                          ),
                        SizedBox(
                          height: 1.0,
                        ),
                        Text(
                          "Classroom 3IT1",
                          style: TextStyle(
                            fontSize: 15.0,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: 0.0,
                        ),
                        Text(
                          "Information & Technology (IT)",
                          style: TextStyle(
                            fontSize: 16.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Column(children: [
            SizedBox(
              height: 20.0,
            ),
            //Now let's Add the button for the Menu
            //and let's copy that and modify it
            ListTile(
              onTap: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => AddProduct()),
                );
              },
              leading: Icon(
                Icons.upload_file,
                color: Colors.black,
              ),
              title: Text("Upload"),
            ),

            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(
                Icons.inbox,
                color: Colors.black,
              ),
              title: Text("Your Inbox"),
            ),

            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(
                Icons.assessment,
                color: Colors.black,
              ),
              title: Text("Your Dashboard"),
            ),

            ListTile(
              onTap: () {
                Navigator.pop(context);
              },
              leading: Icon(
                Icons.settings,
                color: Colors.black,
              ),
              title: Text("Settings"),
            ),
          ]),
        ],
      ),
    );
  }
}
