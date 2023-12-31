
  import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:mobilysystem/Screens/Inventory_detail.dart';

class ClientInventroy extends StatefulWidget {
    const ClientInventroy({super.key});

    @override
    State<ClientInventroy> createState() => _ClientInventroyState();
  }

  class _ClientInventroyState extends State<ClientInventroy> {



  TextEditingController InvicenameProductController = TextEditingController();
  TextEditingController pricePartController = TextEditingController();
  TextEditingController priceDierctController = TextEditingController();
  TextEditingController MoneyController = TextEditingController();
  TextEditingController MonthesNumberController = TextEditingController();
  TextEditingController HanderdParsentController = TextEditingController();
  TextEditingController PriceController = TextEditingController();
  TextEditingController AfterPriceController = TextEditingController();
  TextEditingController PartsMoneyController = TextEditingController();
  TextEditingController DateController = TextEditingController();

  int ?results = 0,num1= 0 ,num2 = 0 , num3 = 0;

  PricebeforeParts (){
    setState(() {
      num1 = int.parse(MoneyController.text);
      num2 = int.parse(priceDierctController.text);

      results = num2! - num1!;
    });
  }

  int ? PricePartsValue = 0;

  PriceParts (){
    setState(() {
      num1 = int.parse(PriceController.text);
      num2 = int.parse(HanderdParsentController.text);
      num3 = int.parse(MonthesNumberController.text);

      PricePartsValue = num1! * num2!  ~/num3!;
    });
  }






  DateTime _dateTime = DateTime.now();
  bool VisiableForm = false;

  var formKey = GlobalKey<FormState>();
  CollectionReference InventroyData = FirebaseFirestore.instance.collection("inventroyData");

  SaveInventory()async{
    await InventroyData.add({
      "InvoicenameProduct" : InvicenameProductController.text,
      "PriceParts" : pricePartController.text,
      "DierctPrice" : priceDierctController.text,
      "Money" : MoneyController.text,
      "MounthsNumber" : MonthesNumberController.text,
      "Parsent" : HanderdParsentController.text,
      "Price" : PriceController.text,
      "FinalPrice" : AfterPriceController.text,
      "PartsMoney" : PartsMoneyController.text,
      "Data" : DateController.text,


    }) .then((value) => {
      Container(
        width: double.infinity,
        child: Center(
          child: Dialog(
            child: Card(
              color: Colors.white,
              child: Text('تمت بنجاح' , style: TextStyle(color: Colors.green,fontSize: 20 , fontWeight: FontWeight.bold),),
            ),
          ),
        ),
      ),
    }).catchError( (error) => {
      Container(
        width: double.infinity,
        child: Dialog(
          child: Card(
            color: Colors.red,
            child: Text('حصل خطا' , style: TextStyle(color: Colors.redAccent,fontSize: 20 , fontWeight: FontWeight.bold),),
          ),
        ),
      ),
    } ) ;

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
                              PriceParts();
                            },
                            child: TextFormField(
                              enabled: false,
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
                                hintText: ' 0',
                                label: Text("$PricePartsValue")
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
                              PricebeforeParts();
                            },
                            child: TextFormField(
                              keyboardType: TextInputType.number,
                              enabled: false,
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
                                  label: Text('  $results المطلوب ' , style: TextStyle(
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
                      showDatePicker(context: context,
                          firstDate: DateTime(2008),
                          lastDate: DateTime(2025),
                        initialDate: DateTime.now(),
                      ).then((value) => {
                          setState (() => _dateTime = value! )
                      } );
                      },
                      child: TextFormField(
                        controller: DateController,

                        validator:  (value){
                          if(value!.isEmpty){
                            return "البيانات مطلوبه";

                          }
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16)
                          ),
                          label: Text(_dateTime.toString()),
                          hintText:  _dateTime.toString(),
                          labelStyle: TextStyle(color: Colors.black , fontWeight: FontWeight.bold)

                        ),
                      ),
                    ),
                    SizedBox(height: 12,),
                    Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16)
                        ),
                        child: MaterialButton(onPressed: (){
                          if(formKey.currentState!.validate()){
                            SaveInventory();



                          }
                          Center(
                            child: Container(
                              width: double.infinity,
                              child: Center(
                                child: Dialog(
                                  child: Card(
                                    color: Colors.white,
                                    child: Text('تمت بنجاح' , style: TextStyle(color: Colors.green,fontSize: 20 , fontWeight: FontWeight.bold),),
                                  ),
                                ),
                              ),
                            ),
                          );

                          Navigator.push(context, MaterialPageRoute(builder: (context){
                            return InventoryDetail();
                          }));


                        } ,  child: Text('اضافه الفاتوره' , style: TextStyle(color: Colors.white,fontSize: 20),),color: Colors.blue.shade900,)),




                  ],
                ),
              ),
            ),
          ),
        ),
      );
    }
  }
