import 'package:bytebank/screens/transferencia/transferencias_lista.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ItemTransferenciasMenuBottomDashboard extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Material(
        color: Theme.of(context).primaryColor,
        child: InkWell(
          onTap: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => TransferenciasLista(),
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(8.0),
            height: 100,
            width: 163,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Icon(
                  Icons.monetization_on,
                  color: Colors.white,
                  size: 32.0,
                ),
                Text(
                  'Transferências',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
