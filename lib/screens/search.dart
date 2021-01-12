import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
class Search extends StatefulWidget {
  String category;
  Search({this.category});

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {


  Future<List> search;
  String cat="";
  Future<List> getSearch () async
  {
    var response=await http.get("https://mysterious-river-13758.herokuapp.com/get$cat");
    print(response.body);
    for(var item in response.body)
      {

      }
  }
  @override
  void initState(){
    this.cat=widget.category;
    getSearch();

  }
  Widget build(BuildContext context) {
    return Container();
  }
}
