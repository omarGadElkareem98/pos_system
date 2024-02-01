
  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilysystem/Screens/BankDetails.dart';

class BankScreen extends StatefulWidget {
     BankScreen({super.key});

  @override
  State<BankScreen> createState() => _BankScreenState();
}

class _BankScreenState extends State<BankScreen> {
    List BankData = [];



    @override

    getBankData() async{
      QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection("BankData").get();

      BankData.addAll(querySnapshot.docs);

      setState(() {

      });


    }



    @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getBankData();
  }

    Widget build(BuildContext context ) {
      return Scaffold(
        appBar: AppBar(
          title: Text('الخزنه'),
        actions: [
         Row(
           children: [

             GestureDetector(
               onTap: (){

                },
               child: Text("اجمالي الخزنه" , style: TextStyle(
                   color: Colors.white,
                   fontSize: 20,
                   fontWeight: FontWeight.bold
               ),),
             ),

             Padding(
               padding: const EdgeInsets.all(8.0),
               child: Container(
                 decoration: BoxDecoration(
                   color: Colors.green.shade900
                 ),
                 child: MaterialButton(onPressed: (){} , child: Text('' , style: TextStyle(
                     color: Colors.white,
                     fontSize: 20,
                     fontWeight: FontWeight.bold
                 ),),),
               ),
             ),

           ],
         ),
        ],
        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
         Navigator.push(context, MaterialPageRoute(builder: (context){
           return BankDetails();
         }));
        } , child: Icon(Icons.add),),
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 600,
                child: ListView.builder(
                  itemCount: BankData.length,
                    itemBuilder: (context , index){
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ExpansionTile(
                        title: Row(
                          children: [
                            Text("${BankData[index]['nameProcess']}")
                          ],
          
                        ),
                        children: [
                          Column(
                            children: [
                              Text(" المبلغ ${BankData[index]['PartsValue']}"),
                              Text(" ملاجظات الصرف ${BankData[index]['Notes']}"),
                              Text(" تاريخ الصرف ${BankData[index]['DateTime']}"),
          
          
                            ],
                          ),
                        ],
                    ),
                  );
                }),
              )
            ],
          ),
        ),
      );
    }
}
