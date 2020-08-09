import 'package:flutter/material.dart';

Widget appBarCommon() {
  return AppBar(
    title: Text('Biblioteca Web'),
    backgroundColor: Colors.yellowAccent[700],
  );
}

Widget drawerDerecha(BuildContext context) {
  return Drawer(
      child: ListView(
    children: <Widget>[
      DrawerHeader(
          child: FadeInImage(
              placeholder: AssetImage('assets/infinity.gif'),
              image: NetworkImage(
                  'https://biblioteca-web-ucen.herokuapp.com/assets/iconoIcci.png'))),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              padding: EdgeInsets.only(top: 20.0),
              child: ListTile(
                leading: Icon(Icons.assignment),
                title: Text(
                  'Documentos',
                  style: TextStyle(fontSize: 20.0),
                ),
                onTap: () {
                  Navigator.pushNamed(context, 'documents');
                },
              )),
          Container(
              padding: EdgeInsets.only(top: 20.0),
              child: ListTile(
                leading: Icon(Icons.search),
                title: Text(
                  'Buscador',
                  style: TextStyle(fontSize: 20.0),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/');
                },
              )),
        ],
      )
    ],
  ));
}
