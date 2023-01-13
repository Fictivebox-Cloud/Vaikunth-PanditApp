import 'package:flutter_svg/svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:panditapp/View/Booking/pages/booking_progress_screen.dart';
import 'package:panditapp/consts/themescolor.dart';
import 'package:pin_code_fields/pin_code_fields.dart';
import 'package:provider/provider.dart';
import 'package:panditapp/view_model/BookingViewDetails/getBookingOTP.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../../Consts/text_const.dart';
import '../../../view_model/BookingViewDetails/Check_Booking_Confirm_OTP.dart';
import '../../../view_model/BookingViewDetails/ViewDetails_VM.dart';

class BookingDetailsScreen extends StatefulWidget {
  var bookingId;
  var userOTP;

  BookingDetailsScreen({Key? key, this.bookingId, this.userOTP})
      : super(key: key);

  @override
  State<BookingDetailsScreen> createState() => _BookingDetailsScreenState();
}

class _BookingDetailsScreenState extends State<BookingDetailsScreen> {

  var ht, wt;
  late PujaConfirmOTP puja_Confirm_OTP;

  late ViewDetailVM viewdetailVM;
  TextEditingController otpController = TextEditingController();
  SmsAutoFill smsAutoFill = SmsAutoFill();
  String? strVerificationId;

  Future _launchMap(var address) async {
    var coordinates = await locationFromAddress(address);
    print(coordinates);
    MapsLauncher.launchCoordinates(coordinates.first.latitude, coordinates.first.longitude);
  }

