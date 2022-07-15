import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/Screen/login_flow/Servies_you_provide.dart';

// import 'package:image_picker/image_picker.dart';

class Photo_Upload extends StatefulWidget {
  const Photo_Upload({Key? key}) : super(key: key);

  @override
  State<Photo_Upload> createState() => _Photo_UploadState();
}

class _Photo_UploadState extends State<Photo_Upload> {
  var ht,wt;

  Color kPrimaryColor = Color(0xffFF7D33);
  Color kSecondaryColor = Color(0xffCACACA);
  Color kScaffoldBackground = Color(0xffFFF3E9);
  Color p1Color =  Color(0xff6E798C);
  Color white = Color(0xffFFFFFF);
  Color h1Color =Color(0xff343D48);

  // PickedFile _imageFile;
  // final ImagePicker _picker = ImagePicker();
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
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30,top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,

                      children: [
                        Container(

                          width: 48,
                          height: 2,
                          color: kPrimaryColor,
                        ),
                        Container(

                          width: 48,
                          height: 2,
                          color: kPrimaryColor,
                        ),
                        Container(

                          width: 48,
                          height: 2,
                          color: kSecondaryColor,
                        ),
                        Container(

                          width: 48,
                          height: 2,
                          color: kSecondaryColor,
                        ),
                        Container(

                          width: 48,
                          height: 2,
                          color: kSecondaryColor,
                        ),
                        Container(

                          width: 48,
                          height: 2,
                          color: kSecondaryColor,
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 24,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text("Photo",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 24),),
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 30),
                    child: Text("Upload your photo",style: GoogleFonts.lato(fontWeight: FontWeight.w500,fontSize: 18,color: Color(0xff343D48)),),
                  ),
                  SizedBox(
                    height: 12,
                  ),
                  imageProfile(),



                ],
              ),
            ),
            Expanded(child:  Center(
              child: Padding(
                padding: const EdgeInsets.only(left: 16,right: 16),
                child: Container(
                  padding: EdgeInsets.only(top: MediaQuery.of(context).size.height *0.09),
                  child: Container(
                    width: double.infinity,
                    height: 48,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),

                        color: kPrimaryColor
                    ),
                    child: TextButton(

                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=>Servies_you_screen()));
                        }, child: Text('Next',style:
                    GoogleFonts.lato(
                        color: white,
                        fontSize: 24,
                        fontWeight: FontWeight.w600

                    ),
                    )),
                  ),
                ),
              ),
            ),)
          ],
        ),

      ),
    );
  }
   Widget imageProfile(){
    return Center(
      child: Stack(
          children: [
            CircleAvatar(
              radius: 80.0,
              backgroundImage:
              NetworkImage('https://cdn-icons-png.flaticon.com/512/149/149071.png'),
              backgroundColor: Colors.transparent,
            ),
            Positioned(
                bottom: 20.0,
                right: 20.0,
                child: InkWell(
                  onTap: (){
                        showModalBottomSheet(
                            context: context,
                            builder: (builder)=> bottomSheet(),
                    );
                  },
                  child: Icon(
                    Icons.camera_alt_outlined
                  ),
                ) )
          ],
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
                child: Icon(Icons.folder_open,color: Color(0xffF06414),),
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
  // void takePhoto(ImageSource source) async {
  //   final pickedFile = await _picker.getImage(
  //     source: source,
  //   );
  //   setState(() {
  //     _imageFile = pickedFile;
  //   });
  // }

}
