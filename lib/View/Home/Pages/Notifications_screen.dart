import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../Consts/text_const.dart';
import '../../../consts/themescolor.dart';
import '../../../view_model/Notification_VM.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends State<NotificationsScreen> {
  var ht, wt;
 // late NotificationVM notificationVM;

  @override
  Widget build(BuildContext context) {
    NotificationVM notificationVM = context.watch<NotificationVM>();

    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
     /* appBar: AppBar(
        title: Text(NOTIFICATIONS),
      ),*/
      backgroundColor: white,
      body: Column(
        children: [
          Appbar(),
          Expanded(
            child: notificationVM.loading ? Center(child: CircularProgressIndicator(color: kPrimaryColor,)) :ListView.builder(
                itemBuilder: (context, int index) {
                  return Padding(
                      padding: const EdgeInsets.only(left: 16, right: 16, top: 1),
                      child: Column(
                        children: [
                          ListTile(
                            leading: SvgPicture.asset("assets/images/bell.svg"),
                            title: Text(
                              notificationVM.notificationModel?.response!
                                  .noticationslist![index].poojaTitle
                                  ??"",
                              style: GoogleFonts.lato(
                                  color: h1Color,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400),
                            ),
                            trailing: Text(
                              JUST_NOW,
                              style: GoogleFonts.lato(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 12,
                                  color: kSecondaryColor),
                            ),
                          ),
                          Divider(
                            color: Color(0xffECF1F6),
                          ),
                        ],
                      ));
                },
                // itemCount: 24,
                itemCount: notificationVM
                    .notificationModel?.response!.noticationslist!.length),
          ),
        ],
      ),
    );
  }

  Widget Appbar() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 0,left: 16,right: 16,top: 44),
      child: Row (children: [
        InkWell(
            onTap: (){
              Navigator.pop(context);
            },
            child: SvgPicture.asset("assets/images/lefticon.svg")),
        SizedBox(width: 12,),
        Text("Notification", style: GoogleFonts.lato(
            fontSize: 18,
           // color: h1Color,
            fontWeight: FontWeight.w600),),
        Spacer(),
        Icon(Icons.more_vert),

      ],),
    );
  }

}
