
import 'package:advanced_project/pages/home.pages.dart';
import 'package:advanced_project/services/preferences.services.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class signin extends StatefulWidget {
  signin({super.key});

  @override
  State<signin> createState() => signinState();
}

class signinState extends State<signin> {
  late TextEditingController un ;
  late TextEditingController pw ;
  late GlobalKey<FormState> formkey;
  bool isvisible = true;

  @override
  void initState() {
    un = TextEditingController();
    pw = TextEditingController();
    formkey = GlobalKey<FormState>();
    super.initState();
  }
  var retrieveStringValue;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage("images/Mask_Group_9.png"),
            fit: BoxFit.cover,
            opacity: 20
            )),
      child: Form(
        key: formkey,
        child: Column(mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(width: 250, height: 200,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/Logo.png"),
                  opacity: 50,)
              ),),
            SizedBox(height: 20,),
            Text("Sign In",style: TextStyle(
              color: Colors.white,
                fontWeight: FontWeight.bold,
                 fontSize: 20),),
            SizedBox(height: 50,),
            Padding(
            padding: const EdgeInsets.only(left:50,top:0,right:50,bottom:0),
            child: TextFormField(
              controller: un,
              decoration: InputDecoration(
                  label: Row(
                    children: [
                      Icon(Icons.person),
                      Text("Email",style: TextStyle(color: Colors.white,),),
                    ],
                  ),
                  enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(20),
                    borderSide: BorderSide(color: Colors.white12),),
                  filled: true , fillColor: Colors.black12),
              keyboardType: TextInputType.emailAddress,
              validator: (value){
                if (value == null || value.isEmpty){
                  return "This is Required";
                }
                if (!EmailValidator.validate(value)){
                  return "Not Valid Email";
                }
                return null;
              },
              //autovalidateMode: AutovalidateMode.always,
            ),
          ),
            const SizedBox(height: 20,),
            Padding(
              padding: const EdgeInsets.only(left:50,top:0,right:50,bottom:0),
              child: TextFormField(
                controller: pw,
                decoration: InputDecoration(
                    label: const Row(
                      children: [
                        Icon(Icons.lock),
                        Text("Password",style: TextStyle(color: Colors.white),),
                      ],
                    ),
                    enabledBorder: OutlineInputBorder(borderRadius:BorderRadius.circular(20),
                        borderSide: BorderSide(color: Colors.white12)),
                    filled: true, fillColor: Colors.black12,
                    suffixIcon: IconButton(icon: Icon(isvisible? Icons.visibility:Icons.visibility_off),
                      color: Colors.deepOrange,
                      onPressed: (){
                        setState(() {
                          isvisible = !isvisible;
                        });
                      },)),
                obscureText: isvisible,
                validator: (value){
                  if (value == null || value.isEmpty){
                    return "This is Required";
                  }
                  if(value.length <5){
                    return "Password is to Short";
                  } return null;
                },
                //autovalidateMode: AutovalidateMode.always,
              ),
            ),
            const SizedBox(height:20),
            Row(mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:50,top:0,right:50,bottom:0),
                  child: Text("Forget Password?",style: TextStyle(color: Colors.blue),),
                ),
              ],
            ),
            SizedBox(height: 50,),
            Container(
              child: SizedBox(width: 300, height: 45,
                child: ElevatedButton(onPressed: () async {
                  if (formkey.currentState?.validate() ?? false){
                    await PreferencesService.prefs?.setBool("islogin", true);
                    Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>home()));
                  } else {}
                  //Navigator.push(context,MaterialPageRoute(builder: (context)=>const signup()));
                }, child: Padding(
                    padding: EdgeInsets.all(5),
                    child: Text("Signup", style: TextStyle(color: Colors.white)),
                  ),
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.deepOrange,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25))),
                ),
              ),
            ),
            SizedBox(height: 120,),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account?", style: TextStyle(color: Colors.white),),
                InkWell(child: Text("Register",style: TextStyle(color: Colors.deepOrange) ,) ),
              ],
            )
          ],),
      ),
    )
    );
  }
 }
// StatefulWidget pg (var p){
//   var keyusername;
//   if (keyusername==null){
//     return signup();
//   }else return home();
// }
