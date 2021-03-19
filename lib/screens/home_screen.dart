import 'package:dbproject3it1/model/category_model.dart';
import 'package:dbproject3it1/model/food_model.dart';
import 'package:dbproject3it1/screens/drawer_screen.dart';
import 'package:dbproject3it1/screens/login_screen.dart';
import 'package:dbproject3it1/widgets/category_card.dart';
import 'package:dbproject3it1/widgets/custom_icon_button.dart';
import 'package:dbproject3it1/widgets/filter_button.dart';
import 'package:dbproject3it1/widgets/food_card.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({this.uid});
  final uid;
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepOrange,
        title: Text(
          "LaoFood delivery",
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white70,
          ),
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.exit_to_app,
              color: Colors.grey[200],
            ),
            onPressed: () {
              FirebaseAuth auth = FirebaseAuth.instance;
              auth.signOut().then((res) {
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => LoginScreen()),
                        (Route<dynamic> route) => false);
              });
            },
          )
        ],
      ),
      drawer: Drawer(
        child: DrawerScreen(),
      ),

      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(vertical: 5, horizontal: 12),
          children: [
            buildSearch(),
            buildFilter(),
            buildFoodList(),
            buildSectionTitle(),
            SizedBox(height: 10),
            buildCategoryList(),
          ],
        ),
      ),
    );
  }

  Widget buildSearch() {
    return Row(
      children: [
        Expanded(
          child: TextField(
            decoration: InputDecoration(
              hintText: "Search food",
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              contentPadding: EdgeInsets.all(8),
              suffixIcon: Icon(Icons.search),
            ),
          ),
        ),
        CustomIconButton(
          margin: EdgeInsets.only(left: 8),
          icon: Icon(Icons.filter_list),
          onPressed: () {},
          backgroundColor: Colors.green,
        ),
      ],
    );
  }

  Widget buildFilter() {
    return Container(
      height: 20,
      margin: EdgeInsets.only(top: 16),
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          FilterButton(
            title: "Popular",
            isSelected: true,
          ),
          FilterButton(
            title: "New Items",
            isSelected: false,
          ),
          FilterButton(
            title: "Hot deal",
            isSelected: false,
          ),
          FilterButton(
            title: "Combo pack",
            isSelected: false,
          ),
        ],
      ),
    );
  }

  Widget buildFoodList() {
    return Container(
      height: 220,
      margin: EdgeInsets.only(top: 25),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: foodList.length,
        itemBuilder: (context, index) {
          FoodModel food = foodList[index];
          return FoodCard(food: food);
        },
      ),
    );
  }

  Widget buildSectionTitle() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "List of Menus",
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }

  Widget buildCategoryList() {
    return GridView.builder(
      itemCount: categories.length,
      shrinkWrap: true,
      primary: false,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 10 / 10,
      ),
      itemBuilder: (context, index) {
        final Category category = categories[index];
        return CategoryCard(category: category);
      },
    );
  }
}
