
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilysystem/Screens/BankScreen.dart';

class BankDetails extends StatelessWidget {
   BankDetails({super.key});
   TextEditingController _nameProceesController = TextEditingController();
   TextEditingController _MoneyValue = TextEditingController();
   TextEditingController _DateController = TextEditingController();
   TextEditingController _NotesController = TextEditingController();
   TextEditingController _BankValueController = TextEditingController();

  @override
  CollectionReference BankData = FirebaseFirestore.instance.collection("BankData");

   SaveMoney () async{

     await  BankData.add({
       "nameProcess" : _nameProceesController.text,
       "PartsValue" : _MoneyValue.text,
       "DateTime" : _DateController.text,
       "Notes" : _NotesController.text,
       "BankValue":_BankValueController.text
     });
   }
  var formKey = GlobalKey<FormState>();
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('اضافه مبلغ للخزنه'),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 20 , right: 20),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
            
              children: [
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.number,

                  controller: _BankValueController,
                  decoration: InputDecoration(
                    label: Text(' قيمه الخزنه  '),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16)
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.text,
                  validator: (value){
                    if(value!.isEmpty){
                      return "Data please";
                    }
                  },
                  controller: _nameProceesController,
                  decoration: InputDecoration(
                    label: Text(' نوع الصرف  '),
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
                  controller: _MoneyValue,
                  decoration: InputDecoration(
                    label: Text(' قيمه المبلغ '),
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
                  controller: _DateController,
                  decoration: InputDecoration(
                    label: Text(' تاريخ الدفع'),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                TextFormField(
                  keyboardType: TextInputType.text,
            
                  controller: _NotesController,
                  decoration: InputDecoration(
                    label: Text('  ملاحظات '),
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
            
                        SaveMoney();
            
                        _nameProceesController.text = "";
                        _MoneyValue.text = "";
                        _DateController.text = "";
                        _NotesController.text = "";
            
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return BankScreen();
                        }));
            
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
      ),
    );
  }
}
