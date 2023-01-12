import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Util/picture/image.dart';
import '../../../Widgets/circular_loader.dart';
import '../../../consts/text_const.dart';
import '../../../consts/themescolor.dart';
import '../../../view_model/Profile/Help_Support_Details_VM.dart';

class HelpSupportScreen extends StatefulWidget {
  const HelpSupportScreen({Key? key}) : super(key: key);

  @override
  State<HelpSupportScreen> createState() => _HelpSupportScreenState();
}

class _HelpSupportScreenState extends State<HelpSupportScreen> {
  var ht, wt;

  @override
  Widget build(BuildContext context) {
    HelpSupportDetails_VM helpSupportDetails_VM =
        context.watch<HelpSupportDetails_VM>();
    return Scaffold(
      backgroundColor: white,

      body: helpSupportDetails_VM.loading
          ? Center(child: CircularLoader())
          : SafeArea(
              child: Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, bottom: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Appbar(),
                    Row(children: [
                      Expanded(
                        flex: 1,
                        child: InkWell(
                          onTap: () {
                            launch(
                                'mailto:${helpSupportDetails_VM.helpSupportDetailsModel!.response!.helplist![0].helpEmail.toString()}');
                          },
                          child: Container(
                            width: double.infinity,
                            height: 52,
                            decoration: BoxDecoration(
                              color: Color(0XFFFFF0E8),
                              borderRadius: BorderRadius.circular(14),
                              //border: Border.all(width: 1, color: Color(0XFFFFF0E8)),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Center(
                                  child: Row(
                                    children: [
                                      SvgPicture.asset(IMG().MYBOOKING),
                                      SizedBox(
                                        width: 10,
                                      ),
                                      Text(
                                        "Chat",
                                        style: GoogleFonts.lato(
                                            fontSize: 16,
                                            fontWeight: FontWeight.w500,
                                            color: h1Color),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10,),
                      Expanded(
                        flex: 1,
                        child: Container(
                          width: double.infinity,
                          height: 52,
                          decoration: BoxDecoration(
                            color: Color(0XFFFFF0E8),
                            borderRadius: BorderRadius.circular(8),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10, right: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Icon(
                                      Icons.call,
                                      color: kPrimaryColor  ,
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    InkWell(
                                        onTap: () {
                                          FlutterPhoneDirectCaller.callNumber(
                                              "${helpSupportDetails_VM.helpSupportDetailsModel!.response!.helplist![0].helpMobile.toString()}");
                                        },
                                        child: Text(
                                          "Call",
                                          style: GoogleFonts.lato(
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                              color:kPrimaryColor),
                                        )),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],),
                    Frequentlyaskedquestions(),

                  ],
                ),
              ),
            ),
    );
  }


  Widget Appbar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 25,top: 20,),
      child: Row (children: [
        InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: SvgPicture.asset(IMG().BACKICON)),
        SizedBox(width: 12,),

        Text(HELPSUPPORT, style: GoogleFonts.lato(
            fontSize: 20,
            color: h1Color,
            fontWeight: FontWeight.w700),),


      ],),
    );
  }


  //ExpansionTile(title: title)


  Widget Frequentlyaskedquestions(){
    return  Container(
      //padding: EdgeInsets.only(top: 23),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(height: 20,),
          Text("Frequently asked questions",style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: 14),),
          SizedBox(height: 20,),

          ListView.separated(
            separatorBuilder: (context, index) =>
            SizedBox(height: 10,),
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context , int index){
              return Column(children: [

                Container(
                  //height: double.infinity,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      border: Border.all(color:Color(0xffF5F5F5))
                  ),
                  child: ExpansionTile(
                    title: Text("How the rate is calculated?",style: GoogleFonts.lato(fontWeight: FontWeight.w600,fontSize: 14),),

                    children: <Widget>[
                      ListTile(title: Text("We have a timer for our worker to confirm their start time and their end time with you. ",style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 14),),),

                    ],
                  ),
                ),

              ],
              );

            },
            itemCount: 5,
          ),
        ],
      ),
    );
  }

}
