import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';

class LoginBloc extends ChangeNotifier{

  bool processando = false;
  FirebaseUser fbUser = null;

  LoginBloc()
   {
    FirebaseAuth.instance.currentUser().then((user){
      fbUser = user;
      processando = false;
      notifyListeners();
    });

  }

  loginEmailSenha(String email,String senha) async {
    try {
      processando = true;
      notifyListeners();
      var a = await FirebaseAuth.instance.signInWithEmailAndPassword(email: email, password: senha);
      fbUser = a.user;
      processando = false;
      notifyListeners();
    }catch(e){
      processando = false;
      print(e);
      notifyListeners();
    }
  }

  logout() async {
    processando = true;
    notifyListeners();
    await FirebaseAuth.instance.signOut();
    fbUser = null;
    notifyListeners();
  }

}