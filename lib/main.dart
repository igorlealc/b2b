import 'dart:async';

import 'file:///C:/Users/Igor/source/B2B/lib/config/application-config.dart';
import 'package:b2b/blocs/login.bloc.dart';
import 'package:b2b/config/shared-preferences.config.dart';
import 'package:b2b/repository/base.repository.dart';
import 'package:b2b/ui/android/pages/login.page.dart';
import 'package:b2b/ui/android/pages/main.page.dart';
import 'package:b2b/ui/notifiers/login-page.notifier.dart';
import 'package:b2b/ui/widgets/generic-progress.widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(MyApp());
  /*
  bool executou = false;
  String uid =  null;

  SharedPreferences.getInstance().then((prefs){
     uid = prefs.getString(SharedPreferencesNames.uIdUser);
     executou = true;
  });

  Timer.periodic(const Duration(seconds: 2), (a) {
    print(executou);
    if(executou) {
      a.cancel();
      runApp(MyApp(loginBloc,(uid==null||uid=="")));
    }
  });*/
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  var config = AplicationConfig.Dev();
  var loginBloc = LoginBloc();

  @override
  Widget build(BuildContext context) {
    loginBloc.verificarUsuarioLogado();
    return MultiProvider(
      providers: [
        Provider<Base>.value(value: Base()),
        Provider<AplicationConfig>.value(value: config),
        ChangeNotifierProvider<LoginPageUINotifier>.value(
            value: LoginPageUINotifier()),
        ChangeNotifierProvider<LoginBloc>.value(value: loginBloc)
      ],
      child: _render(),
    );
  }

  _render() {
    return MaterialApp(
      title: config.nome,
      theme: config.theme,
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<LoginBloc>(context);
    return bloc.processandoVerificacaoUsuarioLogado
        ? Center(child: GenericProgress())
        : bloc.fbUser == null ? LoginPage() : MainPage();
  }
}
