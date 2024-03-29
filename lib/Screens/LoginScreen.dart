


  import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'HomeScreen.dart';
import 'RegisterScreen.dart';

class LoginScreen extends StatefulWidget {

    static const String idScreen = "loginScreen";

    const LoginScreen({super.key});

    @override
    State<LoginScreen> createState() => _LoginScreenState();
  }

  class _LoginScreenState extends State<LoginScreen> {


    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();


    final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    void loginNewuser(BuildContext context)async{

      final User? firebaseUser = (
          await _firebaseAuth.signInWithEmailAndPassword(email: _emailController.text, password: _passwordController.text).catchError((erorr){

          })

      ).user;

      if(firebaseUser != null){
        //   Save user in Database
        Navigator.pushNamedAndRemoveUntil(context, HomeScreen.idScreen, (route) => false);



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
                Text("login as a Rider" , style: TextStyle(
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
                  keyboardType: TextInputType.visiblePassword,
                  controller: _passwordController,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),


                    ),
                    hintText: "password",
                    label: Text("password"),
                    prefixIcon: Icon(Icons.visibility),

                  ),

                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                      width: double.infinity,
                      child: MaterialButton(onPressed: (){
                        if (!_emailController.text.contains("@")){

                        } else if (_passwordController.text.length < 6){

                        }
                        else{
                          loginNewuser(context);
                        }
                      } , color: Colors.white, child: Text("login" , style: TextStyle(
                          fontSize: 20
                      ),),)),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text("if you Don't have account ? "),
                    TextButton(onPressed: (){
                      Navigator.pushNamedAndRemoveUntil(context, RegisterScreen.idScreen, (route) => false);
                    }, child: Text("Sign Up"))
                  ],
                ),
                SizedBox(height: 20,),
                Text("Or Sign in with Google"),

                SizedBox(height: 20,),


                SizedBox(height: 20,),


              ],
            ),
          ),
        ),
      );
    }
  }
