import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


import '../../consts/text_const.dart';
import '../../consts/themescolor.dart';
import '../login_flow/Phone_Number.dart';
import 'Onbording_Model.dart';
import '../../consts/SizeConfig.dart';

class Onboarding_Screen extends StatefulWidget {
  const Onboarding_Screen({Key? key}) : super(key: key);

  @override
  State<Onboarding_Screen> createState() => _Onboarding_ScreenState();
}

class _Onboarding_ScreenState extends State<Onboarding_Screen> {
  var ht, wt;
  int currentIndex = 0;
  late PageController _controller;

  @override
  void initState() {
    _controller = PageController(initialPage: 0);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Widget topContainerDesign(){
    return Expanded(
        flex: 2,
        child: Container(
          height: double.infinity,
          width: double.infinity,
          color: Color.fromRGBO(240, 100, 20, 0.3),
          child: PageView.builder(
            controller: _controller,
            itemCount: onboardingContents.length,
            onPageChanged: (int index) {
              setState(() {
                currentIndex = index;
              });
            },
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.only(right: 10),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pushReplacement(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    PhoneNumber_Screen()));
                      },
                      child: Text(
                        SKIP,
                        textAlign: TextAlign.end,
                        style: GoogleFonts.lato(
                          fontSize: 18,
                        ),
                      ),
                    ),
                    Text(
                      BANCK,
                      textAlign: TextAlign.end,
                      style: GoogleFonts.lato(
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ));
  }

  Widget bottomContainerDesign() {
    return Expanded(
        flex: 1,
        child: Container(
          padding: EdgeInsets.only(left: 16, right: 16),
          color: Colors.white,
          child: Column(
            children: [
              const SizedBox(
                height: 32,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onboardingContents.length,
                          (index) => buildContainer(index, context))),
              SizedBox(
                height: ht * 0.046,
              ),
              Text(
                WELCOMETOBAIKHUBTPANDIT,
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: h1Color),
              ),
              //text,
              SizedBox(
                height: ht * 0.012,
              ),
              Text(
                  'Lorem Ipsum is simply dummy text of the printing and \n                                   typesetting industry.',
                  style: GoogleFonts.lato(color: p1Color)),
              SizedBox(
                height: ht * 0.032,
              ),
              Container(
                //padding: EdgeInsets.only(left: 16,right: 16,top),
                width: double.infinity,
                height: ht * 0.06,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: kPrimaryColor),
                child: TextButton(
                    onPressed: () {
                      if (currentIndex ==
                          onboardingContents.length - 1) {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (_) =>
                                    PhoneNumber_Screen()));
                      }
                      _controller.nextPage(
                        duration: Duration(microseconds: 100),
                        curve: Curves.bounceIn,
                      );
                    },
                    child: Text(
                      currentIndex == onboardingContents.length - 1
                          ? CONTINUE
                          : NEXT,
                      style: GoogleFonts.lato(
                          color: white,
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    )),
              )
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    SizeConfig().init(context);

    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              topContainerDesign(),
              bottomContainerDesign(),
            ],
          ),
        ));
  }

  Container buildContainer(int index, BuildContext context) {
    return Container(
      width: wt * 0.1,
      height: 4,
      margin: EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
          color: currentIndex == index ? kPrimaryColor : kSecondaryColor,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}