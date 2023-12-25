
  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilysystem/Screens/Sales.dart';

class AddSales extends StatefulWidget {
    const AddSales({super.key});

    @override
    State<AddSales> createState() => _AddSalesState();
  }

  class _AddSalesState extends State<AddSales> {



    TextEditingController namesalesController = TextEditingController();
    TextEditingController PhoneNumberSalesController = TextEditingController();
    TextEditingController FeezController = TextEditingController();
    TextEditingController FeezBuyController = TextEditingController();
    TextEditingController DiscController = TextEditingController();

    FirebaseFirestore Firestore = FirebaseFirestore.instance;

    var formKey = GlobalKey<FormState>();

  CollectionReference Seller = FirebaseFirestore.instance.collection("Seller");

      SaveSeller () async  {

     await   Seller.add({
          "nameSaller" : namesalesController.text,
          "PhoneNumberSaller" : PhoneNumberSalesController.text,
          "Fezz" : FeezController.text,
          "Feezbuy" : FeezBuyController.text,
          "Minus" : DiscController.text,


        }).then((value) => showDialog(context: context, builder: (context){
          return Center(child: Container(
            width: 250,
            height: 120,
            child: Card(
              child: Center(child: Text("تم اضافه مورد جديد" ,style: TextStyle(color: Colors.green , fontWeight: FontWeight.bold , fontSize: 20),)),
            ),
          ));

     })).catchError((context)=> {
          showDialog(context: context, builder: (context) {
            return Center(child: Container(
              child: Card(
                child: Text(" حصل خطأ" ,style: TextStyle(color: Colors.red),),
              ),
            ));
          })
     });

      }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const  Text("اضافه عميل"),),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child:   SingleChildScrollView(
            child: Form(
              key: formKey ,
              child: Column(
                children: [
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return "البيانات مطلوبه ";
                      }
                    },

                    decoration: const InputDecoration(
                      label: Text('اسم المورد'),

                      hintText: 'اسم المورد',
                      border: OutlineInputBorder(

                      ),

                    ),

                    controller: namesalesController,

                  ),
                  const    SizedBox(height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value!.isEmpty){
                        return "البيانات مطلوبه ";
                      }
                    },

                    controller: PhoneNumberSalesController,
                    decoration: InputDecoration(
                        label: Text('  رقم موبايل'),
                        hintText: 'رقم  موبايل',
                        border: OutlineInputBorder()
                    ),
                  ),
                  const   SizedBox(height: 20,),
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return "البيانات مطلوبه ";
                      }
                    },
                    controller: FeezController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        label: Text('  دفعت كام   '),
                        hintText: '   ',
                        border: OutlineInputBorder()
                    ),
                  ),
                  const    SizedBox(height: 20,),
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return "البيانات مطلوبه ";
                      }
                    },
                    controller: FeezBuyController ,
                    decoration: InputDecoration(
                        label: Text(' هو ليه كام   '),
                        hintText: '  ',
                        border: OutlineInputBorder()
                    ),
                  ),
                  const   SizedBox(height: 20,),
                  TextFormField(
                    validator: (value){
                      if(value!.isEmpty){
                        return "البيانات مطلوبه ";
                      }
                    },
                    controller: DiscController,
                    decoration: InputDecoration(
                        label: Text(' الباقي  '),
                        enabled: true,
                        hintText: '',
                        border: OutlineInputBorder()
                    ),
                  ),

                  const   SizedBox(height: 20,),
                  Container(
                      width: double.infinity,

                      child: ElevatedButton(
                          onPressed: (){

                            if(formKey.currentState!.validate()){
                              SaveSeller();
                            }

                            namesalesController.text = "";
                            PhoneNumberSalesController.text = "";
                            FeezBuyController.text = "";
                            DiscController.text = "";
                            FeezController.text = "";

                            Navigator.push(context, MaterialPageRoute(builder: (context){
                              return Sales();
                            }));

                          },
                          style: const ButtonStyle(
                              backgroundColor: MaterialStatePropertyAll(
                                  Colors.teal
                              )
                          ),
                          child: const  Text('اضافه مورد' ,style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold
                          ),)))


                ],
              ),
            ),
          ),
        ),
      );
    }
  }
