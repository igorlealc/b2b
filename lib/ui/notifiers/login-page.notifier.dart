import 'package:flutter/widgets.dart';

class LoginPageUINotifier extends ChangeNotifier{

  bool _exibirSenha = false;

  set exibirSenha(bool value){
    _exibirSenha = value;
    notifyListeners();
  }

  bool get exibirSenha{
    return _exibirSenha;
  }

}