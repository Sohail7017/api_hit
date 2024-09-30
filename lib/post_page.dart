import 'dart:convert';

import 'package:clasico_291/models/post_model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class PostPage extends StatefulWidget{
  @override
  State<PostPage> createState() => _PostPageState();
}

class _PostPageState extends State<PostPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.orange,
        title:  Text('Posts',style: TextStyle(fontSize: 25,color: Colors.white),),
      ),
      body: FutureBuilder<PostDataModel?>(
          future: getPostData(),
          builder: (_,snapshot){
            if(snapshot.connectionState == ConnectionState.waiting){
              return Center(child: CircularProgressIndicator(),);
            }else if(snapshot.hasError){
              return Center(child: Text('Error: ${snapshot.error.toString()}'),);
            }else if(snapshot.hasData){
              return snapshot.data != null ? snapshot.data!.posts.isNotEmpty ? ListView.builder(
                  itemCount: snapshot.data!.posts.length,
                  itemBuilder: (_,index){
                   return ListTile(
                      title: Text(snapshot.data!.posts[index].title),
                    );
                    
                  }) 
                  : Center(child: Text('Not Post Yet!!'),) 
                  : Container();
            }
            return Container();
          }) ,
    );
  }



  Future<PostDataModel?> getPostData() async{

    String url = 'https://dummyjson.com/posts';
    Uri uri = Uri.parse(url);
     http.Response res = await http.get(uri);

     if(res.statusCode == 200){
       /*print('Response body = ${res.body}');*/
       var resData = jsonDecode(res.body);
       return PostDataModel.fromJson(resData);
     }else{
       return null;
     }
  }
}