import 'package:flutter/material.dart';
import 'package:news_app/modules/business/business.dart';
import 'package:news_app/modules/science/science.dart';
import 'package:news_app/modules/setting/setting.dart';
import 'package:news_app/modules/sports/sports.dart';

var current_Index =0;

List<BottomNavigationBarItem> navbar=[
  BottomNavigationBarItem(icon: Icon(Icons.business_sharp),label: "Business"),
  BottomNavigationBarItem(icon: Icon(Icons.sports),label: "Sports"),
  BottomNavigationBarItem(icon: Icon(Icons.science_outlined),label:"Science"),
  // BottomNavigationBarItem(icon: Icon(Icons.settings),label: "Setting"),
];

List<Widget> screens=[
  business_screen(),
  sports_screen(),
  science_screen(),
  // setting_screen(),
];

  bool IsSearch =true ;