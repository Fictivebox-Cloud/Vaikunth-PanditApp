import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../view_model/Profile/Personal_Detail_View_Model.dart';

class ViewDecuments extends StatelessWidget {
  late PersonalDetailViewModel personal_detail_view_model;

  @override
  Widget build(BuildContext context) {
    personal_detail_view_model = Provider.of(context, listen: false);
    personal_detail_view_model.getpersonalDetailApiCall();

    return Scaffold(
        appBar: AppBar(),
        body: Consumer<PersonalDetailViewModel>(
          builder: (context, provider, child) {
            return Column(
              children: [
                Image.network(provider
                    .presonalDetailModel!.response!.panditIDcard![0].aadharFront
                    .toString()),
                Spacer(),
                Image.network(provider
                    .presonalDetailModel!.response!.panditIDcard![0].aadharBack
                    .toString())
              ],
            );
          },
        ));
  }
}
