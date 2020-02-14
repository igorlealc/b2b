import 'package:b2b/config/strings.dart';
import 'package:b2b/config/themes.dart';
import 'package:flutter/material.dart';

class AplicationConfig{

  String _nome;
  String _codigoCliente;
  String _urlDefault;
  String _logo;
  AppStrings _strings;
  ThemeData _theme;


  AplicationConfig._();

  AplicationConfig.Dev(){
     this._codigoCliente = "000";
     this._urlDefault = "http://192.168.254.56";
     this._logo = "assets/images/devlogo.png";
     this._nome = "B2B Nome";
     this._theme = devTheme();
     this._strings = AppStrings.Dev();
  }

  AplicationConfig.JCom(){
    this._codigoCliente = "001";
    this._urlDefault = "http://192.168.254.56";
    this._logo = "assets/images/jcom.png";
    this._nome = "B2B JCom";
    this._theme = jcomTheme();
    this._strings = AppStrings.JCom();
  }

  AplicationConfig.Maroni(){
    this._codigoCliente = "192";
    this._urlDefault = "http://192.168.254.56";
    this._logo = "assets/images/maroni.png";
    this._nome = "B2B Maroni";
    this._theme = maroniTheme();
    this._strings = AppStrings.Maroni();
  }

  String get codigoCliente{
    return _codigoCliente;
  }

  String get urlDefault{
    return _urlDefault;
  }

  String get imageAsset{
    return this._logo;
  }

  String get nome{
    return this._nome;
  }

  AppStrings get appStrings{
    return this._strings;
  }

  ThemeData get theme{
    return this._theme;
  }

}