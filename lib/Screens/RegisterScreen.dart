
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RegisterScreen extends StatelessWidget {
    const RegisterScreen({super.key});

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
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: 'Enter Phone number',
                  label: Text('enter phone number'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),
                  )
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('Password'),

                  hintText: 'password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(16),

                  )
                ),
                obscureText: true,
              ),
              SizedBox(height: 20,),
            Container(
                width: double.infinity,
                child: ElevatedButton(onPressed: (){},
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
            )
            ],
          ),
        ),
      );
    }
  }
