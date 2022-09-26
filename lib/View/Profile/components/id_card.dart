import 'package:flutter/material.dart';

import 'package:google_fonts/google_fonts.dart';

import 'package:panditapp/consts/image_const.dart';

import 'package:provider/provider.dart';
import '../../../consts/text_const.dart';
import '../../../consts/themescolor.dart';
import '../../../view_model/Profile/Personal_Detail_View_Model.dart';
import 'Bank/Pancard.dart';
import 'Bank/View_Decuments.dart';

class Id_card_Screen extends StatefulWidget {
  const Id_card_Screen({Key? key}) : super(key: key);

  @override
  State<Id_card_Screen> createState() => _Id_card_ScreenState();
}

class _Id_card_ScreenState extends State<Id_card_Screen> {
  var ht, wt;

  late Personal_Detail_View_Model personal_detail_view_model;
  Future<void> _refresh(bool reload, BuildContext context){
    personal_detail_view_model= Provider.of<Personal_Detail_View_Model>(context,listen: false);
    personal_detail_view_model.getpersonalDetailApiCall();
    return Future.delayed(const Duration(seconds: 0));


  }

  @override
  Widget build(BuildContext context) {
    personal_detail_view_model =
        Provider.of<Personal_Detail_View_Model>(context, listen: false);
    personal_detail_view_model.getpersonalDetailApiCall();

    return Scaffold(
        backgroundColor: white,
        appBar: AppBar(
          title: Text(IDCARD),
        ),
        body: _ui(personal_detail_view_model, context));
  }

  _ui(Personal_Detail_View_Model personal_detail_view_model,
      BuildContext context) {
    if (personal_detail_view_model.loading) {
      return Center(
        child: CircularProgressIndicator(
          color: kPrimaryColor,
        ),
      );
    } else if (personal_detail_view_model.userError != null) {
      return Center(
          child: Text(
        personal_detail_view_model.userError?.message.toString() ?? "Error",
      ));
    }
    return _listDesign(personal_detail_view_model, context);
  }

  _listDesign(Personal_Detail_View_Model id_card_view_model_view,
      BuildContext context) {
    return Consumer<Personal_Detail_View_Model>(
      builder: (context, provider, child) {
        return SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: double.infinity,
                  height: 195,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: kSecondaryColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(
                        left: 10, right: 10, top: 10, bottom: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: 80,
                              height: 80,
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  image: DecorationImage(
                                      fit: BoxFit.fill,
                                      image: NetworkImage(provider
                                              .presonalDetailModel
                                              ?.response!
                                              .panditDetails!
                                              .panditImage ??
                                          ""))),
                            ),
                            Text(
                              APPNAME,
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w700,
                                  fontSize: 32,
                                  color: h1Color),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  provider.presonalDetailModel?.response!
                                          .panditDetails!.panditFirstName ??
                                      "",
                                  style: GoogleFonts.lato(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500,
                                      color: p1Color),
                                ),
                                Text(
                                    "+91 ${provider.presonalDetailModel?.response!.panditDetails!.panditMobile ?? ""}",
                                    style: GoogleFonts.lato(
                                        fontSize: 18,
                                        fontWeight: FontWeight.w600,
                                        color: h1Color))
                              ],
                            ),
                            provider.presonalDetailModel?.response!
                                        .panditDetails!.panditVerified ==
                                    0
                                ? Container(
                                    child: Column(
                                      children: [
                                        Image.asset(
                                          ImageConst().NOTAPPROVED,
                                          width: 40,
                                          height: 40,
                                        ),
                                        Text(NOTAPPROVED)
                                      ],
                                    ),
                                  )
                                : Column(
                                    children: [
                                      Image.asset(ImageConst().RIGHT),
                                      Text(APPROVED)
                                    ],
                                  )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 18,
                ),
                Text(
                  OTHERDOCUMENTS,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600, fontSize: 20),
                ),
                SizedBox(
                  height: 12,
                ),
                Text(
                  ADHAR,
                  style: GoogleFonts.lato(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: p1Color),
                ),
                SizedBox(
                  height: 4,
                ),
                Container(
                  width: double.infinity,
                  height: 64,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: kSecondaryColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          provider.presonalDetailModel?.response!
                                  .panditbanklist![0].aadharNo ??
                              "",
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kSecondaryColor),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => View_Decuments()));
                          },
                          child: Container(
                            width: 116,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: kPrimaryColor),
                            child: Center(child: Text(VIEW)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 8,
                ),
                Text(
                  PANN,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w600,
                      fontSize: 16,
                      color: p1Color),
                ),
                SizedBox(
                  height: 8,
                ),
                Container(
                  width: double.infinity,
                  height: 64,
                  decoration: BoxDecoration(
                    color: white,
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(width: 1, color: kSecondaryColor),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 16, right: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          provider.presonalDetailModel?.response!
                                  .panditbanklist![0].panNo ??
                              "",
                          style: GoogleFonts.lato(
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                              color: kSecondaryColor),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PanCardScreen()));
                          },
                          child: Container(
                            width: 116,
                            height: 40,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: kPrimaryColor),
                            child: Center(child: Text(VIEW)),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
