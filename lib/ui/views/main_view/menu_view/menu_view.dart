import 'package:flutter/material.dart';

class MenuView extends StatefulWidget {
  MenuView({Key? key}) : super(key: key);

  @override
  State<MenuView> createState() => _MenuViewState();
}

class _MenuViewState extends State<MenuView> {
  @override
  Widget build(BuildContext context) {
   return SafeArea(
      child: Scaffold(body: Text('Menu',style: TextStyle(fontSize: 50))),
    );
  }
}