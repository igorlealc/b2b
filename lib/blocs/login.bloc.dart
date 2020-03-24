import 'package:b2b/config/shared-preferences.config.dart';
import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginBloc extends ChangeNotifier{

  bool processandoLogin = false;
  bool processandoVerificacaoUsuarioLogado = false;
  bool emailValido = false;
  bool senhaValida = false;
  String repostaNaoAutenticado = "";
  FirebaseUser fbUser = null;
  String email = "";
  String senha = "";

  loginEmailSenha() async {
    try {
      processandoLogin = true;
      notifyListeners();
      var a = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: senha);
      fbUser = a.user;
      processandoLogin = false;
      print(a.user.email);
      //var prefs = await SharedPreferences.getInstance();
      //await prefs.setString(SharedPreferencesNames.uIdUser, fbUser.uid);
      notifyListeners();
      
    }catch(e){
      processandoLogin = false;
      print(e);
      notifyListeners();
    }
  }

  logout() async {
    processandoVerificacaoUsuarioLogado = true;
    notifyListeners();
    await FirebaseAuth.instance.signOut();
    fbUser = null;
    //var prefs = await SharedPreferences.getInstance();
    //await prefs.setString(SharedPreferencesNames.uIdUser, null);
    this.processandoVerificacaoUsuarioLogado = false;
    notifyListeners();
  }

  verificarUsuarioLogado() async
  {
    processandoVerificacaoUsuarioLogado = true;
    notifyListeners();
    this.fbUser = await FirebaseAuth.instance.currentUser();
    this.processandoVerificacaoUsuarioLogado = false;
    notifyListeners();

  }

  validarEmail(String email){
    emailValido = EmailValidator.validate(email);
    this.email = emailValido ? email : "";
    notifyListeners();
  }

  validarSenha(String senha){
    senhaValida = senha.length > 5;
    this.senha = senhaValida ? senha : "";
    notifyListeners();
  }
}