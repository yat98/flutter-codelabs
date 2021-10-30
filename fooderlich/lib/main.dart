import 'package:flutter/material.dart';
import 'package:fooderlich/fooderlichTheme.dart';

void main() {
  runApp(const Fooderlich());
}

class Fooderlich extends StatelessWidget {
  const Fooderlich({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = FooderlichTheme.light();
    return MaterialApp(
      theme: theme,
      title: 'Fooderlich',
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            'Fooderlich',
            style: theme.textTheme.headline6,
          ),
        ),
        body: Center(
          child: Text(
            'Let\'s get cooking 👩‍🍳',
            style: theme.textTheme.headline1,
          ),
        ),
      ),
    );
  }
}
