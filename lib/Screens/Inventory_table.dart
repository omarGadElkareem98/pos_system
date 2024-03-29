  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobilysystem/Screens/Reports.dart';
import 'package:mobilysystem/models/Inventory_Model.dart';
import 'package:mobilysystem/models/userInventory.dart';

import '../models/Inventory_Model.dart';

class InventoryTable extends StatefulWidget {

  String clientNumber;
  final String client;
     InventoryTable({super.key , required this.client , required this.clientNumber});


  @override
  State<InventoryTable> createState() => _InventoryTableState();
}

class _InventoryTableState extends State<InventoryTable> {




  TextEditingController _pickeddate = TextEditingController();
  TextEditingController _numberClientController  = TextEditingController();

  TextEditingController _faiseController = TextEditingController();
  TextEditingController _IdNumberController = TextEditingController();

 //   CollectionReference userPayments = FirebaseFirestore.instance.collection("userPayments");

  // SaveClientPayment () async{
  //
  //   await  userPayments.add({
  //
  //     "Date" : _pickeddate.text,
  //
  //     "FaiseMoney" : _faiseController.text,
  //     "IdNumber" : _IdNumberController.text
  //
  //   });
  // }

  userPayment({ name ,  numberClient })
  {
    FirebaseFirestore.instance.collection('Clients').get().then((value)
    {
      value.docs.forEach((element)
      {
        if(element.data()['numberClient']==numberClient) {
          element.reference.collection(name).add(
              {
                "Date" : _pickeddate.text,

                  "FaiseMoney" : _faiseController.text,
                  "IdNumber" : _IdNumberController.text
              });
        }
      });
    });
  }


  payInventory({ name ,  numberClient })
  {
    FirebaseFirestore.instance.collection('Clients').get().then((value)
    {
      value.docs.forEach((element)
      {
        if(element.data()['numberClient']==numberClient) {
          element.reference.collection(numberClient).add(
              {
                "Date" : _pickeddate.text,
                "FaiseMoney" : _faiseController.text,
                "IdNumber" : _IdNumberController.text
              });
        }
      });
    });
  }

  userPaymentss(String name)
  {
    FirebaseFirestore.instance.collection('clients').get().then((value)
    {
      value.docs.forEach((element)
      {
        if(element.data()['name']==name) {
          element.reference.collection(name).add(
              {
                'cash':3000,
                'number':'01001242122',
              });
        }
      });
    });
  }



  List names = [];
  List<InventoryModel> InventoryList = [];
  List<UserInventory> UserInventoryList = [];
  getClientPayments({ name , numberClient})
  {
    InventoryList= [];
    FirebaseFirestore.instance.collection('Clients').get().then((value)
    {
      value.docs.forEach((element)
      {
        if(element.data()['numberClient']==numberClient) {
          element.reference.collection(name).get().then((value)
          {
            value.docs.forEach((element)
            {

              InventoryList.add(InventoryModel(name : element.data()['InvoicenameProduct'],
                 Date:  element.data()['Date'],
                  PriceProduct:  element.data()['DierctPrice'],
                  PriceValue: element.data()['PriceParts'],

              ));
              setState(
                      () {

              });
            });
          });
        }
      });
    });




  }


  getUserInventoryList({ name , numberClient})
  {
    UserInventoryList= [];
    FirebaseFirestore.instance.collection('Clients').get().then((value)
    {
      value.docs.forEach((element)
      {
        if(element.data()['numberClient']==numberClient) {
          element.reference.collection(numberClient).orderBy('Date',descending: false).get().then((value)
          {
            value.docs.forEach((element)
            {

              UserInventoryList.add(UserInventory(IdNumber: element.data()['IdNumber'],
                Date:  element.data()['Date'],
                FaiseMoney: element.data()['FaiseMoney'],
              ));
              setState(
                      () {

                  });
            });
          });
        }
      });
    });




  }

