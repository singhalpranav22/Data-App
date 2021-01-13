import 'dart:convert';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:data_app/screens/details.dart';
String globCat;
class Search extends StatefulWidget {
  String category;
  Search({this.category});
  @override
  _SearchState createState() => _SearchState();
}


class _SearchState extends State<Search> {


  List <dynamic> search = [];
  List <String> params = []; // List for parameters of a search tag
  var parsedjson;
  var result=""; // The result of all the profiles recieved
  String cat="";
  String param=""; // The selected param to be searched like : Google
  String res="";
  List<ListItem> ls= [];

 final Map <int,String> mp={ // mp if multiple feature to be implemented

 };
 List <dynamic> selected =[];
  Future<List> getSearch () async
  {
    var response=await http.get("https://mysterious-river-13758.herokuapp.com/get$cat");
//    print(response.body);

    if(response.statusCode==200)
     parsedjson = json.decode(response.body);
    search=parsedjson['data'];
    print(search);
    int j=1;

    for(String i in search)
      {
        params.add(i);
      }
  }

  List <dynamic> fetchedResult = [];
  void fetchResults() async
  {
    String url = "https://mysterious-river-13758.herokuapp.com/getData/?";
     if(cat=="Company") {
       url += "company=";
     }
     else if(cat=="Skills")
       url+="skill=";
     else if(cat=="Location")
       url+="location=";
     for(int i=0;i<param.length;i++)
       {
         if(param[i]==' ')
           url+='_';
         else
           url+=param[i];

       }
     var response = await http.get(url);
     print(response.body);
     result=response.body.toString();
     res=result;
     ls = [];
     var parsjson;
     parsjson = json.decode(response.body);
     var data=parsjson["data"];
     for( var i in data)
       {
         var name = i["name"];
         var company = i["title"];
         var skill="";
//         if(i["skills"].length > 0)
//         skill = i["skills"][0];


         ls.add(new ListItem(name: name,company: company,post: skill));
       }


  }


  @override
  void initState() {
    this.cat=widget.category;
    getSearch();


  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search by $cat"),
      ),
      body: Container(
        padding: EdgeInsets.all(15.0),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              DropDownField(
                onValueChanged: (value) {


                  setState(() {
                    param = value;
                    print(param);
                    fetchResults();
                  });
                },
                value: param,
                required: false,
                hintText: 'Choose a $cat',
                labelText: '$cat',
                items: params,
              ),
              Expanded(
                child: Container(
                  child: ListView(
                    children: ls,
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}

class ListItem extends StatelessWidget {
  String name="";
  String post="";
  String company="";
  ListItem({this.name,this.post,this.company});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        GestureDetector(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => UI(name: name,position: post,company: company)
              ),
            );
          },
          child: ListTile(
            title: Text(
              name
            ),
            subtitle: Text(
              post+"\n"+company,
            ),
          ),
        ),
        ColoredBox(
          color: Colors.teal,
        )
      ],
    );
  }
}
