import 'file:///C:/Users/Igor/source/B2B/lib/config/application-config.dart';
import 'package:b2b/blocs/login.bloc.dart';
import 'package:b2b/ui/notifiers/login-page.notifier.dart';
import 'package:b2b/ui/widgets/buttons.dart';
import 'package:b2b/ui/widgets/generic-progress.widget.dart';
import 'package:b2b/ui/widgets/text-fields.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  AplicationConfig _config;
  LoginPageUINotifier _notifier;

  @override
  Widget build(BuildContext context) {
    _config = Provider.of<AplicationConfig>(context);
    _notifier = Provider.of<LoginPageUINotifier>(context);

    return Scaffold(
      body: Center(
        child: _render(context),
      )
    );
  }

  Widget _render(context) {
    var loginBloc = Provider.of<LoginBloc>(context);
    return SingleChildScrollView(
      child: Container(
        padding: EdgeInsets.all(30),
        child: Form(
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
            WidgetTextFormField(
              _config.appStrings.pageLoginEmail,
              leftIcon: IconButton(icon: Icon(Icons.email),onPressed: (){}),
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              onFieldSubmited: (term){
               FocusScope.of(context).nextFocus();
              },
            ),
            SizedBox(
              height: 10,
            ),
            WidgetTextFormField(_config.appStrings.pageLoginSenha,
                leftIcon: IconButton(icon: Icon(Icons.vpn_key),onPressed: (){},),
                textInputAction: TextInputAction.done,
                rightIcon: IconButton(
                  icon: Icon(_notifier.exibirSenha
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onPressed: () {
                    _notifier.exibirSenha = !_notifier.exibirSenha;
                  },
                ),obscureText: _notifier.exibirSenha ? false:true),
            SizedBox(
              height: 10,
            ),
            _renderBtnLogin(loginBloc),
            SizedBox(
              height: 20,
            ),

            SizedBox(
              height: 20,
            ),
            _renderBtnSigin(loginBloc)
            ,
          ],
        )),
      ),
    );
  }

  Widget _renderBtnLogin(LoginBloc loginBloc){
    return loginBloc.processando ?
           GenericProgress()
        :
    Container(
      width: double.infinity,
      child: WidgetRaisedButton(
        child: Text(_config.appStrings.pageLoginBtnLogin),
        onPressed: () { loginBloc.loginEmailSenha("asc@jcomm.com.br", "123456");},
      ),
    );
  }

  Widget _renderBtnSigin(LoginBloc loginBloc){
    return loginBloc.processando ?
    GenericProgress()
        :
    WidgetFlatButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[Icon(Icons.arrow_forward),Text(_config.appStrings.pageLoginSigIn)],
      ),
      onPressed: (){

      },
    )
    ;
  }

}
