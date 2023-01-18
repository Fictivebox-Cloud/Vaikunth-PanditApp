import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/view_model/Profile/Bank%20Account%20Details/Pandit_Bank_List_VM.dart';
import 'package:provider/provider.dart';
import '../../../../Consts/image_const.dart';
import '../../../../consts/text_const.dart';
import '../../../../Util/login_in_User.dart';
import '../../../../Widgets/circular_loader.dart';
import '../../../../consts/themescolor.dart';
import '../../../../view_model/Profile/Bank Account Details/Delete_Bank_VM.dart';
import 'bank_account_screen.dart';

class PersionalBankDetails extends StatefulWidget {
  String bank_id;

  PersionalBankDetails({Key? key, required this.bank_id}) : super(key: key);

  @override
  State<PersionalBankDetails> createState() => _PersionalBankDetailsState();
}

class _PersionalBankDetailsState extends State<PersionalBankDetails> {
  TextEditingController bname = TextEditingController();

  late double wt, ht;

  Future<void> _refresh(bool reload, BuildContext context) {
    PanditBankListVM panditbanklist =
        Provider.of<PanditBankListVM>(context, listen: false);
    panditbanklist.panditbankListAPIcall();
    return Future.delayed(const Duration(seconds: 0));
  }

  late PanditBankListVM panditBankListVM;

  @override
  void initState() {
    panditBankListVM = Provider.of<PanditBankListVM>(context, listen: false);
    panditBankListVM.panditbankListAPIcall();
  }

