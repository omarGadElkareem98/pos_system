
  import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:mobilysystem/Screens/Inventory_detail.dart';

class ClientInventroy extends StatefulWidget {


  static const  idScreen = "ClientInventroy";

  String ClientNumber;
  String name;


     ClientInventroy({super.key , required this.name , required this.ClientNumber});

    @override
    State<ClientInventroy> createState() => _ClientInventroyState();
  }

  class _ClientInventroyState extends State<ClientInventroy> {


  TextEditingController nameClientControllr = TextEditingController();
  TextEditingController InvicenameProductController = TextEditingController();
  TextEditingController pricePartController = TextEditingController();
  TextEditingController priceDierctController = TextEditingController();
  TextEditingController MoneyController = TextEditingController();
  TextEditingController MonthesNumberController = TextEditingController();
  TextEditingController HanderdParsentController = TextEditingController();
  TextEditingController PriceController = TextEditingController();
  TextEditingController AfterPriceController = TextEditingController();
  TextEditingController PartsMoneyController = TextEditingController();
  TextEditingController _pickeddate = TextEditingController();
  TextEditingController ClientNumberController = TextEditingController();

  DateTime _dateTime = DateTime.now();
  bool VisiableForm = false;

  var formKey = GlobalKey<FormState>();
  CollectionReference InventroyData = FirebaseFirestore.instance.collection("inventroyData");



  userPaymentss()
  {
    FirebaseFirestore.instance.collection('Clients').get().then((value)
    {
      value.docs.forEach((element)
      {
        if(element.data()['numberClient']==widget.ClientNumber) {
          element.reference.collection(widget.name).add(
              {
                "nameClient" : widget.name,
                "numberClient" : widget.ClientNumber,
                "InvoicenameProduct" : InvicenameProductController.text,
                "PriceParts" : pricePartController.text,
                "DierctPrice" : priceDierctController.text,
                "Money" : MoneyController.text,
                "MounthsNumber" : MonthesNumberController.text,
                "Parsent" : HanderdParsentController.text,
                "Price" : PriceController.text,
                "FinalPrice" : AfterPriceController.text,
                "PartsMoney" : PartsMoneyController.text,
                "Date" : _pickeddate.text,
              });
        }
      });
    });
  }

  SaveInventory()async{

    await InventroyData.add({
      "nameClient" : widget.name,
      "numberClient" : widget.ClientNumber,
      "InvoicenameProduct" : InvicenameProductController.text,
      "PriceParts" : pricePartController.text,
      "DierctPrice" : priceDierctController.text,
      "Money" : MoneyController.text,
      "MounthsNumber" : MonthesNumberController.text,
      "Parsent" : HanderdParsentController.text,
      "Price" : PriceController.text,
      "FinalPrice" : AfterPriceController.text,
      "PartsMoney" : PartsMoneyController.text,
      "Date" : _pickeddate.text,


    })  ;

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


    @override



    Widget build(BuildContext context) {
      return Scaffold(
        appBar: AppBar(
          title: Text('اضافه فاتوره'),
         actions: [
           Padding(
             padding: const EdgeInsets.all(8.0),
             child: Icon(Icons.person),
           )
         ],

        ),
        body:  Padding(
          padding: const EdgeInsets.all(8.0),
          child: SingleChildScrollView(
            child: Visibility(
              visible: true,
              child: Form(
                key: formKey,
                child: Column(
                  children: [

                    TextFormField(


                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)
                        ),
                        label: Text(widget.ClientNumber),
                        hintText: widget.ClientNumber,


                      ),
                      controller: ClientNumberController ,
                    ),
                    SizedBox(height: 20,),
                    TextFormField(

                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(16)
                        ),
                        label: Text(widget.name),
                        hintText: widget.name,


                      ),
                      controller: nameClientControllr ,
                    ),
                    SizedBox(height: 20,),

                    TextFormField(
                      validator: (value){
                        if(value!.isEmpty){
                          return "البيانات مطلوبه";

                        }

                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16)
                        ),
                        label: Text('اسم الصنف'),
                        hintText: "اسم الصنف",


                      ),
                      controller: InvicenameProductController,
                    ),

                      SizedBox(height: 20,),
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(child: InkWell(
                            onTap: (){

                            },
                            child: TextFormField(

                              enabled: true,

                              controller: pricePartController,
                              validator:  (value){
                                if(value!.isEmpty){
                                  return "البيانات مطلوبه";

                                }
                              },
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(16)
                                ),
                                hintText: ' سعر القسط ',
                                label: Text(" سعر القسط ")
                              ),
                            ),
                          )),
                          SizedBox(width: 10,),
                          Expanded(child: TextFormField(
                            keyboardType: TextInputType.number,
                           validator:  (value){
                             if(value!.isEmpty){
                               return "البيانات مطلوبه";

                             }
                           },
                            controller: priceDierctController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16)
                                ),
                                hintText: 'سعر الكاش',
                                label: Text('سعر الكاش',)
                            ),
                          )),
                        ],
                      ),
                    ),
                    Divider(thickness: 2,),
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(child: TextFormField(
                            controller: MoneyController,
                            validator:  (value){
                              if(value!.isEmpty){
                                return "البيانات مطلوبه";

                              }
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16)
                                ),
                                hintText: 'مقدم ',
                                label: Text(' مقدم',)
                            ),
                          )),
                          SizedBox(width: 10,),
                          Expanded(child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator:  (value){
                              if(value!.isEmpty){
                                return "البيانات مطلوبه";

                              }
                            },
                            controller: MonthesNumberController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16)
                                ),
                                hintText: ' عدد الشهور',
                                label: Text(' عدد الشهور',)
                            ),
                          )),

                        ],
                      ),
                    ),
                    Divider(thickness: 2,),
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(child: TextFormField(
                            controller: HanderdParsentController,
                            validator:  (value){
                              if(value!.isEmpty){
                                return "البيانات مطلوبه";

                              }
                            },
                            keyboardType: TextInputType.number,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16)
                                ),
                                hintText: 'النسبه ',
                                label: Text(' النسبه',)
                            ),
                          )),
                          SizedBox(width: 10,),
                          Expanded(child: InkWell(
                            onTap: (){

                            },
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              enabled: true,
                              controller: PriceController,
                              validator:  (value){
                                if(value!.isEmpty){
                                  return "البيانات مطلوبه";

                                }
                              },
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(16)
                                  ),
                                  hintText: '  المطلوب',
                                  label: Text('   المطلوب ' , style: TextStyle(
                                    fontSize: 17,
                                    fontWeight: FontWeight.bold
                                  ),)
                              ),
                            ),
                          )),

                        ],
                      ),
                    ),
                    Divider(thickness: 2,),
                    Container(
                      width: double.infinity,
                      child: Row(
                        children: [
                          Expanded(child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator:  (value){
                              if(value!.isEmpty){
                                return "البيانات مطلوبه";

                              }
                            },
                            controller: AfterPriceController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16)
                                ),
                                hintText: 'السعر النهائي ',
                                label: Text(' السعر النهائي',)
                            ),
                          )),
                          SizedBox(width: 10,),
                          Expanded(child: TextFormField(
                            keyboardType: TextInputType.number,
                            validator:  (value){
                              if(value!.isEmpty){
                                return "البيانات مطلوبه";

                              }
                            },
                            controller: PartsMoneyController,
                            decoration: InputDecoration(
                                border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(16)
                                ),
                                hintText: '  قيمه القسط',
                                label: Text('  قيمه القسط',)
                            ),
                          )),

                        ],
                      ),
                    ),
                    Divider(thickness: 2,),
                    GestureDetector(
                      onTap: (){
                        _SelectDate();
                      },
                      child: TextFormField(
                        validator: (value){
                          if(value!.isEmpty)
                          {
                            return "Enter Data";
                          }
                        },
                        controller: _pickeddate,
                        enabled: false,
                        decoration: InputDecoration(
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(17)
                            )
                            ,
                            label: Text("تاريخ الشراء")


                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                   
                    
                    Container(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: (){
                          if(formKey.currentState!.validate())
                          {


                         userPaymentss();
                          Navigator.push(context, MaterialPageRoute(
                              builder: (context){
                                return InventoryDetail();
                              }));

                          }
                        } ,
                        color: Colors.blue.shade900,
                        child: Text("حفظ الفاتوره" , style: TextStyle(
                          color: Colors.white,
                          fontSize: 20
                        ),) ,
                      ),
                    )




                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
