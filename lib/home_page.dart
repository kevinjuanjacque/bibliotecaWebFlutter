import 'dart:ui';

import 'package:app_flutter/widgets/drawer_lateral.dart';
import 'package:app_flutter/widgets/widget_common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String palabraClave;
  final _formKey = GlobalKey<FormState>();
  final imagesUlr = [
    'https://www.ucentral.cl/ucentral/site/artic/20191216/imag/foto_0000000220191216180600/Sin_titulo-77.jpg',
    'https://www.ucentral.cl/ucentral/site/artic/20130620/imag/foto_0000000320130620110805.jpg',
    'https://www.cooperativa.cl/noticias/site/artic/20190122/imag/foto_0000000120190122114202.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    final drawer = DrawerLateral();

    return Scaffold(
        appBar: appBarCommon(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              _swiperImage(),
              SizedBox(
                height: 30,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    _buscadorDocument(),
                    RaisedButton(
                        color: Colors.yellowAccent[700],
                        child: Text('Busca!'),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            Navigator.pushNamed(context, 'busqueda',
                                arguments: palabraClave);
                          }
                        })
                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: drawer.drawerIzquierda(context),
        endDrawer: drawerDerecha(context));
  }

  Widget _swiperImage() {
    return Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30.0),
        ),
        padding: EdgeInsets.only(top: 20),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.3,
        child: Swiper(
          itemBuilder: (BuildContext context, int index) {
            return ClipRRect(
                borderRadius: BorderRadius.circular(30.0),
                child: FadeInImage(
                    fit: BoxFit.fill,
                    placeholder: AssetImage('assets/loadingPackman.gif'),
                    image: NetworkImage(imagesUlr[index])));
          },
          itemCount: 3,
          viewportFraction: 0.8,
          scale: 0.9,
        ));
  }

  Widget _buscadorDocument() {
    return Container(
      padding: EdgeInsets.all(20),
      width: MediaQuery.of(context).size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.black12, borderRadius: BorderRadius.circular(10.0)),
      child: Column(
        children: <Widget>[
          Container(
              width: MediaQuery.of(context).size.width,
              child: Text(
                'BUSCADOR',
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 30.0),
              )),
          SizedBox(
            height: 50,
          ),
          TextFormField(
            validator: (value) {
              if (value.isEmpty) {
                return 'Debes Llenar el campo de busqueda';
              }
              return null;
            },
            onChanged: (e) {
              palabraClave = e;
            },
            decoration: InputDecoration(
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
                labelText: 'Que Buscas?',
                labelStyle: TextStyle(color: Colors.black)),
          ),
        ],
      ),
    );
  }
}
