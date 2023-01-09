import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:panditapp/model/searchBarModel.dart'show Datum ,Modelapi;


class AutocompleteExample extends StatefulWidget {
  const AutocompleteExample({Key? key}) : super(key: key);

  @override
  State<AutocompleteExample> createState() => _AutocompleteExampleState();
}

class _AutocompleteExampleState extends State<AutocompleteExample> {
  void initState(){
    super.initState();
    _getDataFromApi();
  }
  Modelapi? modelapi;
  void _getDataFromApi()async{
    var respones = await http.get(Uri.parse('https://reqres.in/api/users?page=2'));
    setState(() {
      modelapi = Modelapi.fromJson(json.decode(respones.body));
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Container(
      child: Autocomplete<Datum>(
        optionsBuilder: (TextEditingValue value){
          return  modelapi!.data!.where((element) => element.firstName!.toLowerCase().contains(value.text.toLowerCase())).toList();
        },
        onSelected: (value)=> print(value.firstName),
        displayStringForOption: (Datum d)=> '${d.firstName!} ${d.lastName!}',
      ),
    ));
  }
}
