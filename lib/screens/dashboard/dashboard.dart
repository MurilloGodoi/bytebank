import 'package:bytebank/components/dashboard/item_contatos_menu_bottom_dashboard.dart';
import 'package:bytebank/components/dashboard/item_transferencias_menu_bottom_dashboard.dart';
import 'package:bytebank/screens/contatos/contatos_lista.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dashboard'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset('images/bytebank_logo.png'),
          ),
          Row(children: [
            ItemTransferenciasMenuBottomDashboard(),
            ItemContatosMenuBottomDashboard(),
          ],),
        ],
      ),
    );
  }
}
