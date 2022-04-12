import 'package:currency_convertor/app/view/home_view_page.dart';
import 'package:flutter/material.dart';

main () {
  runApp(AppWdidget()); 
}

class AppWdidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light(),
      home: HomeViewPage(),
    );
  }

}