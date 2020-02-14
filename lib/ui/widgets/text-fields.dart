import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetTextFormField extends StatelessWidget {
  String _label;
  IconButton _leftIcon;
  IconButton _rightIcon;
  bool _obscureText = false;
  TextInputAction _textInputAction;
  TextInputType _keyboardType;
  Function _onFieldSubmitted;
  FocusNode _focusNode;

  WidgetTextFormField(this._label,
      {IconButton leftIcon,
      IconButton rightIcon,
      bool obscureText = false,
      TextInputAction textInputAction,
      TextInputType keyboardType,
      Function onFieldSubmited,
      FocusNode focusNode
      }) {
    this._leftIcon = leftIcon;
    this._rightIcon = rightIcon;
    this._obscureText = obscureText;
    this._textInputAction = textInputAction;
    this._keyboardType = keyboardType;
    this._onFieldSubmitted = onFieldSubmited;
    this._focusNode = focusNode;

  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        obscureText: this._obscureText,
        keyboardType: this._keyboardType,
        textInputAction: this._textInputAction,
        onFieldSubmitted: this._onFieldSubmitted,
        focusNode: this._focusNode,
        style: TextStyle(
            color: Theme.of(context).iconTheme.color,
          fontSize: Theme.of(context).textTheme.display1.fontSize
        ),
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: this._label,
          prefixIcon: _leftIcon,
          suffixIcon: _rightIcon,
        ));
  }
}

class  WidgetTextField extends StatelessWidget {
  final String _label;
  IconButton _leftIcon;
  IconButton _rightIcon;
  bool _obscureText = false;
  TextInputAction _textInputAction;
  TextInputType _keyboardType;
  FocusNode _focusNode;

  WidgetTextField(this._label,
      {IconButton leftIcon,
        IconButton rightIcon,
        bool obscureText = false,
        TextInputAction textInputAction,
        TextInputType keyboardType,
        Function onFieldSubmited,
        FocusNode focusNode
      }) {
    this._leftIcon = leftIcon;
    this._rightIcon = rightIcon;
    this._obscureText = obscureText;
    this._textInputAction = textInputAction;
    this._keyboardType = keyboardType;
    this._focusNode = focusNode;

  }

  @override
  Widget build(BuildContext context) {
    return TextField(
        obscureText: this._obscureText,
        keyboardType: this._keyboardType,
        textInputAction: this._textInputAction,
        focusNode: this._focusNode,
        style: TextStyle(
            color: Theme.of(context).textTheme.display1.color,
            fontSize: Theme.of(context).textTheme.display1.fontSize

        ),
        decoration: InputDecoration(
          border: UnderlineInputBorder(),
          labelText: this._label,
          prefixIcon: _leftIcon,
          suffixIcon: _rightIcon,


        ));
  }
}
