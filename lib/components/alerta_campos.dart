 import 'package:flutter/material.dart';

Future<void> alertaPreencherCamposCorretamente(BuildContext context) async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Preencha os campos corretamente'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Por favor preencha os campos corretamente'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }