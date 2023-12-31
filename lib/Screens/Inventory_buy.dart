
  import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Widgets/Inventory_Sale_Widget.dart';
import 'HomeScreen.dart';

class InventoryBuy extends StatefulWidget {
    const InventoryBuy({super.key});

    @override
    State<InventoryBuy> createState() => _InventoryBuyState();
  }

  class _InventoryBuyState extends State<InventoryBuy> {
    @override
    Widget build(BuildContext context) {
      return SafeArea(
        child: Scaffold(

          body:   Padding(
            padding:  EdgeInsets.only(),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: double.infinity,
                    height: 150,
                    decoration: BoxDecoration(
                        color: Colors.blue.shade900
                    ),
                    child:  Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              GestureDetector(
                                  onTap : (){
                                    Navigator.push(context, MaterialPageRoute(builder: (context){
                                      return HomeScreen();
                                    }));
                                  } ,
                                  child: Icon(Icons.arrow_back , color: Colors.white,)),
                              Text("فاتوره شراء" , style: TextStyle(color: Colors.white , fontSize: 22),),
                              Icon(Icons.print , color: Colors.white,),



                            ],
                          ),
                        ),

                        SizedBox(height: 50,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [

                            Text("نوع البيع" , style: TextStyle(color: Colors.white),),

                            Row(
                              children: [
                                Text("اجل" , style: TextStyle(color: Colors.white),),
                                Icon(Icons.check_box_outline_blank_outlined , color: Colors.white,)
                              ],
                            ),
                            Row(
                              children: [
                                Text("كاش" , style: TextStyle(color: Colors.white),),
                                Icon(Icons.check_box_outline_blank_outlined , color: Colors.white,)
                              ],
                            ),



                          ],
                        ),



                      ],
                    ),
                  ),
                  SizedBox(height: 15,),
                  SearchBar(
                    hintText: 'بيع منتح',

                  ),
                  SizedBox(height: 30,),
                  Padding(
                    padding: const EdgeInsets.only(right: 20 , left: 20),
                    child: Container(
                      decoration: BoxDecoration(
                          color: Colors.deepOrangeAccent.shade100,
                          borderRadius: BorderRadius.circular(16)
                      ),
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 20 , right: 20),
                            child: Row(
                              children: [
                                Text("اجمالي الفاتوره: 3000", style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                          ),
                          SizedBox(height: 12,),
                          Padding(
                            padding: const EdgeInsets.only(left: 20 , right: 20),
                            child: Row(
                              children: [
                                Text("نوغ الفاتوره: كاش", style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold
                                ),)
                              ],
                            ),
                          ),

                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 600,
                    child: ListView.builder(itemBuilder: (context , index){
                      return InventoryItem();
                    }),
                  ),

                ],
              ),
            ),
          ),

        ),
      );
    }
  }
