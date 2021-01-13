import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
String globCat;
class Search extends StatefulWidget {
  String category;
  Search({this.category});

  @override
  _SearchState createState() => _SearchState();
}
class MultiSelectDialogItem<V> {
  const MultiSelectDialogItem(this.value, this.label);

  final V value;
  final String label;
}

class MultiSelectDialog<V> extends StatefulWidget {
  MultiSelectDialog({Key key, this.items, this.initialSelectedValues}) : super(key: key);

  final List<MultiSelectDialogItem<V>> items;
  final Set<V> initialSelectedValues;

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState<V>();
}

class _MultiSelectDialogState<V> extends State<MultiSelectDialog<V>> {
  final _selectedValues = Set<V>();

  void initState() {
    super.initState();
    if (widget.initialSelectedValues != null) {
      _selectedValues.addAll(widget.initialSelectedValues);
    }
  }

  void _onItemCheckedChange(V itemValue, bool checked) {
    setState(() {
      if (checked) {
        _selectedValues.add(itemValue);
      } else {
        _selectedValues.remove(itemValue);
      }
    });
  }

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    Navigator.pop(context, _selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Items'),
      contentPadding: EdgeInsets.only(top: 12.0),
      content: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
          child: ListBody(
            children: widget.items.map(_buildItem).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: _onCancelTap,
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: _onSubmitTap,
        )
      ],
    );
  }

  Widget _buildItem(MultiSelectDialogItem<V> item) {
    final checked = _selectedValues.contains(item.value);
    return CheckboxListTile(
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) => _onItemCheckedChange(item.value, checked),
    );
  }
}

class _SearchState extends State<Search> {


  var search;
  var parsedjson;
  String cat="";


 final Map <int,String> mp={

 };
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
        print(i);
        mp[j]=i;
        print(j);
        j++;
      }
    print(mp);
  }
  List <MultiSelectDialogItem<int>> multiItem = List();
  void populateMultiselect(){

      if(mp!=null) {
        print(mp);
        for (int v in mp.keys) {
          multiItem.add(MultiSelectDialogItem(v, mp[v]));
        }
      }
  }


  void _showMultiSelect(BuildContext context) async {
    multiItem = [];
    populateMultiselect();
    final items = multiItem;

    // final items = <MultiSelectDialogItem<int>>[
    //   MultiSelectDialogItem(1, 'India'),
    //   MultiSelectDialogItem(2, 'USA'),
    //   MultiSelectDialogItem(3, 'Canada'),
    // ];
    print(items);

    final selectedValues = await showDialog<Set<int>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: items,
          initialSelectedValues: [1,2].toSet(),
        );
      },
    );

    print(selectedValues);
//    getvaluefromkey(selectedValues);
  }




  @override
  void initState() {
    this.cat=widget.category;
    getSearch();


  }
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
      ),
      body: Center(
        child: Column(
          children: [
          RaisedButton(
            child: Text("Search by $cat"),
            onPressed: () {
              _showMultiSelect(context);
            }
          ),

          ],
        ),
      ),
    );
  }
}
