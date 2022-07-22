import 'package:flutter/material.dart';
import 'package:get/get_utils/get_utils.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/Screen/Home/Home_Screen.dart';

import '../../API/ApiCallLogin.dart';

class Account_details extends StatefulWidget {
  const Account_details({Key? key}) : super(key: key);

  @override
  State<Account_details> createState() => _Account_detailsState();
}

class _Account_detailsState extends State<Account_details> {
  var ht,wt;

  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16,top: 10),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,

                          children: [
                            Container(

                              width: 48,
                              height: 2,
                              color: Color(0xffFF7D33),
                            ),
                            Container(

                              width: 48,
                              height: 2,
                              color: Color(0xffFF7D33),
                            ),
                            Container(

                              width: 48,
                              height: 2,
                              color: Color(0xffFF7D33),
                            ),
                            Container(

                              width: 48,
                              height: 2,
                              color: Color(0xffFF7D33),
                            ),
                            Container(

                              width: 48,
                              height: 2,
                              color: Color(0xffFF7D33),
                            ),
                            Container(

                              width: 48,
                              height: 2,
                              color: Color(0xffFF7D33),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),


                        Text("Account details",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 24),),

                        SizedBox(
                          height: 32,
                        ),
                        Text("Account No",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 18),),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.black
                              )
                          ),
                          child: TextFormField(keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,


                                hintStyle: GoogleFonts.lato(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xffCACACA,)),



                              )

                          ),
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        Text("Choose Bank",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 18),),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.black
                              )
                          ),
                          child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,


                                hintStyle: GoogleFonts.lato(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xffCACACA,)),



                              )

                          ),
                        ),
                        SizedBox(
                          height: 36,
                        ),
                        Text("IFSC Code",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 18),),
                        SizedBox(
                          height: 8,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              border: Border.all(
                                  width: 1,
                                  color: Colors.black
                              )
                          ),
                          child: TextFormField(
                              decoration: InputDecoration(
                                border: InputBorder.none,

                                hintStyle: GoogleFonts.lato(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: Color(0xffCACACA,)),

                              )

                          ),
                        ),


                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,bottom: 24),

               // padding: EdgeInsets.only(top:MediaQuery.of(context).size.height * 0.22),
                child: Center(
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),

                        color: Color(0xffFF7D33)
                    ),
                    child: TextButton(

                        onPressed: (){
                          ApiCallLogin api = ApiCallLogin();
                          api.fechingloginApi(mobile: "8218772191",
                          name: "Vikran",
                            services: "vvvv"


                          );
                           Navigator.push(context, MaterialPageRoute(builder: (context)=>Home_Screen()));
                        }, child: Text('Finish',style: GoogleFonts.lato(
                        color: Color(0xffFFFFFF),fontSize: 24,
                        fontWeight: FontWeight.w600),)),
                  ),
                ),
              )
            ],
        ),
      ),
    );
  }
}
