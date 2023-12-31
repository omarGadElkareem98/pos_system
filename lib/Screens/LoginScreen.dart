
  import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilysystem/Screens/HomeScreen.dart';

class LoginScreen extends StatefulWidget {
    const LoginScreen({super.key});

    @override
    State<LoginScreen> createState() => _LoginScreenState();
  }

  class _LoginScreenState extends State<LoginScreen> {

  TextEditingController EmailController = TextEditingController();
  TextEditingController PasswordController = TextEditingController();
    @override




    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:   Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
               TextField(

              controller: EmailController,

                decoration: InputDecoration(

                  border: OutlineInputBorder(),
                  label: Text('Email'),
                  hintText: 'Email'
                ),
              ),

          const     SizedBox(height: 30,),

               TextField(
                obscureText: true,
                controller: PasswordController,
                decoration: InputDecoration(
                  hintText: 'password',
                  label: Text('password'),
                  border: OutlineInputBorder(

                  )
                ),
              ),

          const     SizedBox(height: 30,),

              Container(
                width: double.infinity,
                  child: ElevatedButton(

                      onPressed: ()async{
                        try {
                          final credential = await FirebaseAuth.instance.signInWithEmailAndPassword(
                              email: EmailController.text,
                              password: PasswordController.text
                          );
                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return HomeScreen();
                          }));
                        } on FirebaseAuthException catch (e) {
                          if (e.code == 'user-not-found') {
                            print('No user found for that email.');
                          } else if (e.code == 'wrong-password') {
                            print('Wrong password provided for that user.');
                          }
                        }
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.blue
                        )
                      ),
                      child: Text('Login' , style: TextStyle(
                        color: Colors.white,
                        fontSize: 22
                      ),)))
            ],
          ),
        ),
      );
    }


  }
