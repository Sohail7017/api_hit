import 'dart:convert';

import 'package:clasico_291/models/product_api.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ProductsPage extends StatefulWidget{
  @override
  State<ProductsPage> createState() => _ProductsPageState();
}

class _ProductsPageState extends State<ProductsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
          backgroundColor: Colors.green,
        title: Text('Products',style: TextStyle(fontSize: 28,color: Colors.white),),
      ),
      
      body: FutureBuilder<ProductDataModel?>(
          future: getProducts(), 
          builder: (_,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }else if(snapshot.hasError){
              return Center(child: Text("Error: ${snapshot.error.toString()}"),);
            }else if(snapshot.hasData){
              return snapshot.data != null? snapshot.data!.products!.isNotEmpty ? ListView.builder(
                  itemCount: snapshot.data!.products!.length,
                  itemBuilder: (_,index){
                    return Card(
                      elevation: 5,
                      child: ListTile(

                        title: Center(
                          child: Container(
                            width: 200,
                            height:200,
                            child: Image.network(snapshot.data!.products![index].thumbnail!,),
                          ),
                        ),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(snapshot.data!.products![index].title!,style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold),),
                            Text(snapshot.data!.products![index].description!,style: TextStyle(fontSize: 12),)
                          ],
                        ),
                        trailing: Text('${snapshot.data!.products![index].price!}',style: TextStyle(fontSize: 20,color: Colors.red,fontWeight: FontWeight.bold),),
                      ),
                    );
              }) : Center(child: Text('No Products Yet!!'),) : Container();
            }
            return Container();
          }),
      
    );
  }

  /*Future<ProductDataModel>*/
 Future<ProductDataModel?> getProducts() async{

    String url = 'https://dummyjson.com/products';
    Uri uri = Uri.parse(url);

    http.Response res =  await http.get(uri);

    if(res.statusCode == 200){
    var resData = jsonDecode(res.body);
    return ProductDataModel.fromJson(resData);
    }else{
      return null;
    }

  }}