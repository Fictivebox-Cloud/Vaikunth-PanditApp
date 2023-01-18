import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:panditapp/consts/image_const.dart';
import 'package:panditapp/Widgets/circular_loader.dart';
import 'package:panditapp/consts/text_const.dart';

import 'package:panditapp/view_model/Profile/Bank%20Account%20Details/Bank_List_VM.dart';
import 'package:panditapp/view_model/Profile/Bank%20Account%20Details/Store_bank_VM.dart';
import 'package:provider/provider.dart';

import '../../../../consts/themescolor.dart';

class BankAccountScreen extends StatefulWidget {
  String? userId, id, name, accountNumber, bankName, ifscCode, defaultBank;
  bool isUpdate;

  BankAccountScreen({
    Key? key,
    this.userId,
    this.id,
    this.name,
    this.ifscCode,
    this.bankName,
    this.accountNumber,
    this.defaultBank,
    required this.isUpdate,
  }) : super(key: key);

  @override
  State<BankAccountScreen> createState() => _BankAccountScreenState();
}

class UpperCaseTextFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue, TextEditingValue newValue) {
    return TextEditingValue(
      text: newValue.text.toUpperCase(),
      selection: newValue.selection,
    );
  }
}

class _BankAccountScreenState extends State<BankAccountScreen> {
  var ht, wt;

  final TextEditingController _bankName = TextEditingController();
  final TextEditingController _accountNumber = TextEditingController();
  final TextEditingController _confirmAccountNumber = TextEditingController();
  final TextEditingController _accountHolderName = TextEditingController();
  final TextEditingController _ifscCode = TextEditingController();

  late BankListVM bankList_VM;
  late StoreBankVM storeBankVM;
  String? bankNameValue;
  bool isBankListVisible = false;
  List list = [];
  String searchValue = "";
  bool isCheck = false;

