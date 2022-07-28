import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/Viwe/login_flow/Account_details.dart';

import 'package:panditapp/model/getterSetter.dart';
class Documents_Screen extends StatefulWidget {

  final String? name4,photo4,mobile;

  const Documents_Screen({Key? key,this.name4,this.photo4,this.mobile}) : super(key: key);


  @override
  State<Documents_Screen> createState() => _Documents_ScreenState();
}

class _Documents_ScreenState extends State<Documents_Screen> {
  var ht,wt;

  Color kPrimaryColor = Color(0xffFF7D33);
  Color kSecondaryColor = Color(0xffCACACA);
  Color kScaffoldBackground = Color(0xffFFF3E9);
  Color p1Color =  Color(0xff6E798C);
  Color white = Color(0xffFFFFFF);
  Color h1Color =Color(0xff343D48);
  TextEditingController _addharno = TextEditingController();
  TextEditingController _panno = TextEditingController();


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
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16,top: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,

                        children: [
                          Container(

                            width: 48,
                            height: 2,
                            color: kPrimaryColor
                          ),
                          Container(

                            width: 48,
                            height: 2,
                              color: kPrimaryColor
                          ),
                          Container(

                            width: 48,
                            height: 2,
                              color: kPrimaryColor
                          ),
                          Container(

                            width: 48,
                            height: 2,
                            color: Color(0xffFF7D33),
                          ),
                          Container(

                            width: 48,
                            height: 2,
                              color: kPrimaryColor
                          ),
                          Container(

                            width: 48,
                            height: 2,
                              color: kSecondaryColor
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 24,
                      ),


                      Text("Documents",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 24),),

                      const SizedBox(
                        height: 17,
                      ),
                      Text("Aadhar",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 18),),
                      const SizedBox(
                        height: 8,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                           InkWell(
                               onTap: (){
                                 showModalBottomSheet(
                                   context: context,
                                   builder: (builder)=> bottomSheet(),
                                 );
                               },
                               child: Image.asset("assets/images/Aadhar Front.png")),
                          InkWell(
                              onTap: (){
                                showModalBottomSheet(
                                  context: context,
                                  builder: (builder)=> bottomSheet(),
                                );
                              },
                              child: Image.asset("assets/images/Aadhar Back.png"))


                        ],
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                width: 1,
                                color: Colors.black
                            )
                        ),
                        child: Center(
                          child: TextFormField(
                            controller: _addharno,
                            keyboardType: TextInputType.number,


                            decoration: InputDecoration(

                                border: InputBorder.none,

                                hintText: "Enter Your Aadhar No",
                                hintStyle: GoogleFonts.lato(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: kSecondaryColor),

                                )

                            ),
                        ),
                        ),
                      const SizedBox(
                        height: 16,
                      ),
                      Text("PAN",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 18),),
                      SizedBox(
                        height: 16,
                      ),
                      Row(

                        children: [
                          InkWell(
                              onTap: (){
                                showModalBottomSheet(
                                  context: context,
                                  builder: (builder)=> bottomSheet(),
                                );
                              },
                              child: Image.asset("assets/images/PAN.png"))


                        ],
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(
                                width: 1,
                                color: Colors.black
                            )
                        ),
                        child: Center(
                          child: TextFormField(
                            controller: _panno,
                              //keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                border: InputBorder.none,
                                hintText: "Enter Your PAN No",
                                hintStyle: GoogleFonts.lato(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: kSecondaryColor),
                              ),

                              inputFormatters: [
                              LengthLimitingTextInputFormatter(19),
                                FilteringTextInputFormatter.allow(RegExp("[a-zA-Z0-9]")),
                              ],


                          ),
                        ),
                      ),



                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left:16,right:16,bottom: 24),
              child: Center(
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),

                      color: kPrimaryColor
                  ),
                  child: TextButton(
                      onPressed: (){
                        GetterloginSetter s = GetterloginSetter();
                        s.pancard = _addharno.text;
                        s.aadhar = _panno.text;

                        print("Bhawani addhar ${s.pancard}");
                        print("Bhawani pan ${s.aadhar}");
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Account_details(aadhar: _addharno.text,pancard: _panno.text,name5: widget.name4,photo5: widget.photo4,mobile: widget.mobile)));
                      }, child: Text('Next',style: GoogleFonts.lato(
                      color: white,fontSize: 24,
                      fontWeight: FontWeight.w600),)),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget bottomSheet(){
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 200,
      margin:  EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 20
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                width: wt * 0.30,
                height: ht * 0.20,

                decoration: BoxDecoration(
                    color: Color(0xffECF1F6),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xffECF1F6)
                          ,
                          blurRadius: 10,
                          spreadRadius: 1
                          ,offset: Offset(4,4)
                      )
                    ]
                ),
                child:  InkWell(
                  onTap: (){

                  },
                  child: Icon(Icons.camera,color: Color(0xffF06414),),




                ),
              ),
              Container(
                width: wt * 0.30,
                height: ht * 0.20,
                decoration: BoxDecoration(
                    color: Color(0xffECF1F6),
                    shape: BoxShape.circle,
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xffECF1F6)
                          ,
                          blurRadius: 10,
                          spreadRadius: 1
                          ,offset: Offset(4,4)
                      )
                    ]
                ),
                child: InkWell(
                    onTap: (){

                    },
                    child: Icon(Icons.folder_open,color: Color(0xffF06414),)),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("Open Camera",style: GoogleFonts.lato(fontSize: 12,
                  fontWeight: FontWeight.w500
              ),),
              Text("Open Files",style: GoogleFonts.lato(fontSize: 12,
                  fontWeight: FontWeight.w500
              ),)
            ],

          )
        ],
      ),


    );
  }
}
