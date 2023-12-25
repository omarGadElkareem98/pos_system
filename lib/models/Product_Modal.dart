
  class Products {
    int ?id ;
    String ?name;
    int ? Price;
    int ? BuyPrice;
    int ?numberProduct;

     productMap (){
       var mapping = Map<String , dynamic>();
       mapping ['id'] = id!;
       mapping ['name'] = name!;
       mapping ['Price'] = Price!;
       mapping ['BuyPrice'] = BuyPrice!;
       mapping ['numberProduct'] = numberProduct!;

       return mapping;

     }



  }