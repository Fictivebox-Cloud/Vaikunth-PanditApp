import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../view_model/Profile/Personal_Detail_View_Model.dart';

class PanCardScreen extends StatelessWidget {
   PanCardScreen({Key? key}) : super(key: key);
  late Personal_Detail_View_Model personal_detail_view_model;
  @override
  Widget build(BuildContext context) {
    personal_detail_view_model = Provider.of(context, listen: false);
    personal_detail_view_model.getpersonalDetailApiCall();
    return Consumer<Personal_Detail_View_Model>(
  builder: (context, provider, child) {
  return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Image.network(provider.presonalDetailModel!.response!.panditIDcard![0].panCard.toString())
          ,//Image.network("https://assets-global.website-files.com/5f689f82910c6b4f1ffb855b/613b1f91b195318100f7d27e_aadhar%20card%402x-min.jpg")
        ],
      ),
    );
  },
);
  }
}
