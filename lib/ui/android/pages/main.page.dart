import 'package:b2b/blocs/login.bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var bloc = Provider.of<LoginBloc>(context);
    return Container(
      color: Colors.deepOrangeAccent,
      child: Center(
        child: FlatButton(child: Text("Sair"),
                onPressed: (){bloc.logout();},),
      ),
    );
  }
}
