import 'package:advanced_project/pages/signin.pages.dart';
import 'package:flutter/material.dart';
import '../services/preferences.services.dart';
import 'home.pages.dart';

class splash extends StatefulWidget {
  const splash({super.key});

  @override
  State<splash> createState() => _splashState();
}

class _splashState extends State<splash> {
  void initState(){
    initsplash();
  }
  void initsplash()async{
    await Future.delayed(const Duration(milliseconds: 200));
    if(PreferencesService.checkuser()){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>home()));
    }else{
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>signin()));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/Mask_Group_9.png"),
            fit: BoxFit.cover,
            opacity: 5,
          )
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 200,),
            Container( height: 100,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Logo.png"),
                  opacity: 5,
              )
          ),),
            SizedBox(height: 10,),
            Text("Cooking Done The Easy Way", style: TextStyle(
                color: Colors.white54 , fontWeight: FontWeight.bold)),
            SizedBox(height: 200,),
            Container(width: 300, height: 50,
              child: ElevatedButton(onPressed: (){},
                  child: Text("Register",style: TextStyle(color: Colors.white,
                      backgroundColor: Colors.deepOrange),),
                style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
              ),
            ),
            SizedBox(height: 100,),
            Text("Sign In", style: TextStyle(color: Colors.white),)
        ],),
      )
      );
  }
}
