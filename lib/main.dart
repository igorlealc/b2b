import 'dart:io' as platform;

import 'file:///C:/Users/Igor/source/B2B/lib/config/application-config.dart';
import 'package:b2b/blocs/login.bloc.dart';
import 'package:b2b/repository/base.repository.dart';
import 'package:b2b/ui/android/pages/login.page.dart';
import 'package:b2b/ui/android/pages/main.page.dart';
import 'package:b2b/ui/notifiers/login-page.notifier.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
  var now = new DateTime.now();
  var formatter = new DateFormat('yyyy-MM-dd HH:mm:ss');
  String formatted = formatter.format(now);

  String app = "jcom";
  Firestore.instance.collection("info").document("1").setData({
    "Platform": platform.Platform.operatingSystem,
    "Pack": app,
    "Time": formatted
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  var config = AplicationConfig.Dev();
  var loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {

    return MultiProvider(
      providers: [
        Provider<Base>.value(value: Base())
       ,Provider<AplicationConfig>.value(value: config)
       ,ChangeNotifierProvider<LoginPageUINotifier>.value(value: LoginPageUINotifier())
       ,ChangeNotifierProvider<LoginBloc>.value(value: loginBloc)
      ],
      child: _render(),
    );
  }

  _render(){

    return MaterialApp(
      title: config.nome,
      theme: config.theme,
      home: loginBloc.fbUser == null? LoginPage():MainPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
