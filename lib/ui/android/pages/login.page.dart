import 'file:///C:/Users/Igor/source/B2B/lib/config/application-config.dart';
import 'package:b2b/blocs/login.bloc.dart';
import 'package:b2b/ui/android/pages/main.page.dart';
import 'package:b2b/ui/notifiers/login-page.notifier.dart';
import 'package:b2b/ui/widgets/buttons.dart';
import 'package:b2b/ui/widgets/generic-progress.widget.dart';
import 'package:b2b/ui/widgets/text-fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  AplicationConfig _config;
  LoginPageUINotifier _notifier;
  LoginBloc _loginBloc;
  TextEditingController _controllerEmail;
  TextEditingController _controllerSenha;

  @override
  Widget build(BuildContext context) {
    _controllerEmail = TextEditingController();
    _controllerSenha = TextEditingController();

    _controllerEmail.addListener(validarEmail);
    _controllerSenha.addListener(validarSenha);

    _config = Provider.of<AplicationConfig>(context);
    _notifier = Provider.of<LoginPageUINotifier>(context);
    _loginBloc = Provider.of<LoginBloc>(context);
    return Scaffold(
        body: Center(
        child: _render(context),
    ));
  }

  Widget _render(context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        child:  Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 20,
                ),
                Image.asset(
                  _config.imageAsset,
                  height: 150,
                  width: 150,
                ),
                SizedBox(
                  height: 30,
                ),
                WidgetTextField(
                  _config.appStrings.pageLoginEmail,
                  leftIcon:
                      IconButton(icon: Icon(Icons.email), onPressed: () {}),
                  textInputAction: TextInputAction.next,
                  keyboardType: TextInputType.emailAddress,
                  controller: _controllerEmail,
                  onChanged: (text) {
                    _loginBloc.validarEmail(text);
                  },
                  onFieldSubmited: (term) {
                    FocusScope.of(context).nextFocus();
                  },
                ),
                SizedBox(
                  height: 10,
                ),
                WidgetTextField(_config.appStrings.pageLoginSenha,
                    leftIcon: IconButton(
                      icon: Icon(Icons.vpn_key),
                      onPressed: () {},
                    ),
                    textInputAction: TextInputAction.done,
                    controller: _controllerSenha,
                    onChanged: (text) {
                      _loginBloc.validarSenha(text);
                    },
                    rightIcon: IconButton(
                      icon: Icon(_notifier.exibirSenha
                          ? Icons.visibility
                          : Icons.visibility_off),
                      onPressed: () {
                        _notifier.exibirSenha = !_notifier.exibirSenha;
                      },
                    ),
                    obscureText: _notifier.exibirSenha ?
                      false :
                      true),
                SizedBox(
                  height: 10,
                ),
                _renderBtnLogin(_loginBloc),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                _renderBtnUp(_loginBloc),
              ],
            ),
      ),
    );
  }

  Widget _renderBtnLogin(LoginBloc loginBloc) {
    return loginBloc.processandoLogin
        ? GenericProgress()
        : Container(
            width: double.infinity,
            child: WidgetRaisedButton(
              child: Text(_config.appStrings.pageLoginBtnLogin),
              onPressed: loginBloc.emailValido && loginBloc.senhaValida
                  ? () {


                      loginBloc.loginEmailSenha(
                          _controllerEmail.text, _controllerSenha.text);
                    } : null

            ),
          );
  }

  Widget _renderBtnUp(LoginBloc loginBloc) {
    return loginBloc.processandoLogin
        ? Container()
        : WidgetFlatButton(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Icon(Icons.arrow_forward),
                Text(_config.appStrings.pageLoginSigIn)
              ],
            ),
            onPressed: () {},
          );
  }

  validarEmail(){

  }

  validarSenha(){

  }

}
