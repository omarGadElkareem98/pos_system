  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilysystem/Screens/Reports.dart';

class InventoryTable extends StatefulWidget {

     InventoryTable({super.key , required this.client});

     final client;

  @override
  State<InventoryTable> createState() => _InventoryTableState();
}

class _InventoryTableState extends State<InventoryTable> {




  TextEditingController _pickeddate = TextEditingController();
  TextEditingController _faiseController = TextEditingController();
  TextEditingController _IdNumberController = TextEditingController();

    CollectionReference userPayments = FirebaseFirestore.instance.collection("userPayments");

  SaveClientPayment () async{

    await  userPayments.add({
      "Date" : _pickeddate.text,
      "FaiseMoney" : _faiseController.text,
      "IdNumber" : _IdNumberController.text

    });
  }



    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.client['nameClient']),
        ),
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [



              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Table(

                    children: [
                      TableRow(
                        children: [
                          TableCell(child: Center(child: Text("تاريخ الشراء"))),
                          TableCell(child: Center(child: Text("اسم المنتج"))),
                          TableCell(child: Center(child: Text("السعر"))),
                          TableCell(child: Center(child: Text("قيمه القسط"))),
                        ]
                      ),

                      TableRow(
                          children: [
                            TableCell(child: Center(child: Text("${widget.client['Data']}"))),
                            TableCell(child: Center(child: Text("${widget.client['InvoicenameProduct']}"))),
                            TableCell(child: Center(child: Text("${widget.client['FinalPrice']}"))),
                            TableCell(child: Center(child: Text("${widget.client['PartsMoney']}"))),
                          ]
                      ),


                    ],
                  ),
                ),
              ),
              Divider(thickness: 1,),

              Row(
                children: [
                  Expanded(
                      child: MaterialButton(onPressed: () async {
                  await  showDialog(context: context,  builder: (context){
                      return AlertDialog(
                       content: Card(
                         color: Colors.white,


                         child: Padding(
                           padding: const EdgeInsets.all(8.0),
                           child: Column(
                             mainAxisSize: MainAxisSize.min,
                             children: [
                               TextFormField(
                                 keyboardType: TextInputType.number,
                                 controller: _IdNumberController,
                                 decoration: InputDecoration(
                                     hintText: " رقم الايصال ",
                                     border: OutlineInputBorder(

                                     )
                                 ),
                               ),

                               SizedBox(height: 12,),

                               InkWell(
                                 onTap : (){
                                  _SelectDate();
                                 },
                                 child: TextFormField(
                                   controller: _pickeddate,

                                   decoration: InputDecoration(
                                     hintText: "تاريخ القسط",
                                     enabled: false,
                                     filled: true,
                                     prefixIcon: Icon(Icons.date_range),
                                     border: OutlineInputBorder(

                                     )
                                   ),
                                 ),
                               ),

                            const    SizedBox(height: 12,),

                               TextFormField(
                                 keyboardType: TextInputType.number,
                                 controller: _faiseController,
                                 decoration: InputDecoration(
                                     hintText: " مبلغ القسط",
                                     border: OutlineInputBorder(

                                     )
                                 ),
                               ),

                               SizedBox(height: 12,),

                               Padding(
                                 padding: const EdgeInsets.all(8.0),
                                 child: Container(
                                   width: double.infinity,
                                   child: MaterialButton(onPressed: (){
                                     SaveClientPayment();
                                   } , color: Colors.blue.shade900, child: Text('ادفع' , style: TextStyle(
                                     color: Colors.white
                                   ),),),
                                 ),
                               )


                             ],
                           ),
                         ),
                       ),

                      );
                    });
                  } , minWidth: 200, color: Colors.blue.shade900, child: Text('تسديد' , style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20
                  ),),)),
                  SizedBox(width: 20,),
                  Expanded(child: MaterialButton(onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context){
                        return Reports();
                      }));
                  } , minWidth: 200, color: Colors.blue.shade900, child: Text('تقرير', style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      fontSize: 20
                  ),),)),
                ],
              )
            ],
          ),
        ),
      );
    }



    Future <void> _SelectDate () async {

      DateTime ? Picked = await   showDatePicker(context: context,
          firstDate: DateTime(2024),
          lastDate: DateTime(2050),

      );

      if(Picked != null) {
        setState(() {
          _pickeddate.text = Picked.toString().split(" ")[0];
        });
      }

    }
}
