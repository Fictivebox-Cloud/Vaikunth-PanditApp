import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/Screen/login_flow/Documents_screen.dart';
import 'package:panditapp/Services/CityListApi.dart';
import 'package:panditapp/model/City_Model.dart';
import 'package:provider/provider.dart';
class City_Screen extends StatefulWidget {
  final String? name3,photo3,mobile;

  const City_Screen({Key? key,this.name3,this.photo3,this.mobile}) : super(key: key);

  @override
  State<City_Screen> createState() => _City_ScreenState();
}

class _City_ScreenState extends State<City_Screen> {
  var ht,wt;


  Color kPrimaryColor = Color(0xffFF7D33);
  Color kSecondaryColor = Color(0xffCACACA);
  Color kScaffoldBackground = Color(0xffFFF3E9);
  Color p1Color =  Color(0xff6E798C);
  Color white = Color(0xffFFFFFF);
  Color h1Color =Color(0xff343D48);



  @override
  void initState() {

    City_List_Api ss =  Provider.of<City_List_Api>(context, listen: false);
    ss.fachingApiCityList();
  }


  @override
  Widget build(BuildContext context) {


    return Scaffold(
      backgroundColor: Colors.white,
      body: Consumer<City_List_Api>(builder: (_, data ,__){
        return SafeArea(
          child: Column(
            children: [
              SingleChildScrollView(
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
                                color: kPrimaryColor
                            ),
                            Container(

                                width: 48,
                                height: 2,
                                color: kSecondaryColor
                            ),
                            Container(

                                width: 48,
                                height: 2,
                                color: kSecondaryColor
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 24,
                        ),


                        Text("Select your city",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 24),),

                        //Text("Photo url${widget.photo3}"),
                        //Text("name${widget.name3}"),

                        SizedBox(
                          height: 32,
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
                            onChanged: (text){
                              text =text.toLowerCase();
                              setState((){
                                City_List_Api().fachingApiCityList();
                              });
                            },


                            decoration: InputDecoration(

                                border: InputBorder.none,

                                hintText: "Search for your city",
                                hintStyle: GoogleFonts.lato(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 14,
                                    color: kSecondaryColor),

                                prefixIcon: const Icon(Icons.search,color: Color(0xff6E798C),

                                )

                            ),
                          ),
                        ),
                        SizedBox(
                          height: 30,
                        ),

                        Container(
                          width: double.infinity,
                          height: 100,
                          child: ListView.builder(

                              itemBuilder: ((context,  index){
                            return Text(data.cityMidel.response!.citylist![index].name.toString());
                          }))
                        )





                      ],
                    ),
                  ),
                ),
              ),
              Spacer(),
              Padding(
                padding: const EdgeInsets.only(left: 16,right: 16,bottom: 24),
                child: Container(
                  width: double.infinity,
                  height: 48,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(4),

                      color: kPrimaryColor
                  ),
                  child: TextButton(

                      onPressed: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>Documents_Screen(name4: widget.name3,photo4: widget.photo3,mobile: widget.mobile)));
                      }, child: Text('Next',style: GoogleFonts.lato(
                      color: Color(0xffFFFFFF),fontSize: 24,
                      fontWeight: FontWeight.w600),)),
                ),
              )
            ],
          ),
        );
      })
    );
  }
}