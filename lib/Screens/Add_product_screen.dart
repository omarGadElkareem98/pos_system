




import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mobilysystem/Screens/StockScreen.dart';

class AddProduct extends StatefulWidget {


  static const idScreen = "AddProduct";

    const AddProduct({super.key});

    @override
    State<AddProduct> createState() => _AddProductState();
  }

  class _AddProductState extends State<AddProduct> {

  CollectionReference Products = FirebaseFirestore.instance.collection("Products");


    SaveProducts () async {

     await Products.add({
        "ProductName" : nameProductController.text,
        "PriceProduct" : PriceProductController.text,
        "PriceBuy" : PriceBuyProductController.text,
        "numberProduct" : numberProductController.text,

      }).then((value) => print("Product Added")).catchError((error) => print(error) );
    }

  TextEditingController nameProductController = TextEditingController();
  TextEditingController PriceProductController = TextEditingController();
  TextEditingController PriceBuyProductController = TextEditingController();
  TextEditingController numberProductController = TextEditingController();
  var formKey = GlobalKey<FormState>();
    @override





    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(title: const  Text("اضافه منتج"),),
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
                      label: Text('اسم المنتج'),
              
                      hintText: 'اسم المنتج',
                      border: OutlineInputBorder(
              
                      ),
              
                    ),
              
                    controller: nameProductController,
              
                  ),
               const    SizedBox(height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value!.isEmpty){
                        return "البيانات مطلوبه ";
                      }
                    },
              
                    controller: PriceProductController,
                    decoration: InputDecoration(
                        label: Text('  سعر المنتج'),
                        hintText: 'سعر  المنتج',
                        border: OutlineInputBorder()
                    ),
                  ),
                const   SizedBox(height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value!.isEmpty){
                        return "البيانات مطلوبه ";
                      }
                    },
                    controller: PriceBuyProductController,
                    decoration: InputDecoration(
                        label: Text('  سعر الشراء'),
                        hintText: 'سعر  الشراء',
                        border: OutlineInputBorder()
                    ),
                  ),
               const    SizedBox(height: 20,),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value!.isEmpty){
                        return "البيانات مطلوبه ";
                      }
                    },
                    controller: numberProductController,
                    decoration: InputDecoration(
                        label: Text(' عدد القطغ '),
                        hintText: ' عدد القطغ',
                        border: OutlineInputBorder()
                    ),
                  ),
                const   SizedBox(height: 20,),
              
                  Container(
                    width: double.infinity,

                     
                      child: ElevatedButton(
                          onPressed: (){
              
                           if(formKey.currentState!.validate()){
                             SaveProducts();
                           }
                           nameProductController.text = "";
                           PriceProductController.text = "";
                           PriceBuyProductController.text = "";
                           numberProductController.text = "";

                           Navigator.push(
                             context,
                             MaterialPageRoute(builder: (context){
                               return StockScreen();
                             })

                           );
                           
              

                          },
                          style: ButtonStyle(
                            backgroundColor: MaterialStatePropertyAll(Colors.blue)
                          ),

                          child: const  Text('اضافه منتج' ,style: TextStyle(
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
