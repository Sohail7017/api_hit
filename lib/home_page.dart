import 'dart:convert';
import 'package:clasico_291/models/quotes_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart ' as httpClient;

class HomePage extends StatefulWidget{
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  void initState() {
     super.initState();
      getQuotes();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle:  true,
        title: Text('API'),
      ),
      body: FutureBuilder(
          future: getQuotes() , builder: (_, snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator());
            }else if (snapshot.hasError){
              return Center(child: Text("Erroe : ${snapshot.error.toString()}"),);
            }else if(snapshot.hasData){
              return ListView.builder(
                  itemCount: snapshot.data!.quotes.length,
                  itemBuilder: (_,index){
                return ListTile(
                  leading: Text('${snapshot.data!.quotes[index].id}'),
                  title:  Text(snapshot.data!.quotes[index].quote),
                  subtitle: Text('- ${snapshot.data!.quotes[index].author}'),
                );
              });
            }
            return Container();
      })

      /*quoteData != null ? quoteData!.quotes.isNotEmpty ? ListView.builder(
          itemCount: quoteData!.quotes.length,
          itemBuilder: (_,index){
          return ListTile(
            leading: Text('${quoteData!.quotes[index].id}'),
            title:  Text(quoteData!.quotes[index].quote),
            subtitle: Text('- ${quoteData!.quotes[index].author}'),
          );
      }):
          Center(child: Text('No Quotes Yet!!'),)
          : Center(child: Text('No Quote fetch!!'),)
   */ );
  }
 
  Future<QuotesDataModel?> getQuotes() async{

    String url = 'https://dummyjson.com/quotes';
    Uri uri = Uri.parse(url);

    httpClient.Response res = await  httpClient.get(uri);

  if(res.statusCode == 200){
   var resData = jsonDecode(res.body);
  return QuotesDataModel.fromJson(resData);
  }else{
    return null;
  }
  }
}