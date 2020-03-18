import 'file:///C:/Users/Igor/source/B2B/lib/config/application-config.dart';
import 'package:b2b/blocs/login.bloc.dart';
import 'package:b2b/ui/notifiers/login-page.notifier.dart';
import 'package:b2b/ui/widgets/buttons.dart';
import 'package:b2b/ui/widgets/generic-progress.widget.dart';
import 'package:b2b/ui/widgets/text-fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

final _formKey = GlobalKey<FormState>();
final _scaffoldKey = GlobalKey<ScaffoldState>();

class LoginPage extends StatelessWidget {
  AplicationConfig _config;
  LoginPageUINotifier _notifier;
  LoginBloc _loginBloc;

  @override
  Widget build(BuildContext context) {

    _config = Provider.of<AplicationConfig>(context);
    _notifier = Provider.of<LoginPageUINotifier>(context);
    _loginBloc = Provider.of<LoginBloc>(context);

    return Scaffold(
       key: _scaffoldKey,
        body: Center(
      child: _render(context),
    ));
  }

  Widget _render(context) {
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        child: Form(
          key: _formKey,
            child: Column(
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
            )),
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
                      loginBloc.loginEmailSenha();
                    }
                  : null,
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
}
