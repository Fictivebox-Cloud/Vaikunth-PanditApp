import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../../../Consts/text_const.dart';
import '../../../consts/themescolor.dart';
import '../../../view_model/Notification_VM.dart';

class Notifications_screen extends StatefulWidget {
  const Notifications_screen({Key? key}) : super(key: key);

  @override
  State<Notifications_screen> createState() => _Notifications_screenState();
}

class _Notifications_screenState extends State<Notifications_screen> {
  var ht, wt;
  late NotificationVM notificationVM;

  @override
  Widget build(BuildContext context) {
    notificationVM = context.watch<NotificationVM>();

    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(NOTIFICATIONS),
      ),
      backgroundColor: white,
      body: notificationVM.loading ? Center(child: CircularProgressIndicator(color: kPrimaryColor,)) :ListView.builder(
          itemBuilder: (context, int index) {
            return Padding(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 1),
                child: Column(
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.notifications,
                        color: Colors.black,
                      ),
                      title: Text(
                        notificationVM.notificationModel?.response!
                            .noticationslist![0].poojaTitle
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
    );
  }
}
