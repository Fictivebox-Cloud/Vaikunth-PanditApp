import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/view_model/Login/CityListApi.dart';
import 'package:provider/provider.dart';
import '../../Consts/text_const.dart';
import '../../consts/themescolor.dart';
import '../../model/Login Model/city_model.dart';
import 'Documents_screen.dart';
import 'package:http/http.dart' as http;

class CityScreen extends StatefulWidget {
  final String? name3, mobile, servicesname;
  final File? photo3;

  const CityScreen(
      {Key? key, this.name3, this.photo3, this.mobile, this.servicesname})
      : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  var ht, wt;
  late List _city;
  TextEditingController editingController = TextEditingController();
  late String textValue;
  late Timer timeHandle;


  late CityListApi? city_list_api;
  void initState(){
    super.initState();
    _getDataFromApi();
  }
  Modelapi? modelapi;
  void _getDataFromApi()async{
    var headers = {
      'Authorization': 'Basic YW05dVpVQXlPVGM0OlJrbFVUa1ZUVTBBak1USXo=',
    };
    var url = 'https://vaikunth.fictivebox.com/api/getcitylist';
    var respones = await http.post(Uri.parse(url,),headers:headers );
    print(respones.body);
    setState(() {
      modelapi = Modelapi.fromJson(json.decode(respones.body));
      print(respones.body);
    });
  }


  @override
  Widget build(BuildContext context) {

    return Scaffold(
        backgroundColor: white,
        body: SafeArea(
          child: Column(
            children: [
              SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16, top: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                                width: 48, height: 2, color: kPrimaryColor),
                            Container(
                                width: 48, height: 2, color: kPrimaryColor),
                            Container(
                                width: 48, height: 2, color: kPrimaryColor),
                            Container(
                                width: 48, height: 2, color: kPrimaryColor),
                            Container(
                                width: 48, height: 2, color: kSecondaryColor),
                            Container(
                                width: 48, height: 2, color: kSecondaryColor),
                          ],
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        Text(
                          SELECTYOURCITY,
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w500, fontSize: 24),
                        ),
                        const SizedBox(
                          height: 32,
                        ),
                        SizedBox(
                          height: 48,
                          child: Autocomplete<Citylist>(
                            optionsBuilder: (TextEditingValue value){
                              return
                                // modelapi!.data!.where((element) => element.firstName!.toLowerCase().contains(value.text.toLowerCase())).toList();
                                modelapi!.response!.where((element) => element.firstName!.toLowerCase().contains(value.text.toLowerCase()));
                            },
                            onSelected: (value)=> print(value.name),
                            displayStringForOption: (Citylist d)=> '${d.name!} ${d.name !}',
                          ),
                        ),

                        //Text("${widget.servicesname}"),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 24),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),
                      color: kPrimaryColor),
                  child: TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DocumentsScreen(
                                    name4: widget.name3,
                                    photo4: widget.photo3,
                                    mobile: widget.mobile,
                                    servicesname: widget.servicesname)));
                      },
                      child: Text(
                        NEXT,
                        style: GoogleFonts.lato(
                            color: white,
                            fontSize: 24,
                            fontWeight: FontWeight.w600),
                      )),
                ),
              )
            ],
          ),
        ));
  }
}
