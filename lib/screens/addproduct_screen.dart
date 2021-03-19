import 'package:dbproject3it1/screens/home_screen.dart';
import 'package:dbproject3it1/widgets/custom_icon_button.dart';
import 'package:flutter/material.dart';

class AddProduct extends StatefulWidget {
  @override
  _AddProductState createState() => _AddProductState();
}

class _AddProductState extends State<AddProduct> {



  Widget backButton (){
    return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
    Padding(
      padding: const EdgeInsets.only(top: 30,left: 10),
      child: CustomIconButton(
      icon: Icon(Icons.arrow_back),
      backgroundColor: Colors.white,
      onPressed: () => Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomeScreen())),
      ),
    ),
    ],
    );
  }
  Widget upLoadButton() {
    return Padding(
      padding: const EdgeInsets.only(top: 50),
      child: Container(
        width: MediaQuery.of(context).size.width*0.9,
        child: ElevatedButton.icon(
          onPressed: () {},
          icon: Icon(
            Icons.cloud_upload,
            color: Colors.white,
          ),
          style: ElevatedButton.styleFrom(
            primary: Colors.deepOrange
          ),
          label: Text("Upload Data to Firebase", style: TextStyle(color: Colors.grey),),
        ),
      ),
    );
  }

  Widget nameForm() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextField(
          decoration: InputDecoration(
              icon: Icon(Icons.food_bank), labelText: "Name Product"),
        ));
  }

  Widget detailForm() {
    return Container(
        width: MediaQuery.of(context).size.width * 0.9,
        child: TextField(
          decoration: InputDecoration(
              icon: Icon(Icons.food_bank), labelText: "Detail Product"),
        ));
  }

  Widget galleryButton() {
    return IconButton(
      icon: Icon(Icons.add_photo_alternate,color: Colors.deepOrange,),
      iconSize: 36.0,
      onPressed: () {},
    );
  }

  Widget displayButton() {
    return Padding(
      padding: const EdgeInsets.only(left: 10,top: 10),
      child: Align(
        alignment: Alignment.topLeft,
        child: galleryButton(),
      ),
    );
  }

  Widget displayImage() {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.only(top:20),
      child: Container(
        child: Image.asset("assets/food_logo.jpg",
          height: height * 0.40,
          width: width,
          fit: BoxFit.cover,),
      ),
    );
  }

  Widget showContent() {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [displayImage(), displayButton(), nameForm(), detailForm(),upLoadButton(),],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          showContent(),
          backButton()
        ],
      ),
    );
  }
}
