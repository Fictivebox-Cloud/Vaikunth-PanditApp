import 'package:flutter/material.dart';
 const text = Text("hello",style:TextStyle(color: Colors.red,fontSize: 4),);
// Api Error

/*  Text("Welcome to Baikhunt Pandit",style: GoogleFonts.lato(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                          color: h1Color),),*/
const invalidResponse = 100;
const httpException = 101;
const noInternet = 102;
const invalidFormat = 103;
const timeout = 104;
const unknownError = 105;

const String invalidResponseMsg = "Invalid Response";
const String httpExceptionMsg = "Http Exception";
const String noInternetMsg = "No Internet";
const String invalidFormatMsg = "Invalid Format";
const String timeoutMsg = "Timeout";
const String unknownErrorMsg = "Unknown Error";