import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/view_model/verification_number_api.dart';
import 'package:provider/provider.dart';
import '../../Consts/colors.dart';
import '../../view_model/Complete_Bookings.dart';

class Bookings_Screen extends StatefulWidget {
  const Bookings_Screen({Key? key}) : super(key: key);

  @override
  State<Bookings_Screen> createState() => _Bookings_ScreenState();
}

class _Bookings_ScreenState extends State<Bookings_Screen> {
  late TabController _controller;
  var ht, wt;
  bool Small = false;

  late CompleteBookingViewModel completeBookingViewModel;
  late NumberVerifyViewModel numberVerifyViewModel;

  @override
  Widget build(BuildContext context) {
   // CompleteBookingViewModel completebokingmodel= Provider.of<CompleteBookingViewModel>(context,listen: false);
    completeBookingViewModel = context.watch<CompleteBookingViewModel>();
    numberVerifyViewModel =context.watch<NumberVerifyViewModel>();

    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: white,
        body: DefaultTabController(
          length: 3,
          child: Scaffold(
              body: Padding(
            padding: const EdgeInsets.only(top: 50),
            child: Column(
              children: [
                TabBar(
                  labelStyle: TextStyle(fontSize: Small ? 13.0 : 18.0),
                  labelColor: h1Color,
                  unselectedLabelColor: Color(0Xff999EA3),
                  tabs: const [

                    Tab(
                      text: 'Upcoming',
                    ),
                    Tab(
                      text: 'Completed',
                    ),
                    Tab(
                      text: 'Cancelled',

                    ),
                  ],
                ),
                 Expanded(
                    child: TabBarView(
                  children: [
                    Center(
                      child: Upcoming(),
                    ),
                    Center(
                      child: CompletedPage(),
                    ),
                    Center(
                      child: Cancelled()
                    ),
                  ],
                ))
              ],
            ),
          )),
        ));
  }

  Widget Upcoming() {

    return
      Container(
      child: ListView.builder(itemBuilder: (context,int index){
        return Container(
                   child: Column(
                     children: [
                       Stack(
                         children: [
                           Padding(
                             padding: const EdgeInsets.all(8.0),
                             child: Container(
                               alignment: Alignment.bottomCenter,
                               width: double.infinity,
                               height: 226,
                               decoration: BoxDecoration(

                                   borderRadius: BorderRadius.circular(10)
                                   ,border: Border.all(
                                   width: 1,
                                   color: kSecondaryColor
                               )
                               ),
                               child: Column(
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left: 19,right: 19,top: 10),
                                     child: Row(
                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                       children: [
                                         Row(
                                           crossAxisAlignment: CrossAxisAlignment.center,

                                           children: [
                                             Icon(Icons.calendar_month,color: kPrimaryColor,),
                                             SizedBox(width: 11,),
                                             Text(
                                               "Mon 05/Oct/2021",
                                               //completeBookingViewModel.completebokingmodel!.response!.compbookinglist![index].poojaDate.toString(),
                                             style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff232323)),),
                                             // SizedBox(width: 105,),


                                           ],
                                         ),
                                         Row(
                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                           children: [
                                             Icon(Icons.location_on,color: h1Color,),
                                             SizedBox(width: 19.32,),
                                             Image.asset("assets/images/manu.png")
                                           ],
                                         )
                                       ],
                                     ),

                                   ),

                                   SizedBox(height: 3,),
                                   Center(child: Text(
                                     //"Vikrant Bhawani saini"
                                     completeBookingViewModel.completebokingmodel!.response!.compbookinglist![index].hostname.toString(),
                                     style: GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 12,color: kPrimaryColor),)),
                                   SizedBox(height: 3,),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 16),
                                     child: Text("Booking List",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600),),
                                   ),
                                   SizedBox(height: 4,),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 16),
                                     child:
                                     Text(completeBookingViewModel.completebokingmodel!.response!.compbookinglist![index].poojaTitle ?? "",style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 14,color: h1Color),),
                                     //Text("1 x Puranmashi katha(Offline)",style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 14,color: h1Color),),
                                   ),
                                   SizedBox(height: 4,),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 16),
                                     child: Text("1 x Astrology",style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 14,color: h1Color),),
                                   ),
                                   Padding(
                                     padding: const EdgeInsets.only(left: 16,right: 16 ,top: 10),
                                     child: DottedLine(


                                     ),
                                   ),
                                   SizedBox(height: 4,),
                                   Center(child: Text("Total Earnings: ${completeBookingViewModel.completebokingmodel!.response!.compbookinglist![index].totalEarning.toString()}",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: h1Color),))
                                   ,Padding(
                                     padding: const EdgeInsets.only(left: 16,right: 16 ,top: 10),
                                     child: Container(
                                       width: double.infinity,
                                       height: 48,
                                       decoration: BoxDecoration(
                                           borderRadius: BorderRadius.circular(4),
                                           color: buttonColor
                                       ),
                                       child: Center(child: TextButton(
                                           onPressed: (){


                                             CompleteBookingViewModel completebokingmodel= Provider.of<CompleteBookingViewModel>(context,listen: false);
                                             //context.watch<CompleteBookingViewModel>();
                                             completebokingmodel.completebookingAPIcall();

                                             NumberVerifyViewModel numberVerify = Provider.of<NumberVerifyViewModel>(context,listen: false);
                                             numberVerify.NumberVerifyAPIcall();
                                             //Navigator.push(context, MaterialPageRoute(builder: (context)=>Booking_Details_Screen()));
                                           },
                                           child: Text("View Details",style: GoogleFonts.lato(fontSize: 16,color: white,fontWeight: FontWeight.w500),))),
                                     ),
                                   )
                                 ],
                               ),
                             ),
                           ),

                         ],
                       ),
                     ],
                   ),
        );
      },
        //itemCount: 20,
        //Text(completeBookingViewModel.completebokingmodel!.response!.compbookinglist![0].poojaTitle ?? "",style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 14,color: h1Color),),

        itemCount:completeBookingViewModel.completebokingmodel?.response!.compbookinglist!.length,
      )
    );
  }
  Widget CompletedPage (){
    int index;

    return  ListView.builder(itemBuilder: (context,int index){
      return Container(
        child: Column(
          children: [
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    alignment: Alignment.bottomCenter,
                    width: double.infinity,
                    height: 226,
                    decoration: BoxDecoration(

                        borderRadius: BorderRadius.circular(10)
                        ,border: Border.all(
                        width: 1,
                        color: kSecondaryColor
                    )
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 19,right: 19,top: 10),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,

                                children: [
                                  Icon(Icons.calendar_month,color: kPrimaryColor,),
                                  SizedBox(width: 11,),
                                  Text(
                                    //"Mon 05/Oct/2021",
                                    completeBookingViewModel.completebokingmodel!.response!.compbookinglist![index].poojaDate.toString(),
                                    style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff232323)),),
                                  // SizedBox(width: 105,),


                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Icon(Icons.location_on,color: h1Color
                                  ),

                                ],
                              )
                            ],
                          ),




                        ),

                        SizedBox(height: 3,),
                        Center(child: Text(
                          //"Vikrant Bhawani saini",
                            completeBookingViewModel.completebokingmodel!.response!.compbookinglist![index].hostname.toString(),
                          style: GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 12,color: kPrimaryColor),)),
                        SizedBox(height: 3,),
                        Padding(
                          padding: const EdgeInsets.only(left: 16,top:2),
                          child: Text("Booking List",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600),),
                        ),
                        SizedBox(height: 4,),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text(
                            //"1 x Puranmashi katha(Offline)",
                              completeBookingViewModel.completebokingmodel!.response!.compbookinglist![index].poojaTitle.toString(),
                            style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 14,color: h1Color),),
                        ),
                        SizedBox(height: 4,),
                        Padding(
                          padding: const EdgeInsets.only(left: 16),
                          child: Text("1 x Astrology",style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 14,color: h1Color),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 16,right: 16 ,top: 10),
                          child: DottedLine(


                          ),
                        ),
                        SizedBox(height: 4,),
                        Center(child: Text("Total Earnings: ${ completeBookingViewModel.completebokingmodel!.response!.compbookinglist![index].totalEarning.toString()}",
                          style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w500,color: h1Color),))
                        ,Padding(
                          padding: const EdgeInsets.only(left: 16,right: 16 ,top: 10),
                          child: Container(
                            width: double.infinity,
                            height: 48,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(4),
                                color: b1Color
                            ),
                            child: Center(child: TextButton(
                                onPressed: (){


                                },
                                child: Text("ViewEarnings",style: GoogleFonts.lato(fontSize: 16,color: white,fontWeight: FontWeight.w500),))),
                          ),
                        )
                      ],
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),
      );
    },
      //itemCount: 5,
      itemCount:completeBookingViewModel.completebokingmodel!.response!.compbookinglist!.length,

    );

  }
  Widget Cancelled(){
    return Container(
        child: ListView.builder(itemBuilder: (context,int index){
          return Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        alignment: Alignment.bottomCenter,
                        width: double.infinity,
                        height: 174,
                        decoration: BoxDecoration(

                            borderRadius: BorderRadius.circular(10)
                            ,border: Border.all(
                            width: 1,
                            color: kSecondaryColor
                        )
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 8,top: 12),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    crossAxisAlignment: CrossAxisAlignment.center,

                                    children: [
                                      Icon(Icons.calendar_month,color: kPrimaryColor,),
                                      SizedBox(width: 11,),
                                      Text("Mon 05/Oct/2021",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600,color: Color(0xff232323)),),
                                      // SizedBox(width: 105,),


                                    ],
                                  ),
                                  Container(
                                    height: 25,
                                    width: 108,
                                    decoration: BoxDecoration(
                                      color: Colors.red
                                          ,
                                      borderRadius: BorderRadius.circular(20)
                                    ),
                                    child: const Center(child: Text("Cancelled")),
                                  )

                                ],
                              ),




                            ),

                            SizedBox(height: 8,),
                            Center(child: Text("Vikrant Bhawani saini",style: GoogleFonts.lato(fontWeight: FontWeight.w700,fontSize: 12,color: kPrimaryColor),)),
                            SizedBox(height: 3,),
                            Padding(
                              padding: const EdgeInsets.only(left: 16,top:16),
                              child: Text("Booking List",style: GoogleFonts.lato(fontSize: 14,fontWeight: FontWeight.w600),),
                            ),
                            SizedBox(height: 6,),
                            Padding(
                              padding: const EdgeInsets.only(left: 16),
                              child: Text("1 x Puranmashi katha(Offline)",style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 14,color: h1Color),),
                            ),
                           // SizedBox(height: 4,),
                            Padding(
                              padding: const EdgeInsets.only(left: 16,top: 4),
                              child: Text("1 x Astrology",style: GoogleFonts.lato(fontWeight: FontWeight.w400,fontSize: 14,color: h1Color),),
                            ),


                          ],
                        ),
                      ),
                    ),

                  ],
                ),
              ],
            ),
          );
        },
          itemCount: 20,
        )
    );
  }
}
