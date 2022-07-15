import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/Screen/login_flow/Phone_Number.dart';




import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Onbording_Model.dart';
import 'SizeConfig.dart';
class Onboarding_Screen extends StatefulWidget {
  const Onboarding_Screen({Key? key}) : super(key: key);

  @override
  State<Onboarding_Screen> createState() => _Onboarding_ScreenState();
}

class _Onboarding_ScreenState extends State<Onboarding_Screen> {

  var ht,wt;
   Color kPrimaryColor = Color(0xffFF7D33);
   Color kSecondaryColor = Color(0xffCACACA);
   Color kScaffoldBackground = Color(0xffFFF3E9);
   Color p1Color =  Color(0xff6E798C);
   Color white = Color(0xffFFFFFF);
   Color h1Color =Color(0xff343D48);



  int currentIndex = 0;
  late PageController _controller;


  @override
  void initState(){
   _controller = PageController(initialPage: 0);
        super.initState();
  }

   @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

 wt = MediaQuery.of(context).size.width;
 ht = MediaQuery.of(context).size.height;
    SizeConfig().init(context);

    return  Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              flex: 2,
                child:
             Container(
               height: double.infinity,
              width: double.infinity,

               color: Color.fromRGBO(240, 100, 20, 0.3),
               child: PageView.builder(
                 controller: _controller,

                 itemCount: onboardingContents.length,

                 onPageChanged: (int index){
                   setState((){
                     currentIndex= index;
                   });
                 },

                 itemBuilder: (context, index)=>Padding(
                   padding: const EdgeInsets.only(right: 10),

                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.spaceBetween,

                       children: [
                         Text(


                           currentIndex==onboardingContents.length -0 ?'Back':"Skip",
                           textAlign: TextAlign.end,
                           style: GoogleFonts.lato(fontSize: 18,
                           ),
                         ),
                         Text(
                           currentIndex==onboardingContents.length -1 ?'Back':"Back",
                           textAlign: TextAlign.end,
                           style: GoogleFonts.lato(fontSize: 18,
                           ),
                         ),
                       ],
                     ),

                   ),

                 ),

               ),
             )

      ),
            Expanded(
              flex: 1,

                child: Container(
                  color: Colors.white,
                  child: Column(
                    children: [
                         SizedBox(
                           height: ht*0.032,
                  ),
                            Container(
                              child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                                children: List.generate(onboardingContents.length,
                                        (index)=>buildContainer(index ,context)
                                        )
                              ),
                            ),
                      SizedBox(
                        height: ht*0.046,
                      ),
                      Text("Welcome to Baikhunt Pandit",style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: h1Color),),
                      SizedBox(
                        height: ht*0.012,
                      ),
                      Text('Lorem Ipsum is simply dummy text of the printing and \n                                   typesetting industry.',
                      style: GoogleFonts.lato(color: p1Color)),
                      SizedBox(
                        height: ht*0.032,
                      ),
                      Container(
                        width: wt* 0.7,
                        height: ht * 0.06
                        ,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(4),
                              color: kPrimaryColor
                        ),
                        child: TextButton(
                            onPressed: (){
                             if( currentIndex == onboardingContents.length -1){
                               Navigator.push(context, MaterialPageRoute(builder: (_)=>PhoneNumber_Screen()));

                             }
                             _controller.nextPage(duration: Duration(microseconds: 100), curve: Curves.bounceIn,
                             );


                                                         },
                            child: Text(currentIndex==onboardingContents.length -1 ?'Continue':"Next" ,
                          style: GoogleFonts.lato(color: white,fontWeight: FontWeight.w600,fontSize: 20),)),
                      )
                    ],
                  ),

            ))
          ],
        ) ,

      )
    );
  }

  Container buildContainer(int index , BuildContext context) {
    return Container(
                                        width: wt *0.1,
                                        height: 4,
                                        margin: EdgeInsets.only(right: 5),
                                        decoration: BoxDecoration(
                                            color:currentIndex==index? kPrimaryColor:
                                            kSecondaryColor,
                                          borderRadius: BorderRadius.circular(10)
                                        ),
                                      );
  }
}
