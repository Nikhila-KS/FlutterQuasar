import 'package:flutter/material.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key, required this.onSeletScreen});

  final void Function(String identifier) onSeletScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          DrawerHeader(
            padding: const EdgeInsets.all(15),
            decoration:BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Theme.of(context).colorScheme.primaryContainer,
                  Theme.of(context).colorScheme.primaryContainer.withOpacity(0.7),
                ],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),

            ),
            child: Row(
              children:  [
                // const CircleAvatar(
                //   radius: 40,
                //   backgroundImage: NetworkImage('https://cdn.pixabay.com/photo/2016/11/18/23/38/child-1837375_960_720.png'),
                // ),
                // const SizedBox(width: 10,),
                // Text('Cooking Up!',style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                //   color: Theme.of(context).colorScheme.onPrimary,
                // ),),

                Icon(Icons.fastfood_outlined,color: Theme.of(context).colorScheme.primary,size: 48, ),
                const SizedBox(width: 16,),
                Text('Cooking Up!',style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.primary.withOpacity(0.8),
                ),),
              ],
              
            ),
            ),

            ListTile(
              leading: const Icon(Icons.restaurant,size: 26,),
              title:  Text('Meals',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,fontSize: 24,
                ),),
              onTap: (){
                onSeletScreen('Meals');
              },
            ),

            ListTile(
              leading: const Icon(Icons.settings,size: 26,),
              title:  Text('Filters',style: Theme.of(context).textTheme.titleSmall!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,fontSize: 24,
                ),),
              onTap: (){
                onSeletScreen('filters');
              },
            ),

      ]),
      );
  }
}