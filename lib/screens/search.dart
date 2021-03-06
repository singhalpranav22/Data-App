import 'dart:convert';
import 'package:dropdownfield/dropdownfield.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../screens/details.dart';

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
  var result=""; // The result of all the profiles received
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
     var parsjson;
     parsjson = json.decode(response.body);
     var data=parsjson["data"];
     for( var i in data)
       {
         var name = i["name"];
         var title = i["title"];
         var company = i["company"];
         var experience = i["experience"];
         ls.add(ListItem(name: name,company: company, title: title , experience: experience));
       }
  }
  @override
  void initState() {
    setState(() {
      this.cat=widget.category;
      getSearch();
    });
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
  String name;
  String title;
  String company;
  List<dynamic> experience;
  ListItem({this.name , this.title , this.company , this.experience});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: () {
            print(name);
            //print(company);
            print(title);
            //print(experience);
            Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (context) => UI(name: name, title: title, experience: experience,)
              ),
            );
          },
          child: ListTile(
            title: Text(
                name
            ),
            subtitle: Text(
              "$title",
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

