import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

//import 'package:muti_screen_app_navigating/screens/tabs.dart';
//import '../widgets/main_drawer.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}




class FiltersScreen extends StatefulWidget {
  const FiltersScreen({Key? key, required this.currentFilters}) : super(key: key);

  final Map<Filter, bool> currentFilters;

  @override
  State<FiltersScreen> createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarianFiler = false;
  var _veganFiler = false;

  @override
  void initState() {
    super.initState();
    _glutenFree = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFree = widget.currentFilters[Filter.lactoseFree]!;
    _vegetarianFiler = widget.currentFilters[Filter.vegetarian]!;
    _veganFiler = widget.currentFilters[Filter.vegan]!;
  }


  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.of(context).pop({
          Filter.glutenFree: _glutenFree,
          Filter.lactoseFree: _lactoseFree,
          Filter.vegetarian: _vegetarianFiler,
          Filter.vegan: _veganFiler,
        });
        return false;
      },
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Your Filters'),
          ),
          // drawer: MainDrawer(onSelectedScreen: (String identifier) {
          //   Navigator.of(context).pop();
          //   if (identifier == 'meals') {
          //     Navigator.of(context)
          //         .pushReplacement(MaterialPageRoute(builder: (ctx) => const TabsScreen()));
          //   }
          // },),
          body: Column(
            children: [
              SwitchListTile(
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
                subtitle: Text(
                  'Only include gluten-free meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                value: _glutenFree,
                onChanged: (isChecked) {
                  setState(() {
                    _glutenFree = isChecked;
                  });
                },
                title: Text(
                  'Gluten-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
              SwitchListTile(
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
                subtitle: Text(
                  'Only include lactose-free meals',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                value: _lactoseFree,
                onChanged: (isChecked) {
                  setState(() {
                    _lactoseFree = isChecked;
                  });
                },
                title: Text(
                  'Gluten-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
              SwitchListTile(
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
                subtitle: Text(
                  'Only include Vegetarian meals',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                value: _vegetarianFiler,
                onChanged: (isChecked) {
                  setState(() {
                    _vegetarianFiler = isChecked;
                  });
                },
                title: Text(
                  'Vegetarian',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
              SwitchListTile(
                activeColor: Theme.of(context).colorScheme.tertiary,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
                subtitle: Text(
                  'Only include Vegan meals',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
                value: _veganFiler,
                onChanged: (isChecked) {
                  setState(() {
                    _veganFiler = isChecked;
                  });
                },
                title: Text(
                  'Vegan',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: Theme.of(context).colorScheme.onBackground,
                      ),
                ),
              ),
            ],
          )),
    );
  }
}
