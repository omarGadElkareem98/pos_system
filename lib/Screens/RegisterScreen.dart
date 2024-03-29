


import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../main.dart';
import 'LoginScreen.dart';

class RegisterScreen extends StatefulWidget {

  static const String idScreen = "register";
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {


  TextEditingController _emailController = TextEditingController();
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _passwodController = TextEditingController();

  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  void  registerNewuser(BuildContext context)async{
    try{
      final User? firebaseUser = (
          await _firebaseAuth.createUserWithEmailAndPassword(email: _emailController.text, password: _passwodController.text).catchError((erorr){

          })

      ).user;

      if(firebaseUser != null){
        //   Save user in Database
        userRef.child(firebaseUser.uid);
        Map userDataMap = {
          "name" : _nameController.text,
          "email" : _emailController.text,
          "phone" : _phoneController.text,
          "password" : _passwodController.text
        };
        userRef.child(firebaseUser.uid).set(userDataMap);


        Navigator.pushNamedAndRemoveUntil(context, LoginScreen.idScreen, (route) => false);
      } else {
        print("Error ");
      }
    } catch (Error){
      print("error here ${Error.toString()}");
    }

  }



  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 50,),
              Text("Register as a Rider" , style: TextStyle(
                  fontSize: 24,
                  fontStyle: FontStyle.italic
              ),),
              SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: _emailController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),


                  ),
                  hintText: "youremail@gmail.com",
                  label: Text("Email"),
                  prefixIcon: Icon(Icons.email),

                ),

              ),
              SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.phone,
                controller: _phoneController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),


                  ),
                  hintText: "phone number",
                  label: Text("phone number"),
                  prefixIcon: Icon(Icons.phone_android),

                ),

              ),
              SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.text,
                controller: _nameController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),


                  ),
                  hintText: "name",
                  label: Text("name"),
                  prefixIcon: Icon(Icons.text_decrease),

                ),

              ),
              SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.visiblePassword,
                controller: _passwodController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),


                  ),
                  hintText: "password",
                  label: Text("password"),
                  prefixIcon: Icon(Icons.visibility),

                ),

              ),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                    width: double.infinity,
                    child: MaterialButton(onPressed: (){
                      if(_nameController.text.length < 3){

                      } else if (!_emailController.text.contains("@")){

                      } else if (_passwodController.text.length < 6){

                      }  else if(_phoneController.text.isEmpty){

                      }
                      else{
                        registerNewuser(context);
                      }
                    } , color: Colors.white, child: Text("Register" , style: TextStyle(
                        fontSize: 20
                    ),),)),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text("if you  have account ? "),
                  TextButton(onPressed: (){
                    Navigator.pushNamedAndRemoveUntil(context, LoginScreen.idScreen, (route) => false);
                  }, child: Text("Sign in"))
                ],
              ),
              SizedBox(height: 20,),
              Text("Or Sign in with Google"),

              SizedBox(height: 20,),


            ],
          ),
        ),
      ),
    );
  }
}