  backArrowAndTitle() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pop();
            },
            child: SizedBox(
              width: 40,
              height: 40,
              child: SvgPicture.asset(ImageConst().BACKICON),
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Text(
            BANK_ACCOUNT_DETAILS,
            style: GoogleFonts.lato(
                fontWeight: FontWeight.w700, fontSize: 20, color: h1Color),
          ),
        ],
      ),
    );
  }

  _showlogoutDigalog({var accountNumber, var bankName, var id}) {
    return showDialog(
        context: context,
        builder: (context) => AlertDialog(
              title: Container(
                width: MediaQuery.of(context).size.width * 1,
                alignment: Alignment.center,
                child: Text(
                  PROFILE_BANK_DIALOG,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.lato(
                      fontSize: 18, fontWeight: FontWeight.w600),
                ),
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(42),
              ),
              content: SizedBox(
                width: double.infinity,
                height: 40,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ACCOUNT_NO_DOT,
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: h1Color),
                        ),
                        Text(
                          accountNumber,
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: p1Color),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          BANK_NAME_DOT,
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: h1Color),
                        ),
                        Text(
                          bankName,
                          style: GoogleFonts.lato(
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              color: p1Color),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actionsPadding: const EdgeInsets.only(bottom: 40),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        elevation:
                            MaterialStateProperty.resolveWith((states) => 0.0),
                        padding: MaterialStateProperty.resolveWith((states) =>
                            EdgeInsets.symmetric(
                                vertical: 13, horizontal: wt * 0.08)),
                        shape: MaterialStateProperty.resolveWith(
                            (states) => RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: p1Color,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                )),
                        backgroundColor:
                            MaterialStateColor.resolveWith((states) => white),
                      ),
                      onPressed: () {
                        panditBankListVM.Delete_Bank_APIcall(id: id);
                        Navigator.pop(context);
                      },
                      child: Text(
                        DONE,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: p1Color,
                        ),
                      ),
                    ),
                    ElevatedButton(
                      style: ButtonStyle(
                        alignment: Alignment.center,
                        elevation:
                            MaterialStateProperty.resolveWith((states) => 5.0),
                        padding: MaterialStateProperty.resolveWith((states) =>
                            EdgeInsets.symmetric(
                                vertical: 13, horizontal: wt * 0.08)),
                        shape: MaterialStateProperty.resolveWith(
                            (states) => RoundedRectangleBorder(
                                  side: const BorderSide(
                                    color: colorPrimary,
                                    width: 1,
                                  ),
                                  borderRadius: BorderRadius.circular(5),
                                )),
                        backgroundColor: MaterialStateColor.resolveWith(
                          (states) => colorPrimary,
                        ),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: Text(
                        CANCEL,
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: white,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ));
  }

  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return RefreshIndicator(
      onRefresh: () async {
        await _refresh(true, context);
      },
      color: kPrimaryColor,
      strokeWidth: 5,
      displacement: 0,
      child: Scaffold(
          bottomNavigationBar: Padding(
            padding:
                const EdgeInsets.only(left: 16, right: 16, bottom: 22, top: 16),
            child: ElevatedButton(
              style: ButtonStyle(
                alignment: Alignment.center,
                padding: MaterialStateProperty.resolveWith(
                    (states) => const EdgeInsets.symmetric(
                          vertical: 13,
                        )),
                backgroundColor:
                    MaterialStateColor.resolveWith((states) => colorPrimary),
              ),
              onPressed: () async {
                var userId = await LoggedInUserBloc.instance().getUserId();
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => BankAccountScreen(
                              userId: userId,
                              isUpdate: false,
                            )));
              },
              child: Text(
                AAD_ACCOUNT,
                style: GoogleFonts.poppins(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: white,
                ),
              ),
            ),
          ),
          body: Consumer<PanditBankListVM>(
              builder: (_, panditbanklist, __) => panditbanklist.loading
                  ? const Center(child: CircularLoader())
                  : SafeArea(
                      child: Column(
                        children: [
                          backArrowAndTitle(),
                          Expanded(
                            child: ListView.separated(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 16),
                              itemBuilder: (context, int index) {
                                return Container(
                                  width: double.infinity,
                                  //height: 126,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    border: Border.all(
                                        width: 1.3,
                                        color: panditbanklist
                                                    .panditBankListModel!
                                                    .response!
                                                    .panditbanklist![index]
                                                    .defaultBank ==
                                                "1"
                                            ? BANK_ACCOUNT_BORDER_COLOR
                                            : kSecondaryColor),
                                  ),
                                  child: Stack(
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.all(16.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  NAME,
                                                  style: GoogleFonts.lato(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: h1Color),
                                                ),
                                                const Text(": "),
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: p1Color),
                                                ),
                                                const Spacer(),
                                                Row(
                                                  children: [
                                                    InkWell(
                                                        onTap: () {
                                                          Navigator.push(
                                                              context,
                                                              MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          BankAccountScreen(
                                                                            isUpdate:
                                                                                true,
                                                                            id: panditbanklist.panditBankListModel!.response!.panditbanklist![index].id.toString(),
                                                                            name:
                                                                                panditbanklist.panditBankListModel!.response!.panditbanklist![index].accountHolderName.toString(),
                                                                            accountNumber:
                                                                                panditbanklist.panditBankListModel!.response!.panditbanklist![index].bankAccountNo.toString(),
                                                                            bankName:
                                                                                panditbanklist.panditBankListModel!.response!.panditbanklist![index].bankName.toString(),
                                                                            ifscCode:
                                                                                panditbanklist.panditBankListModel!.response!.panditbanklist![index].ifscCode.toString(),
                                                                            defaultBank:
                                                                                panditbanklist.panditBankListModel!.response!.panditbanklist![index].defaultBank.toString(),
                                                                          )));
                                                        },
                                                        child: Text(
                                                          EDIT,
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 12,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: black),
                                                        )),
                                                    const SizedBox(
                                                      width: 13,
                                                    ),
                                                    InkWell(
                                                        onTap: () {
                                                          _showlogoutDigalog(
                                                            accountNumber: panditbanklist
                                                                .panditBankListModel
                                                                ?.response
                                                                ?.panditbanklist?[
                                                                    index]
                                                                .bankAccountNo
                                                                .toString(),
                                                            bankName: panditbanklist
                                                                .panditBankListModel
                                                                ?.response
                                                                ?.panditbanklist?[
                                                                    index]
                                                                .bankName,
                                                            id: panditbanklist
                                                                .panditBankListModel
                                                                ?.response
                                                                ?.panditbanklist?[
                                                                    index]
                                                                .id
                                                                .toString(),
                                                          );
                                                        },
                                                        child: Text(
                                                          DELETE,
                                                          style: GoogleFonts
                                                              .poppins(
                                                                  fontSize: 14,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w500,
                                                                  color: red),
                                                        )),
                                                  ],
                                                )
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  "${ACCOUNT_NO}:",
                                                  style: GoogleFonts.lato(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
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
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: p1Color),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 14,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  BANK_NAME,
                                                  style: GoogleFonts.lato(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: h1Color),
                                                ),
                                                const Text(": "),
                                                Text(
                                                  panditbanklist
                                                      .panditBankListModel!
                                                      .response!
                                                      .panditbanklist![index]
                                                      .bankName
                                                      .toString(),
                                                  style: GoogleFonts.lato(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: p1Color),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 14,
                                            ),
                                            Row(
                                              children: [
                                                Text(
                                                  IFSC_CODE,
                                                  style: GoogleFonts.lato(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: h1Color),
                                                ),
                                                const Text(": "),
                                                Text(
                                                  panditbanklist
                                                      .panditBankListModel!
                                                      .response!
                                                      .panditbanklist![index]
                                                      .ifscCode
                                                      .toString(),
                                                  style: GoogleFonts.lato(
                                                      fontSize: 14,
                                                      fontWeight:
                                                          FontWeight.w500,
                                                      color: p1Color),
                                                ),
                                              ],
                                            ),
                                            const SizedBox(
                                              height: 8,
                                            ),
                                          ],
                                        ),
                                      ),
                                      panditbanklist
                                                  .panditBankListModel!
                                                  .response!
                                                  .panditbanklist![index]
                                                  .defaultBank ==
                                              "1"
                                          ? Positioned(
                                              right: 0.0,
                                              bottom: 0.0,
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        horizontal: 20,
                                                        vertical: 5),
                                                decoration: BoxDecoration(
                                                    color:
                                                        const Color(0xffD0FAD7),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            7)),
                                                child: Text(
                                                  PRIMARY,
                                                  style: GoogleFonts.poppins(
                                                    fontSize: 12,
                                                    color:
                                                        const Color(0xff2D933D),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Container(),
                                    ],
                                  ),
                                );
                              },
                              separatorBuilder: (context, index) =>
                                  const SizedBox(
                                height: 20,
                              ),
                              //itemCount: 13,
                              itemCount: panditbanklist.panditBankListModel!
                                  .response!.panditbanklist!.length,
                            ),
                          ),
                        ],
                      ),
                    ))),
    );
  }
}
