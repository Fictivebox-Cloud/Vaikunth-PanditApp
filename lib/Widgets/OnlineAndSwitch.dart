import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view_model/home_tab/Online_Ofline_view_model.dart';

class SwitchOf extends StatefulWidget {


  @override
  State<SwitchOf> createState() => _SwitchOfState();
}

class _SwitchOfState extends State<SwitchOf> {
  bool value  = true;
  late OnlineOflineViewModel ss;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(
        value: value,
        onChanged: (value)=> setState(() {
          OnlineOflineViewModel onlineOflineViewModel= Provider.of<OnlineOflineViewModel>(context,listen: false);
            onlineOflineViewModel.getOnlineOfline;
        })
    );
  }
}
