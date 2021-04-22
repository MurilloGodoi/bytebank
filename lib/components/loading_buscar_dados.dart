import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoadingBuscarDados extends StatelessWidget {
  final String _textoStatus;
  const LoadingBuscarDados(this._textoStatus);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CircularProgressIndicator(),
          Text(_textoStatus),
        ],
      ),
    );
  }
}
