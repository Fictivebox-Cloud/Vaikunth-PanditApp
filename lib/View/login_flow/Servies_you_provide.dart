import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../Consts/color1.dart';

import '../../Consts/text_const.dart';
import '../../Widgets/circular_loader.dart';
import '../../view_model/Login/Service_VM.dart';
import 'city_screen.dart';

class Servies_you_screen extends StatefulWidget {
  final String? name, mobile;
  final File? photo;

  const Servies_you_screen({Key? key, this.name, this.photo, this.mobile})
      : super(key: key);

  @override
  State<Servies_you_screen> createState() => _Servies_you_screenState();
}

class _Servies_you_screenState extends State<Servies_you_screen> {
  var ht, wt;
  var servicecontroller;

  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    ServiceVM serviceVM = context.watch<ServiceVM>();

    TextEditingController editingController = TextEditingController();
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: serviceVM.loading
          ? Center(child: CircularLoader())
          : SafeArea(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, top: 10),
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
                                width: 48, height: 2, color: kSecondaryColor),
                            Container(
                                width: 48, height: 2, color: kSecondaryColor),
                            Container(
                                width: 48, height: 2, color: kSecondaryColor),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),
                        Text(
                          SERVICESYOUOFFER,
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w500, fontSize: 24),
                        ),

                        SizedBox(
                          height: 32,
                        ),
                        //Text("Photo url${widget.photo}"),
                        //Text("name${widget.name}"),
                        Container(
                            width: double.infinity,
                            height: 400,
                            child: ListView.separated(
                                itemBuilder: (context, index) =>
                                    GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _selectedIndex = index;
                                        });
                                      },
                                      child: Container(
                                        width: wt * 0.9,
                                        height: ht * 0.07,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(4),
                                            border: Border.all(
                                                color: _selectedIndex == index
                                                    ? kPrimaryColor
                                                    : kSecondaryColor)),
                                        child: Center(
                                            child: Text(
                                          serviceVM.serviceModel!.response!
                                              .serviceslist![index].name
                                              .toString(),
                                          style: GoogleFonts.lato(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 16),
                                        )),
                                      ),
                                    ),
                                separatorBuilder: (context, index) => SizedBox(
                                      height: 12,
                                    ),
                                itemCount: serviceVM.serviceModel!.response!
                                    .serviceslist!.length)),
                      ],
                    ),
                  ),
                  Spacer(),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 16, right: 16, bottom: 24),
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
                                    builder: (context) => City_Screen(
                                          name3: widget.name,
                                          photo3: widget.photo,
                                          mobile: widget.mobile,
                                          servicesname: serviceVM
                                              .serviceModel!
                                              .response!
                                              .serviceslist![_selectedIndex]
                                              .name,
                                        )));
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
            ),
    );
  }
}
