import 'package:flutter/material.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({ Key? key }) : super(key: key);
  static const routeName='/home';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(child: Text('git add')),
    );
  }
}
