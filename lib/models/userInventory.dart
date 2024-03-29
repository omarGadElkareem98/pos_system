
import 'package:cloud_firestore/cloud_firestore.dart';

class UserInventory
{
  String ?FaiseMoney;
  String ?Date;
  String ? IdNumber;



  UserInventory({this.FaiseMoney , this.Date , this.IdNumber , });


  UserInventory.fromJson(Map<String , dynamic>Json){

    FaiseMoney =  Json['FaiseMoney'];
    Date =  Json['Date'];
    IdNumber = Json['IdNumber'];

  }



}