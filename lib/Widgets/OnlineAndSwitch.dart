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
  late Online_Ofline_View_Model ss;

  @override
  Widget build(BuildContext context) {
    return CupertinoSwitch(

        value: value,
        onChanged: (value)=> setState(() {
          Online_Ofline_View_Model online_ofline_view_model= Provider.of<Online_Ofline_View_Model>(context,listen: false);
            online_ofline_view_model.getOnlineOfline;
        })
    );
  }
}
