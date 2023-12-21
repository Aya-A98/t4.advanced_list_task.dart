
import 'package:advanced_project/pages/splash_screen.pages.dart';
import 'package:advanced_project/services/preferences.services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  try{
    PreferencesService.prefs = await SharedPreferences.getInstance();
    if (PreferencesService.prefs != null){
      print("preferences init successfully");
    }
  }
  catch (e){print("error in init preferences");}

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange)
        ),
        home: splash()
    );
  }
}
// StatefulWidget chk (var wh){
//   retrieveStringValue ();
//   if (wh == true){
//     return home();
//   } else return signin();
// }