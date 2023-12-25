
  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilysystem/Screens/Add_product_screen.dart';

class StockScreen extends StatefulWidget {
    const StockScreen({super.key});

    @override
    State<StockScreen> createState() => _StockScreenState();
  }

  class _StockScreenState extends State<StockScreen> {


  List Products = [];



  String nameProduct = "";
  String PriceProduct = "" ;
  String PriceBuy = "" ;
  var numberProduct = "" ;
  

  FirebaseFirestore firestore = FirebaseFirestore.instance;


  getProductData () async {

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('Products').get();

    Products.addAll(querySnapshot.docs);

    setState(() {

    });

  }


  @override
  void initState() {

    // TODO: implement initState
      getProductData();
    super.initState();
  }
    @override



    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('المحزن'),

          actions: [
             Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                   Text(" احمالى المخزن :- " , style: TextStyle(color: Colors.white),),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text( "", style: TextStyle(color: Colors.white ,fontWeight: FontWeight.bold)),
                  ),
                ],
              ),
            ),
          ],

        ),
        floatingActionButton: FloatingActionButton(onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context){
            return AddProduct();
          }));
        } , child: Icon(Icons.add),),
        body: ListView.builder(

          itemCount: Products.length,
          itemBuilder: (BuildContext context,  index) {

            return  Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                color: Colors.grey.shade300,
                child: ExpansionTile( title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text("${Products[index]['ProductName']}"),

                    Icon(Icons.delete,color: Colors.redAccent, size: 25,),

                    Icon(Icons.edit , color: Colors.blue,)
                  ],
                ) , children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text(  " سعر المنتج:-${Products[index]['PriceProduct']}"),
                          SizedBox(width: 20,),
                          Text(  " سعر الشراء:-${Products[index]['PriceBuy']}"),
                          SizedBox(width: 20,),
                          Text(" عدد القطع ${Products[index]['numberProduct']}")
                        ],
                      ),
                    )
                ],  ),
              ),
            );
          },

        )
      );
    }
  }
