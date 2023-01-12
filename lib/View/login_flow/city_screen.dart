import 'dart:async';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/view_model/Login/CityListApi.dart';
import 'package:provider/provider.dart';
import '../../Widgets/circular_loader.dart';
import '../../consts/text_const.dart';
import '../../consts/themescolor.dart';
import 'document_screen.dart';

class CityScreen extends StatefulWidget {
  final String? name, mobile, servicesname;
  final File? photo;

  const CityScreen(
      {Key? key, this.name, this.photo, this.mobile, this.servicesname})
      : super(key: key);

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  var ht, wt;
  TextEditingController editingController = TextEditingController();
  late String textValue;
  late CityListApi? city_list_api;

  @override
  void initState() {
    city_list_api = Provider.of<CityListApi>(context, listen: false,);
    city_list_api?.getCityListApiCall();
    super.initState();
  }


  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  Future<void> getAddressFromLatLng(var lat, var long) async {
    await placemarkFromCoordinates(

        lat, long)
        .then((List<Placemark> placemarks) {
      Placemark place = placemarks[0];
      print(place.administrativeArea);
    }).catchError((e) {
      debugPrint(e);
    });
  }

  Widget stepContainer({Color? color}) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.12,
      height: 4,
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(40)
      ),
    );
  }

  Widget gpsLocation() {
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(
        horizontal: 16,
        vertical: 10,
      ),
      margin: const EdgeInsets.only(
        top: 20,
        bottom: 30,
      ),
      decoration: const BoxDecoration(
        border: Border.symmetric(
          horizontal: BorderSide(
            width: 0.5,
            color: DIVIDER_2,
          ),
        ),
      ),
      child: GestureDetector(
        onTap: () async {
          var ss =  await determinePosition();
          getAddressFromLatLng(ss.latitude , ss.longitude);
        },
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.gps_fixed),
            const SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  CURRENT_LOCATION,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600, fontSize: 12),
                ),
                Text(
                  USING_GPS,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w400, fontSize: 10),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backGroundColor,
        body: body(),
    );
  }

  Widget searchTextField() {
    return Consumer<CityListApi>(builder: (_, provider, __) => TextField(
      cursorColor: colorPrimary,
      controller: editingController,
      onChanged: (value) {
        provider.setCityList(value);
      },
      decoration: InputDecoration(
        prefixIcon: const Icon(
          CupertinoIcons.search,
          color: p1Color,
        ),
        filled: true,
        fillColor: TEXTFIELD_BACKGROUND_COLOR,
        hintText: SEARCH_YOUR_CITY,
        hintStyle: GoogleFonts.lato(
            fontWeight: FontWeight.w400,
            fontSize: 16,
            color: p1Color
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: TEXTFIELD_BORDER_COLOR, width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
        enabled: true,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
              color: TEXTFIELD_BORDER_COLOR, width: 1.0),
          borderRadius: BorderRadius.circular(5.0),
        ),
      ),
      inputFormatters: [
        //LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.allow(
            RegExp("[a-z A-Z]")),
      ],
    ),);
  }

  Widget gpsAndCityList() {
    return Expanded(
      child: Stack(
        children: [
          gpsLocation(),
          Consumer<CityListApi>(builder: (_, provider, __) =>  provider.showCityList ? Container(
            margin: const EdgeInsets.fromLTRB(16, 0, 16, 16),
            decoration: BoxDecoration(
              color: TEXTFIELD_BACKGROUND_COLOR,
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListView.separated(itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(16.0),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DocumentScreen(
                            name: widget.name,
                            profilePic: widget.photo,
                            mobile: widget.mobile,
                            servicesname: widget.servicesname,
                            cityId: provider.cityList?[index].id.toString(),
                          )));
                },
                child: Text(provider.cityList?[index].name ?? "", style: GoogleFonts.lato(
                    fontSize: 16,
                    color: h1Color),),),
            ), separatorBuilder: (context, index) => const Divider(
              color: p1Color,
              thickness: 1,
            ), itemCount: provider.cityList?.length ?? 0),
          ) : Container(),
          ),
        ],
      ),
    );
  }

  Widget body() {
    return Consumer<CityListApi>(builder: (_, provider, __) => provider.loading ? const Center(child: CircularLoader()) : SafeArea(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    stepContainer(color: kSecondaryColor,),
                    stepContainer(color: kSecondaryColor,),
                    stepContainer(color: kSecondaryColor,),
                    stepContainer(color: kPrimaryColor,),
                    stepContainer(color: kSecondaryColor,),
                    stepContainer(color: kSecondaryColor,),
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  FILL_YOUR_PROFILE_DETAILS,
                  style: GoogleFonts.poppins(
                      color: h1Color,
                      fontWeight: FontWeight.w700, fontSize: 20),
                ),
                const SizedBox(
                  height: 30,
                ),
                Text(
                  SELECT_YOUR_CITY,
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: p1Color),
                ),
                const SizedBox(
                  height: 10,
                ),
                searchTextField(),
              ],
            ),
          ),
          gpsAndCityList(),
        ],
      ),
    ));
  }

}