  @override
  void initState() {
    // TODO: implement initState
    if (widget.isUpdate) {
      if (widget.id!.isNotEmpty &&
          widget.accountNumber!.isNotEmpty &&
          widget.bankName!.isNotEmpty &&
          widget.ifscCode!.isNotEmpty
      ) {
        isCheck = widget.defaultBank == "1";
        _ifscCode.text = widget.ifscCode ?? "";
        _accountNumber.text = widget.accountNumber ?? "";
        _accountHolderName.text = widget.name ?? "";
        _confirmAccountNumber.text = widget.accountNumber ?? "";
        _bankName.text = widget.bankName ?? "";
      }
    }
    bankList_VM = Provider.of<BankListVM>(context, listen: false);
    storeBankVM = Provider.of<StoreBankVM>(context, listen: false);
    bankList_VM.bankListAPIcall(data: {"pandit_id": widget.userId});
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    wt = MediaQuery.of(context).size.width;
    ht = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: white,
      body: Consumer<BankListVM>(
        builder: (_, provider, __) =>
            provider.loading ? const Center(child: CircularLoader()) : body(),
      ),
    );
  }

  Widget dropDown() {
    return Consumer<BankListVM>(
        builder: (_, provider, __) => DropdownButtonHideUnderline(
              child: DropdownButton2(
                dropdownOverButton: true,
                isExpanded: true,
                hint: Row(
                  children: const [
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: Text(
                        'Select bank',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.normal,
                          color: h1Color,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  ],
                ),
                items: provider.bankListModel?.response?.banklist
                    ?.map((item) => DropdownMenuItem<String>(
                          value: item.bankName == "Bank of India"
                              ? ""
                              : item.bankName,
                          child: Text(
                            item.bankName ?? "",
                            style: const TextStyle(
                              fontSize: 16,
                              color: p1Color,
                              letterSpacing: 0.50,
                            ),
                            overflow: TextOverflow.ellipsis,
                          ),
                        ))
                    .toList(),
                value: bankNameValue,
                onChanged: (value) {
                  if (value != null && value != "") {
                    setState(() {
                      bankNameValue = value.toString();
                    });
                  }
                },
                icon: const Icon(
                  Icons.keyboard_arrow_down_sharp,
                  size: 30,
                ),
                iconSize: 14,
                iconEnabledColor: const Color(0xff252525),
                iconDisabledColor: h1Color,
                buttonHeight: 50,
                buttonPadding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 13,
                ),
                buttonDecoration: BoxDecoration(
                  color: TEXTFIELD_BACKGROUND_COLOR,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                  ),
                  border: Border.all(
                    color: TEXTFIELD_BORDER_COLOR,
                  ),
                ),
                dropdownMaxHeight: ht * 0.3,
                dropdownWidth: wt * 0.92,
                dropdownDecoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: TEXTFIELD_BACKGROUND_COLOR,
                ),
                dropdownElevation: 1,
                scrollbarRadius: const Radius.circular(40),
                scrollbarThickness: 6,
                scrollbarAlwaysShow: true,
                offset: const Offset(0, 0),
              ),
            ));
  }

  Widget bankList() {
    return Container(
      width: double.infinity,
      height: 400,
      decoration: BoxDecoration(
        color: TEXTFIELD_BACKGROUND_COLOR,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        children: [
          searchBank(),
          Expanded(child: Consumer<BankListVM>(
            builder: (_, provider, __) {
             return ListView.separated(
                   padding: const EdgeInsets.all(16),
                   itemBuilder: (context, index) => GestureDetector(
                     onTap: () {
                       setState(() {
                         _bankName.text = list[index];
                         isBankListVisible = !isBankListVisible;
                       });
                     },
                     child: Text(list[index] ?? "", style:  GoogleFonts.poppins(
                       fontSize: 16,
                       color: h1Color,
                     ),),
                   ), separatorBuilder: (context, index) => const Divider(), itemCount: list.length ?? 0);
            }
          ))
        ],
      ),
    );
  }

  Widget searchBank() {
    return Consumer<BankListVM>(
      builder: (_, provider, __) => TextField(
        cursorColor: colorPrimary,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: h1Color,
        ),
        onChanged: (value) {
          setState(() {
           if (value.length > 2) {
             list = list.where((element) => element.toString().toLowerCase().contains(value.toLowerCase())).toList();
           } else {
             list.clear();
             provider.bankListModel?.response?.banklist?.forEach((element) {
               list.add(element.bankName);
             });
           }
          });
        },
        decoration: InputDecoration(
            enabledBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
            ),
            focusedBorder: const UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
            ),
            border: const UnderlineInputBorder(
              borderSide: BorderSide(color: kPrimaryColor),
            ),
          hintText: SELECT_BANK,
          helperStyle: GoogleFonts.poppins(
            fontSize: 14,
            color: p1Color,
          ),
          filled: true,
          fillColor: TEXTFIELD_BACKGROUND_COLOR,
          focusColor: kPrimaryColor,
          // focusedBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(color: TEXTFIELD_BORDER_COLOR, width: 0.0),
          // ),
          // enabled: true,
          // enabledBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(color: TEXTFIELD_BORDER_COLOR, width: 0.0),
          // ),
        ),
        inputFormatters: [
          //LengthLimitingTextInputFormatter(10),
          FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
        ],
      ),
    );
  }

  Widget bankName() {
    return Consumer<BankListVM>(
      builder: (_, provider, __) => TextField(
        cursorColor: colorPrimary,
        controller: _bankName,
        style: GoogleFonts.poppins(
          fontSize: 14,
          color: h1Color,
        ),
        readOnly: true,
        onTap: () {
          setState(() {
            list.clear();
            provider.bankListModel?.response?.banklist?.forEach((element) {
              list.add(element.bankName);
            });

            isBankListVisible = !isBankListVisible;
          });
        },
        decoration: InputDecoration(
          hintText: SELECT_BANK,
          helperStyle: GoogleFonts.poppins(
            fontSize: 14,
            color: p1Color,
          ),
          suffixIcon: isBankListVisible ? const Icon(Icons.keyboard_arrow_up, color: h1Color,) : const Icon(Icons.keyboard_arrow_down, color: h1Color,),
          filled: true,
          fillColor: TEXTFIELD_BACKGROUND_COLOR,
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: TEXTFIELD_BORDER_COLOR, width: 1.0),
          ),
          enabled: true,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: TEXTFIELD_BORDER_COLOR, width: 1.0),
          ),
        ),
        inputFormatters: [
          //LengthLimitingTextInputFormatter(10),
          FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
        ],
      ),
    );
  }

  Widget accountHolderName() {
    return TextField(
      cursorColor: colorPrimary,
      controller: _accountHolderName,
      style: GoogleFonts.poppins(
        fontSize: 14,
        color: h1Color,
      ),
      onChanged: (value) {
        setState(() {});
      },
      decoration: InputDecoration(
        hintText: ACCOUNT_HOLDER_NAME,
        helperStyle: GoogleFonts.poppins(
          fontSize: 14,
          color: p1Color,
        ),
        filled: true,
        fillColor: TEXTFIELD_BACKGROUND_COLOR,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: TEXTFIELD_BORDER_COLOR, width: 1.0),
        ),
        enabled: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: TEXTFIELD_BORDER_COLOR, width: 1.0),
        ),
      ),
      inputFormatters: [
        //LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.allow(RegExp("[a-z A-Z]")),
      ],
    );
  }

  Widget accountNumber() {
    return TextField(
      cursorColor: colorPrimary,
      controller: _accountNumber,
      style: GoogleFonts.poppins(
        fontSize: 14,
        color: h1Color,
      ),
      onChanged: (value) {
        setState(() {});
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: ACCOUNT_NUMBER,
        helperStyle: GoogleFonts.poppins(
          fontSize: 14,
          color: p1Color,
        ),
        filled: true,
        fillColor: TEXTFIELD_BACKGROUND_COLOR,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: TEXTFIELD_BORDER_COLOR, width: 1.0),
        ),
        enabled: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: TEXTFIELD_BORDER_COLOR, width: 1.0),
        ),
      ),
      inputFormatters: [
        //LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
      ],
    );
  }

  Widget confirmAccountNumber() {
    return TextField(
      cursorColor: colorPrimary,
      controller: _confirmAccountNumber,
      style: GoogleFonts.poppins(
        fontSize: 14,
        color: h1Color,
      ),
      onChanged: (value) {
        setState(() {});
      },
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        hintText: CONFIRM_ACCOUNT_NUMBER,
        helperStyle: GoogleFonts.poppins(
          fontSize: 14,
          color: p1Color,
        ),
        filled: true,
        fillColor: TEXTFIELD_BACKGROUND_COLOR,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: TEXTFIELD_BORDER_COLOR, width: 1.0),
        ),
        enabled: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: TEXTFIELD_BORDER_COLOR, width: 1.0),
        ),
      ),
      inputFormatters: [
        //LengthLimitingTextInputFormatter(10),
        FilteringTextInputFormatter.allow(RegExp("[0-9]")),
      ],
    );
  }

  Widget ifscCode() {
    return TextField(
      cursorColor: colorPrimary,
      controller: _ifscCode,
      style: GoogleFonts.poppins(
        fontSize: 14,
        color: h1Color,
      ),
      onChanged: (value) {
        setState(() {});
      },
      decoration: InputDecoration(
        hintText: IFSC_CODE,
        helperStyle: GoogleFonts.poppins(
          fontSize: 14,
          color: p1Color,
        ),
        filled: true,
        fillColor: TEXTFIELD_BACKGROUND_COLOR,
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: TEXTFIELD_BORDER_COLOR, width: 1.0),
        ),
        enabled: true,
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: TEXTFIELD_BORDER_COLOR, width: 1.0),
        ),
      ),
      inputFormatters: [
        //LengthLimitingTextInputFormatter(10),
        UpperCaseTextFormatter(),
        FilteringTextInputFormatter.allow(RegExp("[a-z A-Z 0-9]")),
      ],
    );
  }

  Widget button() {
    return (_bankName.text.isEmpty ||
            _ifscCode.text.isEmpty ||
            _accountNumber.text.isEmpty ||
            _accountHolderName.text.isEmpty ||
            _confirmAccountNumber.text.isEmpty ||
            !(_accountNumber.text == _confirmAccountNumber.text ||
                _ifscCode.text.length > 10))
        ? Container()
        : Consumer<StoreBankVM>(
            builder: (_, provider, __) => SizedBox(
              width: double.infinity,
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
                  if (widget.isUpdate) {
                    await provider.updateBankAccountDetail(
                        bankId: widget.id,
                        name: _accountHolderName.text,
                        accountno: _accountNumber.text,
                        bankname: _bankName.text,
                        ifsccode: _ifscCode.text,
                        defaultBank: isCheck ? "1" : "",
                    );
                    if (!(provider.storeBankModel?.success ?? false)) {
                      Fluttertoast.showToast(
                          msg: provider.storeBankModel?.message ?? "");
                    } else {
                      Fluttertoast.showToast(
                          msg: provider.storeBankModel?.message ?? "");
                    }
                  } else {
                    await provider.Store_Bank_APIcall(
                        name: _accountHolderName.text,
                        accountno: _accountNumber.text,
                        bankname: _bankName.text,
                        ifsccode: _ifscCode.text,
                        defaultBank: isCheck ? "1" : "",
                    );
                    if (!(provider.storeBankModel?.success ?? false)) {
                      Fluttertoast.showToast(
                          msg: provider.storeBankModel?.message ?? "");
                    } else {
                      Fluttertoast.showToast(
                          msg: provider.storeBankModel?.message ?? "");
                    }
                  }
                },
                child: Text(
                  SAVE,
                  style: GoogleFonts.poppins(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: white,
                  ),
                ),
              ),
            ),
          );
    ;
  }

  Widget backArrowAndTitle() {
    return Row(
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
    );
  }

  Widget setAsPrimary() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(SET_AS_PRIMARY, style: GoogleFonts.poppins(
          fontSize: 16,
          color: h1Color
        ),),
        Checkbox(
            shape: CircleBorder(
              side: BorderSide(
                color: isCheck ? CHECK_BACKGROUND_COLOR : CHECK_BORDER_COLOR,
              ),
            ),
            activeColor: CHECK_BACKGROUND_COLOR,
            value: isCheck, onChanged: (value) {
              isCheck = value!;
              setState(() {});
            })
      ],
    );
  }

  Widget body() {
    return Consumer<StoreBankVM>(
      builder: (_, provider, __) => provider.loading
          ? const Center(child: CircularLoader())
          : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                backArrowAndTitle(),
                                const SizedBox(
                                  height: 40,
                                ),
                                // dropDown(),
                                // const SizedBox(
                                //   height: 10,
                                // ),
                                setAsPrimary(),
                                const SizedBox(
                                  height: 25,
                                ),
                                bankName(),
                                isBankListVisible
                                    ? Container()
                                    : const SizedBox(
                                        height: 10,
                                      ),
                                isBankListVisible ? bankList() : Container(),
                                isBankListVisible
                                    ? Container()
                                    : accountHolderName(),
                                isBankListVisible
                                    ? Container()
                                    : const SizedBox(
                                        height: 10,
                                      ),
                                isBankListVisible
                                    ? Container()
                                    : accountNumber(),
                                isBankListVisible
                                    ? Container()
                                    : const SizedBox(
                                        height: 10,
                                      ),
                                isBankListVisible
                                    ? Container()
                                    : confirmAccountNumber(),
                                isBankListVisible
                                    ? Container()
                                    : const SizedBox(
                                        height: 10,
                                      ),
                                isBankListVisible ? Container() : ifscCode(),
                              ],
                            ),
                          ),
                        ),
                        button(),
                      ],
                    ),
                  ),
                ),
    );
  }
}
