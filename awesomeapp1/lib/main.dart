import 'package:awesomeapp1/homepage.dart';
import 'package:flutter/material.dart';

const  myColor  = Colors.pink;

 void main() {
   runApp(MyApp());
 }
  
class MyApp extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner:false ,
      title:"Cocktail App",
      theme: ThemeData(
        primarySwatch: myColor,
        ),
               
      home:HomePage(),
    );
  }

}