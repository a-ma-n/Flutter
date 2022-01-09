import 'package:awesomeapp1/drink_details.dart';
import 'package:awesomeapp1/main.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}



class _HomePageState extends State<HomePage> {
  var api ="https://www.thecocktaildb.com/api/json/v1/1/filter.php?c=Cocktail";
  var res,drinks;


  @override
  void initState() {
    
    super.initState();
    fetchdata();
  }
  
  void fetchdata() async{
     res= await http.get(Uri.parse(api));
    
    drinks = jsonDecode(res.body)['drinks'];
    print(drinks.toString());
    setState(() {});
  } 



   @override
  Widget build(BuildContext context) {
    return Container(
       decoration: BoxDecoration(
            gradient: LinearGradient(
              colors:[myColor
              ,Colors.orange] )
          ),
      child: Scaffold(
        
        backgroundColor: Colors.transparent, 
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          title: Text('Cocktail App'),
        elevation: 0.0,
      ),
      body:Center(
        child:res!=null ?ListView.builder(
          itemCount: drinks.length,
          itemBuilder: (context, index) {
            var drink = drinks[index];
            return ListTile(
              leading: Hero(
                tag: drink['idDrink'],
                child: CircleAvatar(
                  backgroundImage: NetworkImage(drink['strDrinkThumb']??"http://scanivalve.com/wp-content/plugins/lightbox/images/No-image-found.jpg"),
                ),
              ),
              title:Text("${drink["strDrink"]} ",style: TextStyle( 
                fontSize: 22,
                color: Colors.white
              ), 
              ),
              subtitle: Text("${drink["idDrink"]} ",style: TextStyle( 
                
                color: Colors.white
              ),
              ),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (context)=>DrinkDetail(drink:drink),
                  fullscreenDialog:true
                ),
                );
              },
            );
          }
        ):CircularProgressIndicator(
          backgroundColor: Colors.white,
        ),
        ),
      
      ),
    );
  }

}