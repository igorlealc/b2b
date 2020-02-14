import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class WidgetRaisedButton  extends StatelessWidget {
  Widget _child;
  Function _onPressed;

  WidgetRaisedButton({Widget child, Function onPressed}){
    this._child = child;
    this._onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return RaisedButton(
      child: _child,
      onPressed: _onPressed,
      color: Theme.of(context).buttonColor,
    );
  }
}

class WidgetFlatButton  extends StatelessWidget {

  Widget _child;
  Function _onPressed;

  WidgetFlatButton({Widget child, Function onPressed}){
    this._child = child;
    this._onPressed = onPressed;
  }

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      child: _child,
      onPressed: _onPressed,
      textColor: Theme.of(context).buttonColor,
    );
  }
}
