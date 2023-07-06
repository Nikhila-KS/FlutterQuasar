import 'package:flutter/material.dart';
import 'package:app_4_meal_app/providers/filters_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// enum Filter{  // enum is a special data type that enables for a variable to be a set of predefined constants
//   GlutenFree,
//   LactoseFree,
//   Vegetarian,
//   Vegan,
// }

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});
   

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters= ref.watch(filterProvider); // this is the way to access the data from the provider
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),


      body : 
        Column(
          children: [

            SwitchListTile(
              value: activeFilters[Filter.GlutenFree]!,
              onChanged: (isChecked){
                ref.read(filterProvider.notifier).setFilter(Filter.GlutenFree, isChecked);
              },
              title: Text(
                'Gluten-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                ),
              subtitle: Text(
                'Only include gluten-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left:33,right:22),
              ),
      
              SwitchListTile(
              value: activeFilters[Filter.LactoseFree]!, 
              onChanged: (isChecked){
                ref.read(filterProvider.notifier).setFilter(Filter.LactoseFree, isChecked);
              },
              title: Text(
                'Lactose-free',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                ),
              subtitle: Text(
                'Only include lactose-free meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left:33,right:22),
              ),
      
              SwitchListTile(
              value: activeFilters[Filter.Vegetarian]!,
              onChanged: (isChecked){
                ref.read(filterProvider.notifier).setFilter(Filter.Vegetarian, isChecked);
              
              },
              title: Text(
                'Vegetarian',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                ),
              subtitle: Text(
                'Only include vegetarian meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left:33,right:22),
              ),
      
              SwitchListTile(
              value: activeFilters[Filter.Vegan]!,
              onChanged: (isChecked){
                ref.read(filterProvider.notifier).setFilter(Filter.Vegan, isChecked);
              },
              title: Text(
                'Vegan',
                style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                ),
              subtitle: Text(
                'Only include vegan meals',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                  color: Theme.of(context).colorScheme.onBackground,
                ),
              ),
              activeColor: Theme.of(context).colorScheme.tertiary,
              contentPadding: const EdgeInsets.only(left:33,right:22),
              ),
          ],
        ),
      );
  }
}


// class FilterScreen extends ConsumerStatefulWidget {
//   const FilterScreen({super.key});

  
//   @override
//   ConsumerState<FilterScreen> createState() => _FilterScreenState();
// }

// class _FilterScreenState extends ConsumerState<FilterScreen> {

//   var _glutenFreeFilterSet = false;
//   var _lactoseFreeFilterSet = false;
//   var _vegetarianFilterSet = false;
//   var _veganFilterSet = false;

//   @override

//   void initState() {
//     // TODO: implement initState
//     super.initState();

//     final activeFilters = ref.read(filterProvider);
//     _glutenFreeFilterSet = activeFilters[Filter.GlutenFree]!;
//     _lactoseFreeFilterSet = activeFilters[Filter.LactoseFree]!;
//     _vegetarianFilterSet = activeFilters[Filter.Vegetarian]!;
//     _veganFilterSet = activeFilters[Filter.Vegan]!;
//     // _glutenFreeFilterSet = widget.currentFilters[Filter.GlutenFree]!;
//     // _lactoseFreeFilterSet = widget.currentFilters[Filter.LactoseFree]!;
//     // _vegetarianFilterSet = widget.currentFilters[Filter.Vegetarian]!;
//     // _veganFilterSet = widget.currentFilters[Filter.Vegan]!;
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Filters'),
//       ),

//     //  drawer: MainDrawer(onSeletScreen: ((identifier) {
//     //    Navigator.of(context).pop();
//     //    if(identifier=='Meals'){
//     //      Navigator.of(context).push( 
//     //       // differnce between push and push replacement is push replacement will replace the 
//     //       //current screen with the new screen but push push into the stack 
//     //        MaterialPageRoute(
//     //          builder: (ctx) => const TabsScreen()
//     //          ),
//     //      );
//     //    }
//     //  }
//     //  ),),

//       body : WillPopScope(
//         onWillPop: (() async {

//           ref.read(filterProvider.notifier).setFilters({
//             Filter.GlutenFree : _glutenFreeFilterSet,
//             Filter.LactoseFree : _lactoseFreeFilterSet,
//             Filter.Vegetarian : _vegetarianFilterSet,
//             Filter.Vegan : _veganFilterSet,
//           });
//           return true;

//           // Navigator.of(context).pop( // we are passing the data back to the previous screen where push was called to filter the meals
//           //   {
//           // Filter.GlutenFree : _glutenFreeFilterSet,
//           // Filter.LactoseFree : _lactoseFreeFilterSet,
//           // Filter.Vegetarian : _vegetarianFilterSet,
//           // Filter.Vegan : _veganFilterSet,
//           //   }
//           // );
//           // return false; // if we return true then it will pop the screen but we dont want that

//         }),
//         child: Column(
//           children: [
//             SwitchListTile(
//               value: _glutenFreeFilterSet, 
//               onChanged: (isChecked){
//                 setState(() {
//                   _glutenFreeFilterSet = isChecked;
//                 });
//               },
//               title: Text(
//                 'Gluten-free',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                   color: Theme.of(context).colorScheme.onBackground,
//                 ),
//                 ),
//               subtitle: Text(
//                 'Only include gluten-free meals',
//                 style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                   color: Theme.of(context).colorScheme.onBackground,
//                 ),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left:33,right:22),
//               ),
      
//               SwitchListTile(
//               value: _lactoseFreeFilterSet, 
//               onChanged: (isChecked){
//                 setState(() {
//                   _lactoseFreeFilterSet = isChecked;
//                 });
//               },
//               title: Text(
//                 'Lactose-free',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                   color: Theme.of(context).colorScheme.onBackground,
//                 ),
//                 ),
//               subtitle: Text(
//                 'Only include lactose-free meals',
//                 style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                   color: Theme.of(context).colorScheme.onBackground,
//                 ),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left:33,right:22),
//               ),
      
//               SwitchListTile(
//               value: _vegetarianFilterSet, 
//               onChanged: (isChecked){
//                 setState(() {
//                   _vegetarianFilterSet = isChecked;
//                 });
//               },
//               title: Text(
//                 'Vegetarian',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                   color: Theme.of(context).colorScheme.onBackground,
//                 ),
//                 ),
//               subtitle: Text(
//                 'Only include vegetarian meals',
//                 style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                   color: Theme.of(context).colorScheme.onBackground,
//                 ),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left:33,right:22),
//               ),
      
//               SwitchListTile(
//               value: _veganFilterSet, 
//               onChanged: (isChecked){
//                 setState(() {
//                   _veganFilterSet = isChecked;
//                 });
//               },
//               title: Text(
//                 'Vegan',
//                 style: Theme.of(context).textTheme.titleLarge!.copyWith(
//                   color: Theme.of(context).colorScheme.onBackground,
//                 ),
//                 ),
//               subtitle: Text(
//                 'Only include vegan meals',
//                 style: Theme.of(context).textTheme.labelMedium!.copyWith(
//                   color: Theme.of(context).colorScheme.onBackground,
//                 ),
//               ),
//               activeColor: Theme.of(context).colorScheme.tertiary,
//               contentPadding: const EdgeInsets.only(left:33,right:22),
//               ),
//           ],
//         ),
//       )
//     );
//   }
// }