import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:screentwo/screens/one_recipe.dart';
import 'package:screentwo/models/recipe.dart';
import 'package:like_button/like_button.dart';
import 'package:screentwo/screens/main_page.dart';

Widget RecipesColumn(String images, String txt1, String txt2,  int label){
  
  Recipe recipe = new Recipe(image: images, title: txt1, subtitle: txt2, likes: label);
  return  Container(
    child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      Padding(padding: const EdgeInsets.only(top: 15.0)),
     InkWell(
       onTap: (){
        Get.to(OneRecipe());
       },
      child: Container(
     child:ClipRRect(
       borderRadius: BorderRadius.circular(8.0),
       child: Image.asset(
        recipe.image,
        width: 350,
        height: 200,
        fit: BoxFit.fitWidth,
      ),
      ),
      ),
     ),
      Container(
        margin: const EdgeInsets.only(left:30.0),
        padding: const EdgeInsets.only(top: 10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          
          children: [
              Container(
              padding: const EdgeInsets.only(bottom: 5.0),
              child: Text(
                recipe.title,
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18, 
                ),
              ),
              ),
             Text(
                recipe.subtitle,
                style: TextStyle(
                  color: Colors.grey[500],
                  fontSize: 15,
                   ),

              ),
             
             
              Row(
                
                crossAxisAlignment: CrossAxisAlignment.center,
              children: [ 
                 Container(
                padding: const EdgeInsets.all(0.0),
                 margin: const EdgeInsets.all(0.0),
              ),
               LikeButton(
                  likeCount: recipe.likes,
                  likeBuilder: (bool isLiked){
                    return Icon(
                      Icons.favorite,
                      size: 25,
                      color: isLiked ? Colors.redAccent : Colors.blueGrey[200],
                    );
                  },
                  countBuilder: (int count, bool isLiked, String text){
                    var color = isLiked ? Colors.redAccent : Colors.blueGrey;
                    Widget result;
                    if(count == 0){
                      result = Text(
                        "love",
                         style: TextStyle(color: color),
                      );
                    }
                    else{
                     result = Text(
                     text,
                     style: TextStyle(color: color),
                     );
                    }
                    return result;
                  },
                ),
               Container(
                   margin: const EdgeInsets.only(right:250.0),
                ),
                 SavedWidget(),
             
            
              ],
              ), 
          ],
        ),
      ),
    ],
    ),
  );
}

