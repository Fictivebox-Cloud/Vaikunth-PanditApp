import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../Consts/text_const.dart';
import '../../consts/themescolor.dart';
import '../login_flow/phone_number.dart';
import 'Onbording_Model.dart';

class OnboardingScreen extends StatefulWidget {
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  State<OnboardingScreen> createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  var height, width;
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

  Widget topContainerDesign() {
    return Expanded(
      flex: 3,
      child: SizedBox(
        height: double.infinity,
        width: double.infinity,
        child: PageView.builder(
          controller: _controller,
          itemCount: onboardingContents.length,
          onPageChanged: (int index) {
            setState(() {
              currentIndex = index;
            });
          },
          itemBuilder: (context, index) => Container(),

        ),
      ),
    );
  }

  navigate() {
    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (_) => const PhoneNumber_Screen()));
  }

  Widget bottomContainerDesign() {
    return Expanded(
        flex: 2,
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16,),
          color: Colors.white,
          child: Column(
            children: [
              SizedBox(
                height: height * 0.03,
              ),
              Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(onboardingContents.length,
                      (index) => buildContainer(index, context))),
              SizedBox(
                height: height * 0.046,
              ),
              Text(
                currentIndex == 0 ? WELCOME_TO_BAIKHUBT_PANDIT : currentIndex == 1 ? EARN_UPTO : FLEXIBLE_TIMINGS,
                style: GoogleFonts.lato(
                    fontWeight: FontWeight.bold, fontSize: 18, color: h1Color),
              ),
              SizedBox(
                height: height * 0.012,
              ),
              Text(
                  'Lorem Ipsum is simply dummy text of the printing and \n typesetting industry.',
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(color: p1Color)),
              SizedBox(
                height: height * 0.032,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ButtonStyle(
                    alignment: Alignment.center,
                    padding: MaterialStateProperty.resolveWith((states) => const EdgeInsets.symmetric(vertical: 13,)),
                    backgroundColor: MaterialStateColor.resolveWith((states) => colorPrimary),
                  ),
                    onPressed: () {
                      navigate();
                }, child: Text(REGISTER_PANDIT, style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: white,
                ),)),
              ),
              TextButton(onPressed: () {
                navigate();
              }, child: Text(SIGN_IN, style: GoogleFonts.poppins(
                fontSize: 14,
                color: h1Color,
              ),))
            ],
          ),
        ));
  }

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: Colors.white,
        bottomNavigationBar: Container(
          width: double.infinity,
          height: 20,
          alignment: Alignment.center,
          child: Text.rich(
              TextSpan(
            children: [
              TextSpan(
                text: DEVELOPED_BY,
                style: GoogleFonts.poppins(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: p1Color,
                ),
              ),
              TextSpan(
                text: FICTIVEBOX,
                  style: GoogleFonts.poppins(
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                    color: h1Color,
              ),
              ),
            ],
          ),
          ),
        ),
        body: SafeArea(
          child: Column(
            children: [
              topContainerDesign(),
              bottomContainerDesign(),
            ],
          ),
        ),
    );
  }

  Container buildContainer(int index, BuildContext context) {
    return Container(
      width: width * 0.15,
      height: 3,
      margin: EdgeInsets.only(right: width * 0.03),
      decoration: BoxDecoration(
          color: currentIndex == index ? kPrimaryColor : kSecondaryColor,
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
