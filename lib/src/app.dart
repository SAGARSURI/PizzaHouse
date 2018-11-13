import 'package:flutter/material.dart';
import 'pizza_house.dart';
import 'blocs/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Provider( //This will provide access to the Bloc instance to the whole widget tree
      child: MaterialApp(
        home: new PizzaHouse(),
      ),
    );
  }
}
