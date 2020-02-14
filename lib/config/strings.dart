class AppStrings{

  _defaultConfig(){
    _pageLoginEmail = "E-mail";
    _pageLoginSenha = "Senha";
    _pageLoginSigIn = "Cadastre-se";
    _pageLoginRecuperarSenha = "Esqueceu sua senha?";
    _pageLoginBtnLogin = "Entrar";
  }

  AppStrings.Dev(){
    _defaultConfig();
  }

  AppStrings.JCom(){
    _defaultConfig();
  }

  AppStrings.Maroni(){
    _defaultConfig();
  }

  //Page Login
  String _pageLoginEmail;
  String _pageLoginSenha;
  String _pageLoginSigIn;
  String _pageLoginRecuperarSenha;
  String _pageLoginBtnLogin;

  String get pageLoginEmail{
    return this._pageLoginEmail;
  }

  String get pageLoginSenha{
    return this._pageLoginSenha;
  }

  String get pageLoginSigIn{
    return this._pageLoginSigIn;
  }

  String get pageLoginRecuperarSenha{
    return this._pageLoginRecuperarSenha;
  }

  String get pageLoginBtnLogin{
    return this._pageLoginBtnLogin;
  }






}


