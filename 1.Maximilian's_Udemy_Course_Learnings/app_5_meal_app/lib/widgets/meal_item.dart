import 'package:app_4_meal_app/models/meal.dart';
import 'package:app_4_meal_app/widgets/meal_item_trait.dart';
import 'package:flutter/material.dart';
import 'package:transparent_image/transparent_image.dart';

class MealItem extends StatelessWidget {
  
  const MealItem({super.key,required this.meal,required this.onSelectMeal});
  final Meal meal;
  final void Function(Meal) onSelectMeal;

  String get complexityText{
   return meal.complexity.name[0].toUpperCase()+meal.complexity.name.substring(1);
  }
   String get affordabilityText{
   return meal.affordability.name[0].toUpperCase()+meal.affordability.name.substring(1);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(3),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      clipBehavior: Clip.hardEdge,
      elevation: 4,
      child: InkWell(
        onTap: (){
          onSelectMeal(meal);
        },
        child: Stack(
          children: [
            // first child of stack will be at the bottom
            // so as you move down we see the top most widget
            Hero(
              tag: meal.id,
              child: FadeInImage(
                placeholder: MemoryImage(kTransparentImage), // placeholder means what to show while the image or other content is loading
                image: NetworkImage(meal.imageUrl),
                fit: BoxFit.cover, // make sure the image covers the entire card
                height: 200,
                width: double.infinity,
                ),
            ), 
            Positioned(
              bottom: 0,
              right: 0,
              left: 0,
              child: Container(
                width: double.infinity,
                color: const Color.fromARGB(166, 0, 0, 0),
                padding: const EdgeInsets.symmetric(
                  vertical: 5,
                  horizontal: 5,
                ),
                child: Column(
                  children: [
                    Text(
                      meal.title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      softWrap: true, // if the text is too long to fit in 2 lines, it will wrap, soft wrap will wrap at a word boundary
                      overflow: TextOverflow.ellipsis, // if the text is too long to fit in 2 lines, it will show ellipsis(...)
                    ),
                    const SizedBox(height: 6,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,  
                      children: [
                        MealItemTrait(icon:Icons.schedule_rounded, lable: '${meal.duration} min'),
                        const SizedBox(width: 6,),
                        MealItemTrait(icon:Icons.work_rounded, lable: complexityText),
                        const SizedBox(width: 6,),
                        MealItemTrait(icon:Icons.attach_money_rounded, lable: affordabilityText),
                      ],
                    ),
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