  @override
  void initState() {
    // TODO: implement initState
   getClientPayments(numberClient: widget.clientNumber, name: widget.client);
   getUserInventoryList(numberClient:widget.clientNumber, name: widget.client);
    print(InventoryList);
    super.initState();
  }
  Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text(widget.client),
        ),
        body:  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Table(
            children: const [
              TableRow(
                  children: [
                    TableCell(child: Center(child: Text("اسم المنتج"))),
                    TableCell(child: Center(child: Text("سعر الكاش"))),
                    TableCell(child: Center(child: Text("تاريخ الشراء"))),
                    TableCell(child: Center(child: Text(" سعر القسط"))),
                  ]
              ),
    ],
    ),
          SizedBox(
            width: double.infinity,
            child: Table(
            children:List.generate(InventoryList.length,
            (index) => TableRow(
            children: [InventoryList[index].name??'',
                InventoryList[index].PriceProduct,
                InventoryList[index].Date,
                InventoryList[index].PriceValue
                ].map((cell) {
                return Padding(
                padding:  EdgeInsets.all(12),
                child: Center(child: Text(cell.toString(),style:TextStyle(fontWeight: FontWeight.normal,),)),
                );
                }).toList(),
                )
            ),
            ),
          ),
          SizedBox(height: 20,),
          Container(
            height: 2,
            width: double.infinity,
            color: Colors.black,
          ),
          SizedBox(height: 20,),
          Table(
            children: const [
              TableRow(
                  children: [
                    TableCell(child: Center(child: Text("رقم الايصال"))),
                    TableCell(child: Center(child: Text("قيمة القسط"))),
                    TableCell(child: Center(child: Text("تاريخ الدفع"))),
                  ]
              ),
            ],
          ),
          SizedBox(
            width: double.infinity,
            child: Table(
              children:List.generate(UserInventoryList.length,
                      (index) => TableRow(
                    children: [
                      UserInventoryList[index].IdNumber,
                      UserInventoryList[index].FaiseMoney??'',
                      UserInventoryList[index].Date,
                    ].map((cell) {
                      return Padding(
                        padding:  EdgeInsets.all(12),
                        child: Center(child: Text(cell.toString(),style:TextStyle(fontWeight: FontWeight.normal,),)),
                      );
                    }).toList(),
                  )
              ),
            ),
          ),
          Spacer(),
          Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: MaterialButton(onPressed: () async {
                await  showDialog(context: context,  builder: (context){
                  return AlertDialog(
                    content: Card(
                      color: Colors.white,


                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [


                              TextFormField(
                                enabled: false,
                                keyboardType: TextInputType.number,
                                controller: _numberClientController,
                                decoration: InputDecoration(
                                    hintText: widget.clientNumber,
                                    border: OutlineInputBorder(

                                    )
                                ),
                              ),

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
                                     payInventory(name: widget.client , numberClient: widget.clientNumber);
                              //      userPayment(name: widget.client , numberClient: widget.clientNumber);
                               //     getClientPayments(numberClient: widget.clientNumber, name: widget.client);
                                      getUserInventoryList(numberClient: widget.clientNumber, name: widget.client);
                                      Navigator.pop(context);
                                  } , color: Colors.blue.shade900, child: Text('ادفع' , style: TextStyle(
                                      color: Colors.white
                                  ),),),
                                ),
                              )


                            ],
                          ),
                        ),
                      ),
                    ),

                  );
                });
              } , minWidth: 100, color: Colors.blue.shade900, child: Text('تسديد' , style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20
              ),),),
            ),
            SizedBox(width: 20,),
            Expanded(
              child: MaterialButton(onPressed: (){
                Navigator.push(context, MaterialPageRoute(builder: (context){
                  return Reports();
                }));
              } , minWidth: 100, color: Colors.blue.shade900, child: Text('تقرير', style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 20
              ),),),
            ),
          ],
        )
      ],
      )));
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

