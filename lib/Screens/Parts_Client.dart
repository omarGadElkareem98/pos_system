
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilysystem/Screens/Parts.dart';

class PartsClient extends StatelessWidget {
   PartsClient({super.key});


  TextEditingController _nameClientController = TextEditingController();
  TextEditingController _MoneyValueController = TextEditingController();
  TextEditingController _dateTimeController = TextEditingController();

  var FormKey = GlobalKey<FormState>();

  SaveData(){
   CollectionReference ClientData = FirebaseFirestore.instance.collection("ClientDataParts");

   ClientData.add({
     "nameClient" : _nameClientController.text,
     "MoneyValue" : _MoneyValueController.text,
     "dateTime" : _dateTimeController.text
   });


}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Form(
          key: FormKey,
          child: Column(
            children: [

              SizedBox(height: 16,),
              TextFormField(
                controller: _nameClientController,
                validator: (value){
                  if(value!.isEmpty){
                    return "Data Please";
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(32)
                  ),
                  hintText: "اسم الغميل "
                ),
              ),
              SizedBox(height: 18,),
              TextFormField(
                keyboardType: TextInputType.number,
                validator: (value){
                  if(value!.isEmpty){
                    return "Data Please";
                  }
                },
                controller: _MoneyValueController,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)
                  ),
                  hintText: " قيمه القسط المتاخر "
              ),),
              SizedBox(height: 18,),
              TextFormField(
                controller: _dateTimeController,
                validator: (value){
                  if(value!.isEmpty){
                    return "Data Please";
                  }
                },
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(32)
                  ),
                  hintText: " تاريخ الدفع "
              ),),

            const   SizedBox(height: 18,),

              Container(
                width: double.infinity,
                  decoration: BoxDecoration(

                  ),
                  child: MaterialButton(onPressed: (){
                    if(FormKey.currentState!.validate()){
                      SaveData();
                      _nameClientController.text = "";
                      _MoneyValueController.text = "";
                      _dateTimeController.text = "";
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return PartsScreen();
                      }));
                    }
                  } , color: Colors.blue.shade900, child: Text('اضافه' , style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold
                  ),),))

            ],
          ),
        ),
      ),
    );
  }
}
