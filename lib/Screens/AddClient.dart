

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobilysystem/Screens/Parts.dart';

class AddClientParts extends StatelessWidget {
   AddClientParts({super.key});

  @override


  TextEditingController _nameClientController = TextEditingController();
   TextEditingController _PartsValue = TextEditingController();
   TextEditingController _DateTimeController = TextEditingController();
  var formKey = GlobalKey<FormState>();

  CollectionReference SaveClientParts = FirebaseFirestore.instance.collection("ClientParts");

  SaveClient () async{

  await  SaveClientParts.add({
      "nameClient" : _nameClientController.text,
      "PartsValue" : _PartsValue.text,
      "DateTime" : _DateTimeController.text
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('دفع القسط'),
      ),

      body: Padding(
        padding: const EdgeInsets.only(left: 20 , right: 20),
        child: Form(
          key: formKey,
          child: Column(

            children: [
              SizedBox(height: 20,),

              TextFormField(
                keyboardType: TextInputType.text,
                validator: (value){
                  if(value!.isEmpty){
                    return "Data please";
                  }
                },
                controller: _nameClientController,
                decoration: InputDecoration(
                  label: Text('اسم العميل'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: (value){
                  if(value!.isEmpty){
                    return "Data please";
                  }
                },
                controller: _PartsValue,
                decoration: InputDecoration(
                  label: Text(' قيمه القسط'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16)
                  ),
                ),
              ),
              SizedBox(height: 20,),
              TextFormField(
                keyboardType: TextInputType.datetime,
                validator: (value){
                  if(value!.isEmpty){
                    return "Data please";
                  }
                },
                controller: _DateTimeController,
                decoration: InputDecoration(
                  label: Text(' تاريخ القسط'),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blue.shade900
                ),
                child: MaterialButton(
                  onPressed: (){
                    if(formKey.currentState!.validate()){

                      SaveClient();

                      _nameClientController.text = "";
                      _PartsValue.text = "";
                      _DateTimeController.text = "";

                      // Navigator.push(context, MaterialPageRoute(builder: (context){
                      //   return Parts();
                      // }));

                    }
                  } ,
                  child: Text('دفع' , style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),),),
              ) ,

            ],
          ),
        ),
      ),
    );
  }
}
