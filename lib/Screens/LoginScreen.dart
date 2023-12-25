
  import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
    const LoginScreen({super.key});

    @override
    State<LoginScreen> createState() => _LoginScreenState();
  }

  class _LoginScreenState extends State<LoginScreen> {
    @override

    void LoginUser()async{

      var  auth = FirebaseAuth.instance;
   UserCredential user =  await   auth.createUserWithEmailAndPassword(email: "omar0@gmail.com", password: "0000000");
      print(user.user?.email!);
    }


    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:   Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
            const   TextField(

                decoration: InputDecoration(

                  border: OutlineInputBorder(),
                  label: Text('Email'),
                  hintText: 'Email'
                ),
              ),

          const     SizedBox(height: 30,),

           const    TextField(
                obscureText: true,
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

                      onPressed: (){
                        LoginUser();
                      },
                      style: const ButtonStyle(
                        backgroundColor: MaterialStatePropertyAll(
                          Colors.teal
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
