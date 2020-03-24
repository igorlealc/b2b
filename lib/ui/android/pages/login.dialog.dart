import 'package:b2b/blocs/login.bloc.dart';
import 'package:b2b/config/application-config.dart';
import 'package:b2b/ui/notifiers/login-page.notifier.dart';
import 'package:b2b/ui/widgets/buttons.dart';
import 'package:b2b/ui/widgets/generic-progress.widget.dart';
import 'package:b2b/ui/widgets/text-fields.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class LoginDialog extends StatelessWidget {
  AplicationConfig _config;
  LoginPageUINotifier _notifier;
  LoginBloc _loginBloc;
  TextEditingController _ctrlEmail;
  TextEditingController _ctrlSenha;

  @override
  Widget build(BuildContext context) {
    _config = Provider.of<AplicationConfig>(context);
    _notifier = Provider.of<LoginPageUINotifier>(context);
    _loginBloc = Provider.of<LoginBloc>(context);
    _ctrlEmail = TextEditingController();
    _ctrlSenha = TextEditingController();

    _ctrlEmail.text = _loginBloc.email;
    _ctrlSenha.text = _loginBloc.senha;

    return AlertDialog(
      title: Text("Login"),
      content: _render(context),
      scrollable: true,
      actions: _loginBloc.processandoLogin? <Widget>[] : <Widget>[
        Container(
            width: 500000,
            child: Row(
              children: <Widget>[
                FlatButton(
                  child: Text("Registre-se"),
                ),
                Expanded(
                  child: Container(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          FlatButton(
                            child: Text("Cancelar"),
                            onPressed: (){Navigator.of(context).pop();},
                          ),
                          FlatButton(
                            child: Text(_config.appStrings.pageLoginBtnLogin),
                            onPressed: _loginBloc.emailValido && _loginBloc.senhaValida
                                ? () {
                                  _loginBloc.loginEmailSenha();
                                }
                            :   null,
                          ),
                        ],
                      )),
                )
              ],
            ))
      ],
    );

  }

  Widget _render(context) {
    return _loginBloc.processandoLogin ? Center(child: GenericProgress(),) : Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        WidgetTextField(
          _config.appStrings.pageLoginEmail,
          leftIcon: IconButton(icon: Icon(Icons.email), onPressed: () {}),
          textInputAction: TextInputAction.next,
          keyboardType: TextInputType.emailAddress,
          controller: _ctrlEmail,
          onChanged: (text) {
            _loginBloc.validarEmail(text);
          },
          onFieldSubmited: (term) {
            FocusScope.of(context).nextFocus();
          },
        ),
        WidgetTextField(_config.appStrings.pageLoginSenha,
            controller: _ctrlSenha,
            leftIcon: IconButton(
              icon: Icon(Icons.vpn_key),
              onPressed: () {},
            ),
            textInputAction: TextInputAction.done, onChanged: (text) {
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
            obscureText: _notifier.exibirSenha ? false : true),

      ],
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
