import 'package:app_flutter/widgets/text.dart';
import 'package:flutter/material.dart';

class DrawerLateral extends ChangeNotifier {
  final algo = TextVisibility();
  Widget drawerIzquierda(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(top: 30.0),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(color: Colors.yellowAccent[700]),
            child: DrawerHeader(
              child: Column(
                children: <Widget>[
                  Text(
                    'INICIAR\nSESION',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 35.0),
                  ),
                  Icon(
                    Icons.account_circle,
                    size: 50.0,
                  )
                ],
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: TextField(
              keyboardType: TextInputType.numberWithOptions(signed: true),
              decoration: InputDecoration(
                  suffixIcon: Icon(
                    Icons.supervisor_account,
                    color: Colors.blue[700],
                  ),
                  helperText: 'Ejemplo: 12345678-9',
                  fillColor: Colors.black,
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black,
                    ),
                    borderRadius: BorderRadius.circular(20.0),
                  ),
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.yellow[700],
                      ),
                      borderRadius: BorderRadius.circular(20.0)),
                  labelText: 'RUT',
                  labelStyle: TextStyle(color: Colors.black)),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20.0),
            child: algo,
          ),
        ],
      ),
    );
  }
}
