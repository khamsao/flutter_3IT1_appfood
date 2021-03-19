
import 'package:dbproject3it1/model/category_model.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final Category category;

  const CategoryCard({Key key, this.category}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(2),
                child: Image.network(
                  category.image,
                  height: height * 0.18,
                  width: width,
                  fit: BoxFit.fitWidth,
                ),
              ),
              // Positioned(
              //   bottom: 0.0,
              //   left: 1.0,
              //   child: Center(
              //       child: RichText(
              //         text: TextSpan(
              //             style: TextStyle(
              //                 fontSize:16, fontWeight: FontWeight.bold,color: Colors.grey[500]),
              //             text: category.name + "\n",
              //             children: [
              //               TextSpan(
              //                   text: "${category.totalItems} + items",
              //                   style: TextStyle(
              //                       color: Colors.deepOrange, fontSize: 15))
              //             ]),
              //       )),
              // ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text("${category.name}",style: TextStyle(
                      fontSize:16, fontWeight: FontWeight.bold,color: Colors.grey[800]),),
                  Text("${category.totalItems} + items",style: TextStyle(
                      color: Colors.grey[700], fontSize: 11),)
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
