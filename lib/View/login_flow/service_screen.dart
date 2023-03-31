import 'dart:io';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/model/Login%20Model/service_model.dart';
import 'package:provider/provider.dart';
import '../../consts/text_const.dart';
import '../../Widgets/circular_loader.dart';
import '../../consts/themescolor.dart';
import '../../view_model/Login/Service_VM.dart';
import 'city_screen.dart';

class ServiceScreen extends StatefulWidget {
  final String? name, mobile;
  final File? photo;

  const ServiceScreen({Key? key, this.name, this.photo, this.mobile})
      : super(key: key);

  @override
  State<ServiceScreen> createState() => _ServiceScreenState();
}

class _ServiceScreenState extends State<ServiceScreen> {
  var ht, wt;
  var servicecontroller;

  int _selectedIndex = 0;
  late ServiceVM serviceVM;

  @override
  void initState() {
    serviceVM = Provider.of<ServiceVM>(context, listen: false);
    serviceVM.serviceAPIcall();
  }

  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<ServiceVM>(
          builder: (_, provider, __) => provider.loading
              ? const Center(child: CircularLoader())
              : serviceScreen(
                  list: provider.serviceModel?.response?.serviceslist)),
    );
  }

  Widget stepContainer({Color? color}) {
    return Container(
      width: wt * 0.12,
      height: 4,
      decoration:
          BoxDecoration(color: color, borderRadius: BorderRadius.circular(40)),
    );
  }

  Widget button() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
          style: ButtonStyle(
            alignment: Alignment.center,
            elevation: MaterialStateProperty.resolveWith((states) => 0.0),
            padding: MaterialStateProperty.resolveWith((states) =>
                EdgeInsets.symmetric(vertical: 13, horizontal: wt * 0.15)),
            shape: MaterialStateProperty.resolveWith(
                (states) => RoundedRectangleBorder(
                      side: const BorderSide(
                        color: divider,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(5),
                    )),
            backgroundColor: MaterialStateColor.resolveWith((states) => white),
          ),
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            BACK,
            style: GoogleFonts.poppins(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: dividerr,
            ),
          ),
        ),
        Consumer<ServiceVM>(
          builder: (_, provider, __) => ElevatedButton(
            style: ButtonStyle(
              alignment: Alignment.center,
              elevation: MaterialStateProperty.resolveWith(
                  (states) => provider.index != -1 ? 5.0 : 0.0),
              padding: MaterialStateProperty.resolveWith((states) =>
                  EdgeInsets.symmetric(vertical: 13, horizontal: wt * 0.15)),
              shape: MaterialStateProperty.resolveWith(
                  (states) => RoundedRectangleBorder(
                        side: BorderSide(
                          color: provider.index != -1 ? colorPrimary : divider,
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(5),
                      )),
              backgroundColor: MaterialStateColor.resolveWith(
                  (states) => provider.index != -1 ? colorPrimary : white),
            ),
            onPressed: () {
              provider.index != -1
                  ? Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CityScreen(
                                name: widget.name,
                                photo: widget.photo,
                                mobile: widget.mobile,
                                servicesname: serviceVM.serviceModel!.response!
                                    .serviceslist![_selectedIndex].name,
                              )))
                  : null;
            },
            child: Text(
              NEXT,
              style: GoogleFonts.poppins(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: provider.index != -1 ? white : dividerr,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget serviceList({List<Serviceslist>? list}) {
    return Consumer<ServiceVM>(
      builder: (_, provider, __) => Flexible(
        child: ListView.separated(
          padding: const EdgeInsets.symmetric(vertical: 12),
          itemBuilder: (context, index) => GestureDetector(
            onTap: () {
              provider.setIndex(index);
              setState(() {
                _selectedIndex = index;
              });
            },
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 16),
              decoration: BoxDecoration(
                  color: provider.index == index ? kPrimaryColor : white,
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                      color: provider.index == index
                          ? kPrimaryColor
                          : kSecondaryColor)),
              child: Center(
                  child: Text(
                list![index].name.toString(),
                style: GoogleFonts.poppins(
                    color: provider.index == index ? white : h1Color,
                    fontWeight: FontWeight.w500,
                    fontSize: 16),
              )),
            ),
          ),
          separatorBuilder: (context, index) => const SizedBox(
            height: 20,
          ),
          itemCount: list?.length ?? 0,
        ),
      ),
    );
  }

  Widget serviceScreen({List<Serviceslist>? list}) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      stepContainer(
                        color: kSecondaryColor,
                      ),
                      stepContainer(
                        color: kSecondaryColor,
                      ),
                      stepContainer(
                        color: kPrimaryColor,
                      ),
                      stepContainer(
                        color: kSecondaryColor,
                      ),
                      stepContainer(
                        color: kSecondaryColor,
                      ),
                      stepContainer(
                        color: kSecondaryColor,
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    FILL_YOUR_PROFILE_DETAILS,
                    style: GoogleFonts.poppins(
                        color: h1Color,
                        fontWeight: FontWeight.w700,
                        fontSize: 20),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Text(
                    SELECT_YOUR_PERFECTLY,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                        color: p1Color),
                  ),
                  serviceList(list: list),
                ],
              ),
            ),
            button(),
          ],
        ),
      ),
    );
  }
}
