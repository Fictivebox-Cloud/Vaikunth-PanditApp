import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/view_model/Profile/Bank%20Account%20Details/Pandit_Bank_List_VM.dart';
import 'package:provider/provider.dart';
import '../../../../Consts/text_const.dart';
import '../../../../Widgets/circular_loader.dart';
import '../../../../consts/themescolor.dart';
import '../../../../view_model/Profile/Bank Account Details/Delete_Bank_VM.dart';
import '../../../../view_model/Profile/Bank Account Details/Update_Bank_VM.dart';
import 'Add_Bank_Account.dart';
import 'Bank Account Details.dart';

class Persional_Bank_Details extends StatefulWidget {
  String bank_id;

  Persional_Bank_Details({Key? key, required this.bank_id}) : super(key: key);

  @override
  State<Persional_Bank_Details> createState() => _Persional_Bank_DetailsState();
}

class _Persional_Bank_DetailsState extends State<Persional_Bank_Details> {
  TextEditingController bname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Pandit_Bank_List_VM panditbanklist = context.watch<Pandit_Bank_List_VM>();
    return Scaffold(
        bottomNavigationBar: Padding(
          padding:
              const EdgeInsets.only(left: 16, right: 16, bottom: 22, top: 16),
          child: GestureDetector(
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Add_Bank_Account()));
            },
            child: Container(
              width: double.infinity,
              height: 48,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                border: Border.all(width: 1, color: colorPrimary),
              ),
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Text(
                  ADD_OTHER_BANK,
                  style: GoogleFonts.lato(
                      fontWeight: FontWeight.w500,
                      fontSize: 16,
                      color: colorPrimary),
                  textAlign: TextAlign.center,
                ),
              ),
            ),
          ),
        ),
        appBar: AppBar(
          title: Hero(tag: "_text", child: Text(BANK_ACCOUNT_DETAILS)),
        ),
        body: panditbanklist.loading
            ? Center(child: CircularLoader())
            : SafeArea(
                child: ListView.separated(
                  itemBuilder: (context, int index) {
                    return Container(
                      padding: EdgeInsets.only(left: 16, right: 16, top: 16),
                      child: Container(
                        width: double.infinity,
                        //height: 126,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          border:
                              Border.all(width: 1.3, color: kSecondaryColor),
                        ),
                        child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      NAME,
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: h1Color),
                                    ),
                                    Text(": "),
                                    Text(
                                      //"Govind kumar"
                                      panditbanklist
                                          .panditBankListModel!
                                          .response!
                                          .panditbanklist![index]
                                          .accountHolderName
                                          .toString(),
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: p1Color),
                                    ),
                                    Spacer(),
                                    Row(
                                      children: [
                                        InkWell(
                                            onTap: () {
                                              Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          Bank_Account_Screen(
                                                            id: panditbanklist
                                                                .panditBankListModel!
                                                                .response!
                                                                .panditbanklist![
                                                                    index]
                                                                .id
                                                                .toString(),
                                                            name: panditbanklist
                                                                .panditBankListModel!
                                                                .response!
                                                                .panditbanklist![
                                                                    index]
                                                                .accountHolderName
                                                                .toString(),
                                                            accountNumber: panditbanklist
                                                                .panditBankListModel!
                                                                .response!
                                                                .panditbanklist![
                                                                    index]
                                                                .bankAccountNo
                                                                .toString(),
                                                            bankName: panditbanklist
                                                                .panditBankListModel!
                                                                .response!
                                                                .panditbanklist![
                                                                    index]
                                                                .bankName
                                                                .toString(),
                                                            ifscCode: panditbanklist
                                                                .panditBankListModel!
                                                                .response!
                                                                .panditbanklist![
                                                                    index]
                                                                .ifscCode
                                                                .toString(),
                                                          )));
                                            },
                                            child: Text(
                                              EDIT,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 12,
                                                  fontWeight: FontWeight.w500,
                                                  color: black),
                                            )),
                                        SizedBox(
                                          width: 13,
                                        ),
                                        InkWell(
                                            onTap: () {
                                              Delete_Bank_VM deletebank =
                                              Provider.of<Delete_Bank_VM>(context, listen: false);
                                              deletebank.Delete_Bank_APIcall();
                                            },
                                            child: Text(
                                              DELETE,
                                              style: GoogleFonts.poppins(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.w500,
                                                  color: red),
                                            )),
                                      ],
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 10,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      "${ACCOUNT_NO}:",
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: h1Color),
                                    ),

                                    Text(
                                      panditbanklist
                                          .panditBankListModel!
                                          .response!
                                          .panditbanklist![index]
                                          .bankAccountNo
                                          .toString(),
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: p1Color),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      BANK_NAME,
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: h1Color),
                                    ),
                                    Text(": "),
                                    Text(
                                      panditbanklist
                                          .panditBankListModel!
                                          .response!
                                          .panditbanklist![index]
                                          .bankName
                                          .toString(),
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: p1Color),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 14,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      IFSC_CODE,
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: h1Color),
                                    ),
                                    Text(": "),
                                    Text(
                                      panditbanklist
                                          .panditBankListModel!
                                          .response!
                                          .panditbanklist![index]
                                          .ifscCode
                                          .toString(),
                                      style: GoogleFonts.lato(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: p1Color),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 8,
                                ),
                              ],
                            )),
                      ),
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 0,
                  ),
                  //itemCount: 13,
                  itemCount: panditbanklist
                      .panditBankListModel!.response!.panditbanklist!.length,
                ),
              ));
  }
}
