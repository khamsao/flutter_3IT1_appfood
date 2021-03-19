import 'package:dbproject3it1/model/food_model.dart';
import 'package:dbproject3it1/pages/food_detail_page.dart';
import 'package:flutter/material.dart';

class FoodCard extends StatelessWidget {
  final FoodModel food;

  const FoodCard({Key key, this.food}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => FoodDetailPage(food: food)));
      },
      child: Container(
        width: MediaQuery.of(context).size.width * 0.5,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            buildFoodImage(),
            SizedBox(height: 8),
            buildFoodInfo(),
          ],
        ),
      ),
    );
  }

  Widget buildFoodImage() {
    return Stack(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(12),
          child: Image.network(
            food.image,
            height: 140,
            width: 150,
            fit: BoxFit.cover,
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(4),
          ),
          padding: EdgeInsets.all(4),
          margin: EdgeInsets.all(4),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(Icons.star, color: Colors.yellow, size: 12),
              Text(
                "${food.rating}",
                style: TextStyle(color: Colors.white, fontSize: 12),
              ),
              Text(
                " ( 1 k+ )",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget buildFoodInfo() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          food.name,
          style: TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(height: 4),
        Text(
          "\$${food.price}",
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }
}
