import 'package:flutter/material.dart';

class MoreView extends StatefulWidget {
  MoreView({Key? key}) : super(key: key);

  @override
  State<MoreView> createState() => _MoreViewState();
}

class _MoreViewState extends State<MoreView> {
  @override
  Widget build(BuildContext context) {
  return SafeArea(
      child: Scaffold(body: Text('More',style: TextStyle(fontSize: 50))),
    );
  }
}