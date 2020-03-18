import 'package:b2b/blocs/login.bloc.dart';
import 'package:b2b/repository/base.repository.dart';
import 'package:b2b/ui/android/pages/login.page.dart';
import 'package:b2b/ui/android/pages/main.page.dart';
import 'package:b2b/ui/notifiers/login-page.notifier.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'config/application-config.dart';

void main() {
  var loginBloc = LoginBloc();

  runApp(MyApp(loginBloc));
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

  bool login = true;

  MyApp(this.loginBloc);

  var config = AplicationConfig.Dev();
  var loginBloc;

  @override
  Widget build(BuildContext context) {
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
      home: login ? LoginPage() : MainPage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
