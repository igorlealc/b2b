import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'dart:io' as platform;

class GenericProgress extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    if (platform.Platform.isAndroid){
      return android();
    }
    else if (platform.Platform.isIOS){
      return ios();
    }
    else{
      throw Exception("Plataforma Incompatível!");
    }

  }

  Widget android(){
    return CircularProgressIndicator();
  }

  Widget ios(){
    return CupertinoActivityIndicator();
  }

}
