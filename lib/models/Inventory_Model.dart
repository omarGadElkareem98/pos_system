

import 'package:cloud_firestore/cloud_firestore.dart';

class InventoryModel
  {
    String ?name;
    String ?Date;
    String ? PriceProduct;
    String ? PriceValue;



    InventoryModel({this.name , this.Date , this.PriceProduct , this.PriceValue});


    InventoryModel.fromJson(Map<String , dynamic>Json){

      name =  Json['InvoicenameProduct'];
      Date =  Json['Date'];
      PriceProduct = Json['DierctPrice'];
      PriceValue = Json['PriceParts'];


    }



  }