  @override
  Widget build(BuildContext context) {
    viewdetailVM = Provider.of<ViewDetailVM>(context, listen: false);
    viewdetailVM.viewdetailAPIcall(userbooking: widget.bookingId);

    puja_Confirm_OTP = Provider.of<PujaConfirmOTP>(context, listen: false);
    puja_Confirm_OTP.getPujaCofirmOtp(userBooking_id: widget.bookingId);

    wt = MediaQuery
        .of(context)
        .size
        .width;
    ht = MediaQuery
        .of(context)
        .size
        .height;

    return

      SafeArea(
      child: Scaffold(
          backgroundColor: white,

          body: Consumer<ViewDetailVM>(
            builder: (_, data, __) =>
            data.loading
                ? const Center(
              child: CircularProgressIndicator(color: colorPrimary,),)
                : SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Appbar(),
                    DetailPage(),

/*
                    Container(
                      width: double.infinity,
                      height: 40,
                      color: bgColor,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, right: 16),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(viewdetailVM.viewdetailmodel!.response!
                                .viewdetaildata![0].name.toString(),
                              style: GoogleFonts.lato(fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: kPrimaryColor),),
                            InkWell(
                              onTap: () {
                                FlutterPhoneDirectCaller.callNumber(
                                    "${viewdetailVM.viewdetailmodel!.response!
                                        .viewdetaildata![0].phone}");
                              },
                              child: Container(
                                width: 140,
                                height: 32,
                                decoration: BoxDecoration(
                                    color: white,
                                    borderRadius: BorderRadius.circular(40)
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment
                                      .spaceEvenly,
                                  children: [
                                    const Icon(
                                      Icons.call, color: kPrimaryColor,),
                                    Text(CALLNOW
                                      , style: GoogleFonts.lato(
                                          fontWeight: FontWeight.w500,
                                          fontSize: 14,
                                          color: kPrimaryColor),)
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    const SizedBox(height: 19,),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const Icon(
                                Icons.calendar_month, color: kPrimaryColor,),
                              const SizedBox(width: 11,),
                              //Text("Mon 05/Oct/2021"),
                              Text(viewdetailVM.viewdetailmodel!.response!
                                  .viewdetaildata![0].bookingPujaDate.toString()
                                  .split(" ")[0]),
                            ],
                          ),
                          const SizedBox(height: 19,),
                          Row(
                            children: [
                              const Icon(
                                Icons.access_time, color: kPrimaryColor,),
                              const SizedBox(width: 11,),

                              Text(viewdetailVM.viewdetailmodel!.response!
                                  .viewdetaildata![0].bookingPujaDate.toString()
                                  .replaceRange(0, 11, "")),
                            ],
                          ),
                          const SizedBox(height: 19,),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_on, color: kPrimaryColor,),
                              const SizedBox(width: 11,),
                              Text(viewdetailVM.viewdetailmodel!.response!
                                  .viewdetaildata![0].cityname.toString())
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 26,),
                    Container(
                      width: double.infinity,
                      height: 40,
                      color: bgColor,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, top: 8),
                        child: Text(ITEMS, style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: kPrimaryColor),),
                      ),
                    ),
                    const SizedBox(height: 16,),
                    Padding(
                      padding: const EdgeInsets.only(left: 16),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "1 x ${viewdetailVM.viewdetailmodel!.response!
                                    .viewdetaildata![0].poojaTitle
                                    .toString()}",),
                            ],
                          ),
                          const SizedBox(
                            height: 16,
                          ),
                          Row(
                            children: const [
                              Text("2 x Astrology Session"),
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(height: 24,),
                    Container(
                      width: double.infinity,
                      height: 40,
                      color: bgColor,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 16, top: 8),
                        child: Text(EARNINGS, style: GoogleFonts.lato(
                            fontWeight: FontWeight.w500,
                            fontSize: 18,
                            color: kPrimaryColor),),
                      ),
                    ),
                    const SizedBox(height: 24,),
                    Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(PUJAEARNING),
                              Text("₹${viewdetailVM.viewdetailmodel!.response!
                                  .viewdetaildata![0].bookingPaidAmount
                                  .toString()}"),
                            ],
                          ),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(VISITING_CHARGE),
                              Text("₹200")
                            ],
                          ),
                          const SizedBox(height: 10,),
                          const DottedLine(),
                          const SizedBox(height: 10,),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(TOTAL, style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w400)),
                              Text("₹${viewdetailVM.viewdetailmodel!.response!
                                  .viewdetaildata![0].bookingPaidAmount
                                  .toString()}"),
                            ],
                          )
                        ],
                      ),
                    ),*/



                    const SizedBox(height: 24,),
                    InkWell(
                      onTap: () {
                        _launchMap(viewdetailVM.viewdetailmodel?.response?.viewdetaildata?.first.address);
                      },
                      child: Container(
                        //margin: const EdgeInsets.symmetric(horizontal: 16),
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4)
                            , border: Border.all(
                            width: 1,
                            color: buttonColor
                        )
                        ),
                        child:
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.navigation, color: buttonColor,),
                              Text(NAVIGATE, style: GoogleFonts.lato(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                  color: buttonColor),)
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24,),
                    InkWell(
                      onTap: () {

                        showModalBottomSheet(
                          context: context,
                          builder: (builder) => bottomSheet(
                              bookingId: viewdetailVM.viewdetailmodel!
                                  .response!.viewdetaildata![0].bookingId
                                  .toString()),
                        );
                        puja_Confirm_OTP.getPujaCofirmOtp(
                            userBooking_id: widget.bookingId);
                      },
                      child: Container(
                        width: double.infinity,
                        height: 48,
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: Center(child: Text(NEXT,
                          style: GoogleFonts.lato(color: white,
                              fontWeight: FontWeight.w600,
                              fontSize: 20),)),
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
      ),
    );
  }


  @override
  void dispose() {
    otpController.dispose();
  }

  toast() {
    print("Booking Detail OTP Error");
  }

  bottomSheet({required String bookingId}) {
    return Consumer<CheckBookingConfirmOTPViewModel>(
      builder: (context, provider, child) {
        return Padding(
          padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
          child: Column(

            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(OTP, style: GoogleFonts.lato(color: kSecondaryColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w500),),
              const SizedBox(height: 12,),
              Text(OTPINPHONE, style:
              GoogleFonts.lato(
                  color: h1Color, fontSize: 14, fontWeight: FontWeight.w600),),
              const SizedBox(height: 12,),
              PinCodeTextField(

                keyboardType: TextInputType.number,
                controller: otpController,
                inputFormatters: [
                  LengthLimitingTextInputFormatter(4),
                  FilteringTextInputFormatter.allow(
                      RegExp("[0-9]")),
                ],
                // keyboardType: TextInputType.(),
                appContext: context,
                length: 4,
                onChanged: (value) {
                  if(value.length == 4) {
                    if(otpController.text == "1234") {
                      print("Id ${widget.bookingId}");
                      provider.getCheckBookingConfirm(
                          userBooking_id: widget.bookingId,
                          otpcode: "1234".toString());
                      // provider.loading ? null :  provider.valueReturn ?
                      Navigator
                          .push(context, MaterialPageRoute(
                          builder: (context) => BookingProgress()));
                    } else {
                      Fluttertoast.showToast(msg: "Invalid OTP");
                    }
                  }
                },
                pinTheme: PinTheme(
                  shape: PinCodeFieldShape.box,
                  borderRadius: BorderRadius.circular(5),
                  fieldHeight: 48,
                  fieldWidth: 48,
                  inactiveColor: const Color(0XFFCACACA),
                  activeColor: const Color(0XFFFF7D33),
                  selectedColor: const Color(0XFFFF7D33),
                ),
              ),
              const SizedBox(height: 12,),

              provider.loading ? Container(
                  width: double.infinity,
                  alignment: Alignment.center,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: CircularProgressIndicator(color: kPrimaryColor,),
                  )) : InkWell(
                onTap: () {

                  provider.getCheckBookingConfirm(
                      userBooking_id: widget.bookingId,
                      otpcode: "1234".toString());
                  // provider.loading ? null :  provider.valueReturn ?
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) => BookingProgress()));
                  //: toast();
                },
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                      color: buttonColor,
                      borderRadius: BorderRadius.circular(4)

                  ),
                  child: Center(child: Text(NEXT, style: GoogleFonts.lato(
                      color: white,
                      fontWeight: FontWeight.w600,
                      fontSize: 20),)),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Widget Appbar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 34),
      child: Row (children: [
        InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: SvgPicture.asset("assets/images/lefticon.svg")),
        SizedBox(width: 12,),


        Text(BOOKINGID+" #${viewdetailVM.viewdetailmodel!.response!.viewdetaildata![0].orderId.toString()}", style: GoogleFonts.lato(
            fontSize: 18,
            color: h1Color,
            fontWeight: FontWeight.w600),),
        Spacer(),
        Icon(Icons.more_vert),

      ],),
    );
  }

  Widget DetailPage() {
    return Container(
      padding: EdgeInsets.only(left: 10,right: 10,top:17),
      height: 478,
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(12),
      border: Border.all(color:Color(0xffF5F5F5))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Pooja time",style: GoogleFonts.lato(fontWeight: FontWeight.w600, fontSize: 14),),
        SizedBox(height: 6,),
        Text(viewdetailVM.viewdetailmodel!.response!.viewdetaildata![0].bookingPujaDate.toString(),style: GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 14,color: Color(0xff7C7C7C)),
            //.split(" ")[0]
        ),
        SizedBox(height: 22,),
        Text("Location",style: GoogleFonts.lato(fontWeight: FontWeight.w600, fontSize: 14),),
        SizedBox(height: 6,),

        Text(viewdetailVM.viewdetailmodel!.response!
            .viewdetaildata![0].cityname.toString(),style: GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 14,color: Color(0xff7C7C7C)),),
       SizedBox(height: 24,),
        Divider(),
        SizedBox(height: 17,),
        Text("Pooja type",style: GoogleFonts.lato(fontWeight: FontWeight.w700, fontSize: 16),),
        SizedBox(height: 12,),
        Text(
          " ${viewdetailVM.viewdetailmodel!.response!
              .viewdetaildata![0].poojaTitle
              .toString()}",style: GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 14,color:Color(0xff343D48)),),
        SizedBox(height: 12,),
        Text("Puranmashi katha(Offline)",style: GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 14,color:Color(0xff343D48)),),
        SizedBox(height: 24,),
        Divider(),
        SizedBox(height: 16,),
        Text("Payment Billing",style: GoogleFonts.lato(fontWeight: FontWeight.w700, fontSize: 16),),
        SizedBox(height: 18,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(PUJAEARNING,style: GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 14),),
            Text("₹${viewdetailVM.viewdetailmodel!.response!
                .viewdetaildata![0].bookingPaidAmount
                .toString()}",
              style: GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 14),),
          ],
        ),
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:  [
            Text(VISITING_CHARGE,style: GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 14),),
            Text("₹200",style: GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 14,color: Color(0xffFE0042)),),

           // Text("₹200")
          ],
        ),
        Divider(color: Color(0xffE2E2E2),),
        SizedBox(height: 18,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Text(TOTAL, style: GoogleFonts.lato(fontWeight: FontWeight.w700, fontSize: 16),),
            Text("₹${viewdetailVM.viewdetailmodel!.response!
                .viewdetaildata![0].bookingPaidAmount
                .toString()}",
                style: GoogleFonts.lato(fontWeight: FontWeight.w400, fontSize: 14),

            ),
          ],
        )
      ],),);

  }
}