// class CoulmnItem extends StatelessWidget {
//   List<InventoryModel> inventoryList;
//
//    CoulmnItem(List<InventoryModel> this.inventoryList, {super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Column(
//
//       children: [
//
//
//
//         Padding(
//           padding: const EdgeInsets.all(8.0),
//           child: Table(
//
//             children: [
//               TableRow(
//                   children: [
//                     TableCell(child: Center(child: Text("تاريخ الشراء"))),
//                     TableCell(child: Center(child: Text("اسم المنتج"))),
//                     TableCell(child: Center(child: Text("السعر"))),
//                     TableCell(child: Center(child: Text("قيمه القسط"))),
//                   ]
//               ),
//
//               TableRow(
//                   children: [
//                     TableCell(child: Center(child: Text("${InventoryList.elementAt(index)['Data']}"))),
//                     TableCell(child: Center(child: Text("${widget.client['InvoicenameProduct']}"))),
//                     TableCell(child: Center(child: Text("${widget.client['FinalPrice']}"))),
//                     TableCell(child: Center(child: Text("${widget.client['PartsMoney']}"))),
//                   ]
//               ),
//
//
//             ],
//           ),
//         ),
//
//         Divider(thickness: 5,),
//
//         Row(
//           mainAxisAlignment: MainAxisAlignment.spaceAround,
//           children: [
//             Text("موعد السداد"),
//             Text("قيمه القسط "),
//             Text("تاريخ الدفع"),
//             Text("مدفوع"),
//           ],
//         ),
//
//         // SizedBox(
//         //   height: 400,
//         //   child: ListView.builder(
//         //     itemCount: InventoryList.length,
//         //       itemBuilder: (context , index){
//         //         return Row(
//         //           children: [
//         //
//         //           ],
//         //         );
//         //       }),
//         // ),
//
//         Spacer(),
//
//         Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Expanded(
//               child: MaterialButton(onPressed: () async {
//                 await  showDialog(context: context,  builder: (context){
//                   return AlertDialog(
//                     content: Card(
//                       color: Colors.white,
//
//
//                       child: Padding(
//                         padding: const EdgeInsets.all(8.0),
//                         child: SingleChildScrollView(
//                           child: Column(
//                             mainAxisSize: MainAxisSize.min,
//                             children: [
//
//
//                               TextFormField(
//                                 enabled: false,
//                                 keyboardType: TextInputType.number,
//                                 controller: _numberClientController,
//                                 decoration: InputDecoration(
//                                     hintText: widget.client['numberClient'],
//                                     border: OutlineInputBorder(
//
//                                     )
//                                 ),
//                               ),
//
//                               TextFormField(
//                                 keyboardType: TextInputType.number,
//                                 controller: _IdNumberController,
//                                 decoration: InputDecoration(
//                                     hintText: " رقم الايصال ",
//                                     border: OutlineInputBorder(
//
//                                     )
//                                 ),
//                               ),
//
//                               SizedBox(height: 12,),
//
//                               InkWell(
//                                 onTap : (){
//                                   _SelectDate();
//                                 },
//                                 child: TextFormField(
//                                   controller: _pickeddate,
//
//                                   decoration: InputDecoration(
//                                       hintText: "تاريخ القسط",
//                                       enabled: false,
//                                       filled: true,
//                                       prefixIcon: Icon(Icons.date_range),
//                                       border: OutlineInputBorder(
//
//                                       )
//                                   ),
//                                 ),
//                               ),
//
//                               const    SizedBox(height: 12,),
//
//                               TextFormField(
//                                 keyboardType: TextInputType.number,
//                                 controller: _faiseController,
//                                 decoration: InputDecoration(
//                                     hintText: " مبلغ القسط",
//                                     border: OutlineInputBorder(
//
//                                     )
//                                 ),
//                               ),
//
//                               SizedBox(height: 12,),
//
//                               Padding(
//                                 padding: const EdgeInsets.all(8.0),
//                                 child: Container(
//                                   width: double.infinity,
//                                   child: MaterialButton(onPressed: (){
//
//                                     userPayment(name: widget.client['nameClient'] , numberClient: widget.client['numberClient']);
//                                     getClientPayments(numberClient: widget.clientNumber, name: widget.client['nameClient']);
//
//                                   } , color: Colors.blue.shade900, child: Text('ادفع' , style: TextStyle(
//                                       color: Colors.white
//                                   ),),),
//                                 ),
//                               )
//
//
//                             ],
//                           ),
//                         ),
//                       ),
//                     ),
//
//                   );
//                 });
//               } , minWidth: 100, color: Colors.blue.shade900, child: Text('تسديد' , style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                   fontSize: 20
//               ),),),
//             ),
//             SizedBox(width: 20,),
//             Expanded(
//               child: MaterialButton(onPressed: (){
//                 Navigator.push(context, MaterialPageRoute(builder: (context){
//                   return Reports();
//                 }));
//               } , minWidth: 100, color: Colors.blue.shade900, child: Text('تقرير', style: TextStyle(
//                   fontWeight: FontWeight.bold,
//                   color: Colors.white,
//                   fontSize: 20
//               ),),),
//             ),
//           ],
//         )
//       ],
//     );
//   }
// }


  //
  // Padding(
  // padding: const EdgeInsets.all(8.0),
  // child: Column(
  //
  // children: [
  //
  //
  //
  // Expanded(
  // child: Padding(
  // padding: const EdgeInsets.all(8.0),
  // child: Table(
  //
  // children: [
  // TableRow(
  // children: [
  // TableCell(child: Center(child: Text("تاريخ الشراء"))),
  // TableCell(child: Center(child: Text("اسم المنتج"))),
  // TableCell(child: Center(child: Text("السعر"))),
  // TableCell(child: Center(child: Text("قيمه القسط"))),
  // ]
  // ),
  //
  // TableRow(
  // children: [
  // TableCell(child: Center(child: Text("${widget.client['Data']}"))),
  // TableCell(child: Center(child: Text("${widget.client['InvoicenameProduct']}"))),
  // TableCell(child: Center(child: Text("${widget.client['FinalPrice']}"))),
  // TableCell(child: Center(child: Text("${widget.client['PartsMoney']}"))),
  // ]
  // ),
  //
  //
  // ],
  // ),
  // ),
  // ),
  // Divider(thickness: 5,),
  //
  // Row(
  // mainAxisAlignment: MainAxisAlignment.center,
  // children: [
  // Expanded(
  // child: MaterialButton(onPressed: () async {
  // await  showDialog(context: context,  builder: (context){
  // return AlertDialog(
  // content: Card(
  // color: Colors.white,
  //
  //
  // child: Padding(
  // padding: const EdgeInsets.all(8.0),
  // child: Column(
  // mainAxisSize: MainAxisSize.min,
  // children: [
  // TextFormField(
  // keyboardType: TextInputType.number,
  // controller: _IdNumberController,
  // decoration: InputDecoration(
  // hintText: " رقم الايصال ",
  // border: OutlineInputBorder(
  //
  // )
  // ),
  // ),
  //
  // SizedBox(height: 12,),
  //
  // InkWell(
  // onTap : (){
  // _SelectDate();
  // },
  // child: TextFormField(
  // controller: _pickeddate,
  //
  // decoration: InputDecoration(
  // hintText: "تاريخ القسط",
  // enabled: false,
  // filled: true,
  // prefixIcon: Icon(Icons.date_range),
  // border: OutlineInputBorder(
  //
  // )
  // ),
  // ),
  // ),
  //
  // const    SizedBox(height: 12,),
  //
  // TextFormField(
  // keyboardType: TextInputType.number,
  // controller: _faiseController,
  // decoration: InputDecoration(
  // hintText: " مبلغ القسط",
  // border: OutlineInputBorder(
  //
  // )
  // ),
  // ),
  //
  // SizedBox(height: 12,),
  //
  // Padding(
  // padding: const EdgeInsets.all(8.0),
  // child: Container(
  // width: double.infinity,
  // child: MaterialButton(onPressed: (){
  // SaveClientPayment();
  // } , color: Colors.blue.shade900, child: Text('ادفع' , style: TextStyle(
  // color: Colors.white
  // ),),),
  // ),
  // )
  //
  //
  // ],
  // ),
  // ),
  // ),
  //
  // );
  // });
  // } , minWidth: 100, color: Colors.blue.shade900, child: Text('تسديد' , style: TextStyle(
  // fontWeight: FontWeight.bold,
  // color: Colors.white,
  // fontSize: 20
  // ),),),
  // ),
  // SizedBox(width: 20,),
  // Expanded(
  // child: MaterialButton(onPressed: (){
  // Navigator.push(context, MaterialPageRoute(builder: (context){
  // return Reports();
  // }));
  // } , minWidth: 100, color: Colors.blue.shade900, child: Text('تقرير', style: TextStyle(
  // fontWeight: FontWeight.bold,
  // color: Colors.white,
  // fontSize: 20
  // ),),),
  // ),
  // ],
  // )
  // ],
  // ),
  // ),
