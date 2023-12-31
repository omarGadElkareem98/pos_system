
  import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilysystem/Screens/LoginScreen.dart';

class RegisterScreen extends StatelessWidget {
     RegisterScreen({super.key});

    TextEditingController EmailController = TextEditingController();
    TextEditingController PasswordController = TextEditingController();
    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [

              Text("Welcome to Mobily System" , style: TextStyle(fontSize: 20 , fontWeight: FontWeight.bold),),
              SizedBox(height: 20,),
              TextFormField (
                keyboardType: TextInputType.emailAddress,
                controller: EmailController,
                decoration: InputDecoration(
                  hintText: 'Enter Email Adress',
                  label: Text('enter Email Adress'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.number,
                controller: PasswordController,
                decoration: InputDecoration(
                  label: Text('Password'),

                  hintText: 'password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),

                  )
                ),
                obscureText: true,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context){
                      return LoginScreen();
                    }));
                  }, child: Text('Login'))
                ],
              ),
              SizedBox(height: 20,),
            Container(
                width: double.infinity,
                child: ElevatedButton(onPressed: () async{
                  try {
                    final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
                      email: EmailController.text ,
                      password: PasswordController.text ,
                    );
                  Navigator.push(context, MaterialPageRoute(builder: (context){
                    return LoginScreen();
                  }));
                  } on FirebaseAuthException catch (e) {
                    if (e.code == 'weak-password') {
                      print('The password provided is too weak.');
                    } else if (e.code == 'email-already-in-use') {
                      print('The account already exists for that email.');
                    }
                  } catch (e) {
                    print(e);
                  }
                },
                    style: ButtonStyle(
                      backgroundColor: MaterialStatePropertyAll(
                        Colors.blue.shade900
                      )
                    ),
                    child: Text('Register' , style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.white
                    ),))
            ),


            ],
          ),
        ),
      );
    }
  }
