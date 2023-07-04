import 'package:flutter/material.dart';


enum Filter{  // enum is a special data type that enables for a variable to be a set of predefined constants
  GlutenFree,
  LactoseFree,
  Vegetarian,
  Vegan,
}

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key,required this.currentFilters});

  final Map<Filter,bool>currentFilters;

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {

  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override

  void initState() {
    // TODO: implement initState
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.GlutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.LactoseFree]!;
    _vegetarianFilterSet = widget.currentFilters[Filter.Vegetarian]!;
    _veganFilterSet = widget.currentFilters[Filter.Vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Filters'),
      ),

    //  drawer: MainDrawer(onSeletScreen: ((identifier) {
    //    Navigator.of(context).pop();
    //    if(identifier=='Meals'){
    //      Navigator.of(context).push( 
    //       // differnce between push and push replacement is push replacement will replace the 
    //       //current screen with the new screen but push push into the stack 
    //        MaterialPageRoute(
    //          builder: (ctx) => const TabsScreen()
    //          ),
    //      );
    //    }
    //  }
    //  ),),

      body : WillPopScope(
        onWillPop: (() async {
          Navigator.of(context).pop( // we are passing the data back to the previous screen where push was called to filter the meals
            {
          Filter.GlutenFree : _glutenFreeFilterSet,
          Filter.LactoseFree : _lactoseFreeFilterSet,
          Filter.Vegetarian : _vegetarianFilterSet,
          Filter.Vegan : _veganFilterSet,
            }
          );
          return false; // if we return true then it will pop the screen but we dont want that

        }),
        child: Column(
          children: [
            SwitchListTile(
              value: _glutenFreeFilterSet, 
              onChanged: (isChecked){
                setState(() {
                  _glutenFreeFilterSet = isChecked;
                });
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
              value: _lactoseFreeFilterSet, 
              onChanged: (isChecked){
                setState(() {
                  _lactoseFreeFilterSet = isChecked;
                });
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
              value: _vegetarianFilterSet, 
              onChanged: (isChecked){
                setState(() {
                  _vegetarianFilterSet = isChecked;
                });
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
              value: _veganFilterSet, 
              onChanged: (isChecked){
                setState(() {
                  _veganFilterSet = isChecked;
                });
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
      )
    );
  }
}