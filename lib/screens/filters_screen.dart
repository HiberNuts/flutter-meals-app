import 'package:flutter/material.dart';

import 'package:menu_ap/widgets/main_drawer.dart';

class FilterScreen extends StatefulWidget {
  static const routeName = '/filters';
  final Function saveFilters;
  final Map<String, bool> currentFilters;
  const FilterScreen(
      {Key? key, required this.saveFilters, required this.currentFilters})
      : super(key: key);

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  var _glutenFree = false;
  var _vegetarian = false;
  var _vegan = false;
  var _lactoseFree = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['gluten'] as bool;
    _vegetarian = widget.currentFilters['vegetarian'] as bool;
    _vegan = widget.currentFilters['vegan'] as bool;
    _lactoseFree = widget.currentFilters['lactose'] as bool;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Try some filters!"),
        actions: [
          IconButton(
            onPressed: () {
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(selectedFilters);
              Navigator.of(context).popAndPushNamed('/');
            },
            icon: const Icon(Icons.save),
          ),
        ],
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              "Adjust your meal selection.",
              style: Theme.of(context).textTheme.subtitle1,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                SwitchListTile(
                  activeColor: Colors.amber,
                  value: _glutenFree,
                  title: const Text('Gluten-free'),
                  subtitle: const Text('Only include gluten free meals'),
                  onChanged: (newVal) {
                    setState(() {
                      _glutenFree = newVal;
                    });
                  },
                ),
                SwitchListTile(
                  activeColor: Colors.amber,
                  value: _lactoseFree,
                  title: const Text('Lactose-free'),
                  subtitle: const Text('Only include gluten free meals'),
                  onChanged: (newVal) {
                    setState(() {
                      _lactoseFree = newVal;
                    });
                  },
                ),
                SwitchListTile(
                  activeColor: Colors.amber,
                  value: _vegetarian,
                  title: const Text('Vegetarian'),
                  subtitle: const Text('Only include vegetarian meals'),
                  onChanged: (newVal) {
                    setState(() {
                      _vegetarian = newVal;
                    });
                  },
                ),
                SwitchListTile(
                  activeColor: Colors.amber,
                  value: _vegan,
                  title: const Text('Vegan'),
                  subtitle: const Text('Only include vegan meals'),
                  onChanged: (newVal) {
                    setState(() {
                      _vegan = newVal;
                    });
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
