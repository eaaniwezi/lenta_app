// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:lenta_app/widgets/search_bar_widget.dart';
import 'package:lenta_app/widgets/resturant_card_widget.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
            child: SearchBarWidget(),
          ),
          Expanded(
              child: ListView(
            children: [
              ResturantCardWidget(),
              ResturantCardWidget(),
              ResturantCardWidget(),
              ResturantCardWidget(),
              ResturantCardWidget(),
              ResturantCardWidget(),
            ],
          ))
        ],
      )),
    );
  }
}
